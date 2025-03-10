import {
  Assignment,
  DataLocation,
  ExpressionStatement,
  getNodeType,
  Identifier,
  PointerType,
  Return,
  TupleType,
  UnaryOperation,
  VariableDeclaration,
} from 'solc-typed-ast';
import { AST } from '../ast/ast';
import { ASTMapper } from '../ast/mapper';
import { cloneDocumentation } from '../utils/cloning';
import { getDefaultValue } from '../utils/defaultValueNodes';

export class DeleteHandler extends ASTMapper {
  visitUnaryOperation(node: UnaryOperation, ast: AST): void {
    if (node.operator !== 'delete') {
      return this.commonVisit(node, ast);
    }

    const nodeType = getNodeType(node.vSubExpression, ast.compilerVersion);
    // Deletetion from storage is handled in References
    if (
      (nodeType instanceof PointerType && nodeType.location === DataLocation.Storage) ||
      (node instanceof Identifier &&
        node.vReferencedDeclaration instanceof VariableDeclaration &&
        node.vReferencedDeclaration.stateVariable)
    ) {
      return;
    }

    const newNode = getDefaultValue(nodeType, node, ast);
    ast.replaceNode(
      node,
      new Assignment(
        ast.reserveId(),
        node.src,
        nodeType.pp(),
        '=',
        node.vSubExpression,
        newNode,
        node.raw,
      ),
    );
  }

  visitReturn(node: Return, ast: AST): void {
    let visited = false;
    if (node.vExpression) {
      const nodeType = getNodeType(node.vExpression, ast.compilerVersion);
      if (nodeType instanceof TupleType && nodeType.getChildren().length === 0) {
        const statement = new ExpressionStatement(
          ast.reserveId(),
          node.src,
          node.vExpression,
          cloneDocumentation(node.documentation, ast, new Map<number, number>()),
          node.raw,
        );
        ast.insertStatementBefore(node, statement);
        node.vExpression = undefined;
        this.commonVisit(statement, ast);
        visited = true;
      }
    }
    if (!visited) this.commonVisit(node, ast);
  }
}
