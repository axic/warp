import {
  ArrayType,
  DataLocation,
  FunctionDefinition,
  getNodeType,
  MappingType,
  PointerType,
  StructDefinition,
  TypeNode,
  UserDefinedType,
  VariableDeclaration,
  VariableDeclarationStatement,
} from 'solc-typed-ast';
import { AST } from '../../ast/ast';
import { ASTMapper } from '../../ast/mapper';
import { cloneASTNode } from '../../utils/cloning';
import { collectUnboundVariables } from '../../utils/functionGeneration';
import { createIdentifier } from '../../utils/nodeTemplates';
import { isExternallyVisible } from '../../utils/utils';

export class RefTypeModifier extends ASTMapper {
  /*
  This pass filters the inputParameters of FunctionDefintions for reference types sitting in 
  memory that are not DynArrays. 
  
  The original dataLocation of each of the filtered VariableDeclarations is then set to CallData.
  
  A VariableDeclarationStatement is then inserted into the beginning of the fuction body with a 
  cloned VariableDeclaration with the DataLocation set to Memory the and the initialValue being an 
  Identifier referencing the original VariableDeclaration in the Parameter list, 
  with the DataLocation as CallData. 

  This will trigger the dataAccessFunctionalizer to insert the necccessary write UtilGens from 
  CallDataToMemory.

  Before pass:

  struct structDef {
    uint8 member1;
    uint8 member2;
  }

  function testReturnMember(structDef memory structA) pure external returns (uint8) {
    return structA.member1;
  }
  
  After pass:

  function testReturnMember(structDef calldata structA) external pure returns (uint8) {
      structDef memory __warp_usrid2_structA_mem = structA;
      return structA_mem.__warp_usrid0_member1;
  }
  */

  visitFunctionDefinition(node: FunctionDefinition, ast: AST): void {
    const body = node.vBody;

    if (isExternallyVisible(node) && body !== undefined) {
      [...collectUnboundVariables(body).entries()]
        .filter(
          ([decl]) =>
            node.vParameters.vParameters.includes(decl) &&
            decl.storageLocation === DataLocation.Memory &&
            this.isReferenceType(getNodeType(decl, ast.compilerVersion)) &&
            !this.isDynamicMemoryArray(getNodeType(decl, ast.compilerVersion)),
        )
        .forEach(([decl, ids]) => {
          const wmDecl = cloneASTNode(decl, ast);
          wmDecl.name = wmDecl.name + '_mem';
          decl.storageLocation = DataLocation.CallData;
          const varDeclStatement = this.createVariableDeclarationStatement(decl, wmDecl, ast);
          body.insertAtBeginning(varDeclStatement);
          ids.forEach((id) => ast.replaceNode(id, createIdentifier(wmDecl, ast)));
        });
      ast.setContextRecursive(node);
    }
    this.commonVisit(node, ast);
  }

  isReferenceType(type: TypeNode): boolean {
    return (
      type instanceof ArrayType ||
      type instanceof MappingType ||
      (type instanceof UserDefinedType && type.definition instanceof StructDefinition) ||
      (type instanceof PointerType && this.isReferenceType(type.to))
    );
  }
  // Change the other instance of this function to isDynamicMemoryArrayRef

  isDynamicMemoryArray(type: TypeNode) {
    return type instanceof ArrayType && type.size === undefined ? true : false;
  }

  private createVariableDeclarationStatement(
    cdDecl: VariableDeclaration,
    wmDecl: VariableDeclaration,
    ast: AST,
  ): VariableDeclarationStatement {
    const structDeclarationStatement = new VariableDeclarationStatement(
      ast.reserveId(),
      '',
      [wmDecl.id],
      [wmDecl],
      createIdentifier(cdDecl, ast),
    );
    return structDeclarationStatement;
  }
}
