import assert from 'assert';
import {
  ContractDefinition,
  DoWhileStatement,
  Expression,
  FunctionCall,
  FunctionDefinition,
  FunctionKind,
  FunctionStateMutability,
  FunctionVisibility,
  Identifier,
  IfStatement,
  SourceUnit,
  Statement,
  VariableDeclaration,
  WhileStatement,
} from 'solc-typed-ast';
import { AST } from '../../ast/ast';
import { printNode } from '../../utils/astPrinter';
import { cloneASTNode } from '../../utils/cloning';
import { createCallToFunction, fixParameterScopes } from '../../utils/functionGeneration';
import {
  createBlock,
  createIdentifier,
  createParameterList,
  createReturn,
} from '../../utils/nodeTemplates';

// It's okay to use a global counter here as it only affects private functions
// and never anything that can be referenced from another file
let loopFnCounter = 0;

export function extractWhileToFunction(
  node: WhileStatement,
  variables: VariableDeclaration[],
  loopToContinueFunction: Map<number, FunctionDefinition>,
  ast: AST,
  prefix = '__warp_while',
): FunctionDefinition {
  const scope =
    node.getClosestParentByType<ContractDefinition>(ContractDefinition) ??
    node.getClosestParentByType(SourceUnit);
  assert(scope !== undefined, `Couldn't find ${printNode(node)}'s function target root`);

  // Create input parameters and keep the new referencing number in variablesRemapping
  // for later fixing
  const variablesRemapping: Map<number, VariableDeclaration> = new Map();
  const inputParams = variables.map((v) => {
    const param = cloneASTNode(v, ast);
    variablesRemapping.set(v.id, param);
    return param;
  });

  const retParams = createParameterList(
    variables.map((v) => cloneASTNode(v, ast)),
    ast,
  );
  const defId = ast.reserveId();
  const defName = `${prefix}${loopFnCounter++}`;

  const funcBody = createBlock(
    [createStartingIf(node.vCondition, node.vBody, variables, retParams.id, ast)],
    ast,
  );

  // Fixing references of identifiers to the new input variables
  funcBody
    .getChildren(true)
    .filter(
      (n): n is Identifier =>
        n instanceof Identifier && variablesRemapping.get(n.referencedDeclaration) !== undefined,
    )
    .forEach((id) => {
      const newDecl = variablesRemapping.get(id.referencedDeclaration);
      assert(newDecl !== undefined, 'There should be a variable declaration');
      id.referencedDeclaration = newDecl.id;
    });

  const funcDef = new FunctionDefinition(
    defId,
    node.src,
    scope.id,
    scope instanceof SourceUnit ? FunctionKind.Free : FunctionKind.Function,
    defName,
    false,
    FunctionVisibility.Private,
    FunctionStateMutability.NonPayable,
    false,
    createParameterList(inputParams, ast),
    retParams,
    [],
    undefined,
    funcBody,
  );

  fixParameterScopes(funcDef);

  loopToContinueFunction.set(defId, funcDef);

  scope.insertAtBeginning(funcDef);
  ast.registerChild(funcDef, scope);

  ast.insertStatementAfter(
    funcBody,
    createReturn(createLoopCall(funcDef, inputParams, ast), funcDef.vReturnParameters.id, ast),
  );

  return funcDef;
}

export function extractDoWhileToFunction(
  node: DoWhileStatement,
  variables: VariableDeclaration[],
  loopToContinueFunction: Map<number, FunctionDefinition>,
  ast: AST,
): FunctionDefinition {
  const doWhileFuncDef = extractWhileToFunction(
    node,
    variables,
    loopToContinueFunction,
    ast,
    '__warp_do_while_',
  );

  const doBlockDefName = `__warp_do_${loopFnCounter++}`;
  const doBlockRetParams = createParameterList(
    variables.map((v) => cloneASTNode(v, ast)),
    ast,
  );
  const doBlockFuncId = ast.reserveId();

  // Create input parameters and keep the new referencing number in variablesRemapping
  // for later fixing
  const variablesRemapping: Map<number, VariableDeclaration> = new Map();
  const doBlockParams = variables.map((v) => {
    const param = cloneASTNode(v, ast);
    variablesRemapping.set(v.id, param);
    return param;
  });

  const doBlockBody = createBlock(
    [
      cloneASTNode(node.vBody, ast),
      createReturn(createLoopCall(doWhileFuncDef, variables, ast), doBlockRetParams.id, ast),
    ],
    ast,
  );

  // Fixing references of identifiers to the new input variables
  doBlockBody
    .getChildren(true)
    .filter(
      (n): n is Identifier =>
        n instanceof Identifier && variablesRemapping.get(n.referencedDeclaration) !== undefined,
    )
    .forEach((id) => {
      const newDecl = variablesRemapping.get(id.referencedDeclaration);
      assert(newDecl !== undefined, 'There should be a variable declaration');
      id.referencedDeclaration = newDecl.id;
    });

  const doBlockFuncDef = new FunctionDefinition(
    doBlockFuncId,
    node.src,
    doWhileFuncDef.scope,
    doWhileFuncDef.kind,
    doBlockDefName,
    false,
    FunctionVisibility.Private,
    FunctionStateMutability.NonPayable,
    false,
    createParameterList(doBlockParams, ast),
    doBlockRetParams,
    [],
    undefined,
    doBlockBody,
  );

  fixParameterScopes(doBlockFuncDef);

  doWhileFuncDef.vScope.insertAtBeginning(doBlockFuncDef);
  ast.registerChild(doBlockFuncDef, doWhileFuncDef.vScope);
  loopToContinueFunction.set(doBlockFuncId, doWhileFuncDef);

  return doBlockFuncDef;
}

function createStartingIf(
  condition: Expression,
  body: Statement,
  variables: VariableDeclaration[],
  retParamsId: number,
  ast: AST,
): IfStatement {
  return new IfStatement(
    ast.reserveId(),
    '',
    cloneASTNode(condition, ast),
    cloneASTNode(body, ast),
    createReturn(variables, retParamsId, ast),
  );
}

export function createLoopCall(
  loopFunction: FunctionDefinition,
  variables: VariableDeclaration[],
  ast: AST,
): FunctionCall {
  return createCallToFunction(
    loopFunction,
    variables.map((v) => createIdentifier(v, ast)),
    ast,
  );
}
