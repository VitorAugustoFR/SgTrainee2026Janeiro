SetMode(25,80)

clear

nNumero    := 0
nResultado := 0

@ 01,01 say "Digite um numero para ver sua tabuada do 1 ao 10: "

@ 01,50 get nNumero picture '99999' valid !Empty(nNumero)
read

@ 02,00 to 13,20
for i := 1 to 10
   nResultado := nNumero * i
   @ i + 2, 01 say AllTrim(Str(i)) + " * " + Alltrim(Str(nNumero)) + " = " + AllTrim(Str(nResultado))
next
inkey(0)