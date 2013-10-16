module Exercise1 where
import Text.Parsec
import Text.Parsec.String(Parser)
import Control.Applicative(pure,(<$>),(<$),(*>),(<*),(<*>),(<**>))
import VanillaLexer

test1 = run pE "2*3*4+5+6"
-- >>> run pE "2*3*4+5+6"
-- Right 40

run p = parse (spaces *> p <* eof) "stdin"

num = integer
eps = pure  

type T = Integer -- can be replaced by parse tree

pE :: Parser T
pE = pF <**> pE'
pE' :: Parser (T -> T)
pE' = e1 <|> e2 where
  e1 = build <$> (char '*' *> pE) <*> (char '+' *> pF) where
  e2 = eps id
  build e f t = t * e + f
  
pF = parens pE <|> integer

