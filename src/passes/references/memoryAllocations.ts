import assert from 'assert';
import {
  ArrayTypeName,
  DataLocation,
  FunctionCall,
  FunctionCallKind,
  Literal,
  LiteralKind,
  NewExpression,
  TupleExpression,
  typeNameToTypeNode,
} from 'solc-typed-ast';
import { AST } from '../../ast/ast';
import { printNode } from '../../utils/astPrinter';
import { CairoType, TypeConversionContext } from '../../utils/cairoTypeSystem';
import { NotSupportedYetError } from '../../utils/errors';
import { createCairoFunctionStub, createCallToFunction } from '../../utils/functionGeneration';
import {
  createArrayTypeName,
  createNumberTypeName,
  createStringTypeName,
  createUint256Literal,
  createUint256TypeName,
} from '../../utils/nodeTemplates';
import { getStringLiteralBytesLength, toHexString } from '../../utils/utils';
import { ReferenceSubPass } from './referenceSubPass';

/*
  Handles expressions that directly insert data into memory: struct constructors, news, and inline arrays
  Requires expected data location analysis to determine whether to insert objects into memory
  For memory objects, functions are generated that return a felt associated with the start of the data
  For others, they are as explicit expressions to be transpiled to cairo
*/
export class MemoryAllocations extends ReferenceSubPass {
  visitFunctionCall(node: FunctionCall, ast: AST): void {
    this.visitExpression(node, ast);

    const [actualLoc, expectedLoc] = this.getLocations(node);

    if (
      node.kind === FunctionCallKind.StructConstructorCall &&
      this.expectedDataLocations.get(node) === DataLocation.Memory
    ) {
      const replacement = ast.getUtilFuncGen(node).memory.struct.gen(node);
      this.replace(node, replacement, undefined, actualLoc, expectedLoc, ast);
    } else if (node.vExpression instanceof NewExpression) {
      if (this.expectedDataLocations.get(node) === DataLocation.Memory) {
        this.allocateMemoryDynArray(node, ast);
      } else {
        throw new NotSupportedYetError(
          `Allocating dynamic ${
            this.expectedDataLocations.get(node) ?? 'unknown-location'
          } arrays not implemented yet`,
        );
      }
    }
  }

  visitLiteral(node: Literal, ast: AST): void {
    if (node.kind !== LiteralKind.String && node.kind !== LiteralKind.UnicodeString) {
      return this.visitExpression(node, ast);
    }

    this.allocateString(node, ast);
  }

  visitTupleExpression(node: TupleExpression, ast: AST): void {
    this.visitExpression(node, ast);

    const [actualLoc, expectedLoc] = this.getLocations(node);

    if (!node.isInlineArray) return;
    if (this.expectedDataLocations.get(node) !== DataLocation.Memory) return;

    const replacement = ast.getUtilFuncGen(node).memory.arrayLiteral.gen(node);
    this.replace(node, replacement, undefined, actualLoc, expectedLoc, ast);
  }

  //---------------------------------------------------------------------------
  // Stub generation

  allocateMemoryDynArray(node: FunctionCall, ast: AST): void {
    assert(node.vExpression instanceof NewExpression);

    assert(
      node.vArguments.length === 1,
      `Expected new expression ${printNode(node)} to have one argument, has ${
        node.vArguments.length
      }`,
    );

    const stub = createCairoFunctionStub(
      'wm_new',
      [
        ['len', createUint256TypeName(ast)],
        ['elemWidth', createUint256TypeName(ast)],
      ],
      [['loc', node.vExpression.vTypeName, DataLocation.Memory]],
      ['range_check_ptr', 'warp_memory'],
      ast,
      node,
    );

    assert(node.vExpression.vTypeName instanceof ArrayTypeName);

    const elementCairoType = CairoType.fromSol(
      typeNameToTypeNode(node.vExpression.vTypeName.vBaseType),
      ast,
      TypeConversionContext.MemoryAllocation,
    );

    const call = createCallToFunction(
      stub,
      [node.vArguments[0], createUint256Literal(BigInt(elementCairoType.width), ast)],
      ast,
    );

    const [actualLoc, expectedLoc] = this.getLocations(node);
    this.replace(node, call, undefined, actualLoc, expectedLoc, ast);
    ast.registerImport(call, 'warplib.memory', 'wm_new');
  }

  allocateString(node: Literal, ast: AST): void {
    assert(node.kind === LiteralKind.String || node.kind === LiteralKind.UnicodeString);

    const parent = node.parent;

    const length = getStringLiteralBytesLength(node);
    const characterArray = splitLiteralToTuple(node, length, ast);

    const stub = createCairoFunctionStub(
      'wm_string',
      [
        [
          'characters',
          createArrayTypeName(createNumberTypeName(8, false, ast), length, ast),
          DataLocation.Memory,
        ],
        ['len', createUint256TypeName(ast)],
      ],
      [['loc', createStringTypeName(ast), DataLocation.Memory]],
      ['range_check_ptr', 'warp_memory'],
      ast,
      node,
    );

    const call = createCallToFunction(
      stub,
      [characterArray, createUint256Literal(BigInt(length), ast)],
      ast,
    );

    const expectedLoc = this.getLocations(node)[1];
    this.replace(node, call, parent, DataLocation.Memory, expectedLoc, ast);
    ast.registerImport(call, 'warplib.memory', 'wm_string');
  }
}

function splitLiteralToTuple(node: Literal, length: number, ast: AST): TupleExpression {
  const elements: Literal[] = [];
  for (let i = 0; i < node.hexValue.length; i += 2) {
    const byte = `0x${node.hexValue[i]}${node.hexValue[i + 1]}`;
    elements.push(
      new Literal(ast.reserveId(), '', 'uint8', LiteralKind.Number, toHexString(byte), byte),
    );
  }

  const tuple = new TupleExpression(ast.reserveId(), '', `uint8[${length}]`, true, elements);
  ast.setContextRecursive(tuple);
  return tuple;
}
