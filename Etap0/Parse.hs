module Parse where
import Text.Parsec
import qualified Text.Parsec.Token as PT
-- import Text.Parsec.Token 
import Text.Parsec.Language(emptyDef,haskellDef)
import Control.Applicative((<$>),(<$),(*>),(<*))
run p = parse (whiteSpace *> p <* eof) "stdin"
lexer = PT.makeTokenParser lexDef
lexDef = emptyDef { 
  PT.reservedOpNames = ["*","/","+","-"]
  }
         

integer = Int <$> PT.integer lexer
operator = op "-" <|> op "+"
  where op s = Op s <$ PT.reservedOp lexer s
        
whiteSpace = PT.whiteSpace lexer

data Item = Int Integer | Op String deriving Show

-- Kind of works but still cannot handle "1 2--3" or even "+-3"
items  = many item
item = try integer <|> operator

test = run items
good1 = test "1 2- -3"
good2 = test "+ -3"
prob1 = test "1 2--3"
prob2 = test "+-3"