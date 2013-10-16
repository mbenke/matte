module Exercise1 where
import Text.Parsec
import Text.Parsec.String(Parser)
import Control.Applicative(pure,(<$>),(<$),(*>),(<*),(<*>),(<**>))
import VanillaLexer

test1 = run pE "2*3*4+5+6"
-- >>> test1
-- Right 40
test2 = run pE "1*2+3*4+5"
-- >>> test2
-- Right 25

run p = parse (spaces *> p <* eof) "stdin"

num = integer
eps = pure  

type T = Integer -- can be replaced by parse tree

pE :: Parser T
pE = pF <**> pE'
pE' :: Parser (T -> T)
pE' = e1 <|> e2 where
  e1 = build <$> (char '*' *> pE) <*> (char '+' *> pF) <*> pE' where
  e2 = eps id
  build e f g = g . (+f) . (*e) -- (t * e + f)
  
pF = parens pE <|> integer

