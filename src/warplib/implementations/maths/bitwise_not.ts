import { UnaryOperation } from 'solc-typed-ast';
import { AST } from '../../../ast/ast';
import { Implicits } from '../../../utils/implicits';
import { forAllWidths, generateFile, IntFunction, mask } from '../../utils';

export function bitwise_not(): void {
  generateFile(
    'bitwise_not',
    [
      'from starkware.cairo.common.bitwise import bitwise_xor',
      'from starkware.cairo.common.cairo_builtins import BitwiseBuiltin',
      'from starkware.cairo.common.uint256 import Uint256, uint256_not',
    ],
    forAllWidths((width) => {
      if (width === 256) {
        return [
          'func warp_bitwise_not256{range_check_ptr}(op : Uint256) -> (res : Uint256):',
          '    return uint256_not(op)',
          'end',
        ];
      } else {
        return [
          `func warp_bitwise_not${width}{bitwise_ptr : BitwiseBuiltin*}(op : felt) -> (res : felt):`,
          `    return bitwise_xor(op, ${mask(width)})`,
          'end',
        ];
      }
    }),
  );
}

export function functionaliseBitwiseNot(node: UnaryOperation, ast: AST): void {
  const implicitsFn = (wide: boolean): Implicits[] => {
    if (wide) return ['range_check_ptr'];
    else return ['bitwise_ptr'];
  };
  IntFunction(node, node.vSubExpression, 'bitwise_not', 'bitwise_not', implicitsFn, ast);
}
