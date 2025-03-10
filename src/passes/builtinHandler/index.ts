import { AST } from '../../ast/ast';
import { ASTMapper } from '../../ast/mapper';
import { MathsOperationToFunction } from './MathsOperationToFunction';
import { ExplicitConversionToFunc } from './explicitConversionToFunc';
import { MsgSender } from './msgSender';
import { ShortCircuitToConditional } from './shortCircuitToConditional';
import { ThisKeyword } from './thisKeyword';
import { Ecrecover } from './ecrecover';
import { Keccak } from './keccak';

export class BuiltinHandler extends ASTMapper {
  static map(ast: AST): AST {
    ast = MsgSender.map(ast);
    ast = Ecrecover.map(ast);
    ast = Keccak.map(ast);
    ast = ExplicitConversionToFunc.map(ast);
    ast = ShortCircuitToConditional.map(ast);
    ast = MathsOperationToFunction.map(ast);
    ast = ThisKeyword.map(ast);
    return ast;
  }
}
