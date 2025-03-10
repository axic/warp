import assert from 'assert';
import { ElementaryTypeName, TypeName, typeNameToTypeNode } from 'solc-typed-ast';
import { AST } from '../ast/ast';
import { ASTMapper } from '../ast/mapper';

class AssertTypeStrings extends ASTMapper {
  visitTypeName(node: TypeName, ast: AST): void {
    this.commonVisit(node, ast);
    assert(node.typeString !== undefined, 'Undefined typestring found for TypeName');
  }
}

export class TypeStringsChecker extends ASTMapper {
  visitElementaryTypeName(node: ElementaryTypeName, _ast: AST): void {
    if (node.typeString === undefined) {
      node.typeString = typeNameToTypeNode(node).pp();
    }
  }

  static map(ast: AST): AST {
    ast.roots.forEach((root) => {
      const mapper = new this();
      mapper.dispatchVisit(root, ast);
    });

    ast.roots.forEach((root) => {
      const mapper = new AssertTypeStrings();
      mapper.dispatchVisit(root, ast);
    });
    return ast;
  }
}
