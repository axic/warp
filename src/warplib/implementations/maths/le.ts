import { BinaryOperation } from 'solc-typed-ast';
import { AST } from '../../../ast/ast';
import { Implicits } from '../../../utils/implicits';
import { generateFile, forAllWidths, msb, Comparison } from '../../utils';

export function le_signed() {
  generateFile(
    'le_signed',
    [
      'from starkware.cairo.common.bitwise import bitwise_and',
      'from starkware.cairo.common.cairo_builtins import BitwiseBuiltin',
      'from starkware.cairo.common.math_cmp import is_le_felt',
      'from starkware.cairo.common.uint256 import Uint256, uint256_signed_le',
    ],
    forAllWidths((width) => {
      if (width === 256) {
        return [
          `func warp_le_signed${width}{range_check_ptr}(lhs : Uint256, rhs : Uint256) -> (res : felt):`,
          '    return uint256_signed_le(lhs, rhs)',
          'end',
        ];
      } else {
        return [
          `func warp_le_signed${width}{bitwise_ptr : BitwiseBuiltin*, range_check_ptr}(`,
          `        lhs : felt, rhs : felt) -> (res : felt):`,
          `    alloc_locals`,
          `    let (lhs_msb : felt) = bitwise_and(lhs, ${msb(width)})`,
          `    let (rhs_msb : felt) = bitwise_and(rhs, ${msb(width)})`,
          `    local bitwise_ptr : BitwiseBuiltin* = bitwise_ptr`,
          `    if lhs_msb == 0:`,
          `        # lhs >= 0`,
          `        if rhs_msb == 0:`,
          `            # rhs >= 0`,
          `            let (result) = is_le_felt(lhs, rhs)`,
          `            return (result)`,
          `        else:`,
          `            # rhs < 0`,
          `            return (0)`,
          `        end`,
          `    else:`,
          `        # lhs < 0`,
          `        if rhs_msb == 0:`,
          `            # rhs >= 0`,
          `            return (1)`,
          `        else:`,
          `            # rhs < 0`,
          `            # (signed) lhs <= rhs <=> (unsigned) lhs >= rhs`,
          `            let (result) = is_le_felt(rhs, lhs)`,
          `            return (result)`,
          `        end`,
          `    end`,
          `end`,
        ];
      }
    }),
  );
}

export function functionaliseLe(node: BinaryOperation, ast: AST): void {
  const implicitsFn = (wide: boolean, signed: boolean): Implicits[] => {
    if (!wide && signed) return ['range_check_ptr', 'bitwise_ptr'];
    else return ['range_check_ptr'];
  };

  Comparison(node, 'le', 'signedOrWide', true, implicitsFn, ast);
}
