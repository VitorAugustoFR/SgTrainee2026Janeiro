set scoreBoard off
set date Brit
set epoch to 1940

clear

cNome       := space(20)
dNascimento := CToD("")
dDataAtual  := date()
nIdade      := 0

@ 00,00 to 07,79

@ 01,01 say "Digite seu nome e sua idade: "
@ 02,01 say "Nome.......................: "
@ 03,01 say "Data de nascimento.........: "

@ 02,29 get cNome  picture "@!" valid !Empty(cNome)
@ 03,29 get dNascimento valid nIdade >= 0 .and. nIdade <= 130
read

nAnoNascimento := Year(dNascimento)
nMesNascimento := Month(dNascimento)
nDiaNascimento := Day(dNascimento)

nAnoAtual := Year(dDataAtual)
nMesAtual := Month(dDataAtual)
nDiaAtual := Day(dDataAtual)

nIdade :=  nAnoAtual - nAnoNascimento
if nMesNascimento > nMesAtual
   nIdade--
endif
if nMesNascimento == nMesAtual
   if nDiaNascimento > nDiaAtual
      nIdade--
   endif
endif

@ 04,01 say "Sua idade e: " + AllTrim(Str(nIdade))

if nIdade < 21
   @ 05,01 say "Voce nao tem mais de 21 anos de idade"
elseif nIdade >= 21 
   @ 05,01 say "Voce tem mais de 21 anos de idade"
endif