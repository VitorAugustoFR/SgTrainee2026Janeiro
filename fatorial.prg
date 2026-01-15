SetMode (25,80)

clear

nFatorado  := 0
nResultado := 0

@ 01,01 say "Digite um numero para fatoralo: !"

@ 01,34 get nFatorado picture "9999" 
read

for i:=1 to nFatorado
   nResultado += i
next
@ 03,01 say "A fatoracao do numero " + AllTrim(Str(nFatorado)) + " e equivalente a " + AllTrim(Str(nResultado))