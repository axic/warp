import { ImportDirective, SourceUnit } from 'solc-typed-ast';

import { AST } from '../ast/ast';
import { ASTMapper } from '../ast/mapper';
import { WillNotSupportError } from '../utils/errors';

const PATH_REGEX = /^[\w-/\\]*$/;

export function manglePath(path: string): string {
  return path.replaceAll('_', '__').replaceAll('-', '_');
}

export function checkPath(path: string) {
  const pathWithoutExtension = path.substring(0, path.length - '.sol'.length);
  if (!PATH_REGEX.test(pathWithoutExtension)) {
    throw new WillNotSupportError(
      'File path includes unsupported characters, only _, -, /, , and alphanumeric characters are supported',
    );
  }
}

export class FilePathMangler extends ASTMapper {
  visitImportDirective(node: ImportDirective, _: AST): void {
    node.absolutePath = manglePath(node.absolutePath);
  }

  visitSourceUnit(node: SourceUnit, ast: AST): void {
    checkPath(node.absolutePath);
    this.commonVisit(node, ast);
    node.absolutePath = manglePath(node.absolutePath);
  }
}
