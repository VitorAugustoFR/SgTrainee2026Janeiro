set scoreBoard off

clear

nColuna := 5 //ate 15
nLinha  := 10 //ate 45
cCor    := "G/G"

//@ 01,01 say "Digite uma cor "

do while .t.
   @ nColuna,nLinha say " " color cCor

   if nLinha < 45 
      nLinha++
   end if
   if nLinha == 45 .and. nColuna < 15
      nColuna++
   end if
   Inkey(1)
enddo