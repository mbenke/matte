module VanillaLexer where
import qualified Text.Parsec.Token as PT
import Text.Parsec.Language(emptyDef,haskellDef)

lexer = PT.makeTokenParser emptyDef
integer = PT.integer lexer
operator = PT.operator lexer
parens = PT.parens lexer
braces = PT.braces lexer
