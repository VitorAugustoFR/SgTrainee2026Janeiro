set date Brit
set epoch to 1940

clear

cNome       := space(30)
dNascimento := CtoD("")
nPeso       := 0// 9.999,99
cDados      := space(44)

@ 01,01 say "Digite"
@ 02,01 say "Nome..............: "
@ 03,01 say "Data de nascimento: "
@ 04,01 say "Peso..............: "

@ 02,20 get cNome picture '@!'          valid !Empty(cNome)
@ 03,20 get dNascimento                 valid dNascimento < Date()
@ 04,20 get nPeso picture '@E 9,999.99' valid nPeso > 0
read

cDados := cNome + DToC(dNascimento) + Str(nPeso)
@ 10,01 say cDados
Inkey(0)

clear

@ 01,01 say "Nome..............: " + SubStr(cDados,1,30)
@ 02,01 say "Data de nascimento: " + SubStr(cDados,31,8)
@ 03,01 say "Peso..............: " + SubStr(cDados,40,6)