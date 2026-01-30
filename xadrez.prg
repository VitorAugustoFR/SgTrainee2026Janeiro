//tabuleiro Branco, 8 x 8
set scoreBoard off
setColor("N/RB")

//cores das pecas
cTorre                := "T"
cBispo                := "B"
cCavalo               := "C"
cPeao                 := "P"
cRainha               := "R"
cRei                  := "R"
cLocaisParaMovimentar := "W/W"
cPecasComiveis        := "R/R"

nCoordenadasDasPecas  := Array(16,16)

clear

for i := 1 to 8
  for n := 1 to 8
   @ i,n say " " color 'W/W'
   n++
  next
  i++
next
for i := 2 to 8
  for n := 2 to 8
   @ i,n say " " color 'W/W'
   n++
  next
  i++
next

for i := 1 to 8
   for n := 2 to 8
      @ i,n say " " color 'N/N'
      n++
   next
   i++
next
for i := 2 to 8
   for n := 1 to 8
      @ i,n say " " color 'N/N'
      n++
   next
   i++
next

if posicaoh % 2 == 0
   if posicaov % 2 == 0
      cCOr := "RB/W"

@ 01,01 say cTorre color 'RB/W'
@ 01,08 say cTorre

@ 01,02 say cCavalo
@ 01,07 say cCavalo

@ 01,03 say cBispo
@ 01,06 say cBispo

@ 01,04 say cRei
@ 01,05 say cRainha


//
@ 15,01 say cTorre
@ 15,15 say cTorre

@ 15,03 say cCavalo
@ 15,13 say cCavalo

@ 15,05 say cBispo
@ 15,11 say cBispo

@ 15,07 say cRei
@ 15,09 say cRainha

if LastKey() == 13
   if cPecaAtual $ "TCBRP"

   endif
endif
Inkey(0)