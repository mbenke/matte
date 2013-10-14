matte
=====

Reimplement Latte subsets using Parsec

# Prospekt

## Etap 0

```
Exp ::= Int | Exp Exp Op
Op ::= '+' | '-' | '*' | '~'
```

## Etap 1

```
Prog. Program ::= [Stmt]
SExp. Stmt ::= Exp ';'

ExpAdd.            Exp5              ::= Exp5 "+"  Exp6 ;
ExpSub.            Exp5              ::= Exp5 "-"  Exp6 ;
ExpMul.            Exp6              ::= Exp6 "*"  Exp7 ;
ExpDiv.            Exp6              ::= Exp6 "/"  Exp7 ;
ExpMod.            Exp6              ::= Exp6 "%"  Exp7 ;
ExpInt.            Exp9              ::= Integer ;
```

Semantyka: obliczenie wyrażenia e powoduje wypisanie jego wartości + LF

## Etap 2 

```
SAss. Stmt ::= Ident = Exp ';'
ExpVar. Exp9 ::= Ident
```