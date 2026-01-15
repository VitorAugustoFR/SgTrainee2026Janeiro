SetMode(35,80)

clear

cPalavra          := space(20)
cPalavraInvertida := space(20)

@ 01,01 say "Digite uma palavra para inverte-la: "

@ 01,36 get cPalavra picture '@!' valid !Empty(cPalavra)
read

nTamanhoPalavra := Len(AllTrim(cPalavra))

for i := 0 to nTamanhoPalavra - 1
   cPalavraInvertida += SubStr(Alltrim(cPalavra), nTamanhoPalavra - i, 1)
next

@ 03,01 say "Palavra normal...: " + Alltrim(cPalavra)
@ 04,01 say "Palavra invertida: " + AllTrim(cPalavraInvertida)