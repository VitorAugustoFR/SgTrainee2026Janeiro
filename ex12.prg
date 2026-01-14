set scoreBoard off

clear

nInteiroUm := 0
nInteiroDois := 0
nInteiroTres := 0

@ 01,01 say "Digite Tres numeros inteiros: "

@ 02,01 get nInteiroUm   picture "99999"
@ 03,01 get nInteiroDois picture "99999"
@ 04,01 get nInteiroTres picture "99999"
read

if nInteiroUm > nInteiroDois .and. nInteiroUm > nInteiroTres
   @ 06,01 say "O inteiro: " + AllTrim(Str(nInteiroUm)) + " e o maior"
elseif nInteiroDois > nInteiroUm .and. nInteiroDois > nInteiroTres
   @ 06,01 say "O inteiro: " + AllTrim(Str(nInteiroDois)) + " e o maior"
else
   @ 06,01 say "O inteiro: " + AllTrim(Str(nInteiroTres)) + " e o maior"
endif
InKey(1)