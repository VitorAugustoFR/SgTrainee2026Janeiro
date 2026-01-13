set scoreBoard off
clear

cNome  := space(20)
nIdade := 0

@ 00,00 to 07,79

@ 01,01 say "Digite seu nome e sua idade: "
@ 02,01 say "Nome.......................: "
@ 03,01 say "Idade......................: "

@ 02,29 get cNome  picture "@!" valid !Empty(cNome)
@ 03,29 get nIdade picture "999" valid nIdade >= 0 .and. nIdade <= 130
read

if nIdade < 21
   @ 05,01 say "Voce nao tem mais de 21 anos de idade e nao pode beber alcool nos EUA!"
   if nIdade < 18
      @06,01 say "Voce nao tem mais de 18 anos de idade e tambem nao pode beber no Brasil!"
   else
      @06,01 say "Mas tem mais de 18 e pode beber no Brasil!"
   endif
elseif nIdade >= 21 
   @ 05,01 say "Voce tem mais de 21 anos de idade e pode beber alcool nos EUA!"
endif