clear

cSexo            := space(1)
cGostouDoProduto := space(1)
nLinhaSexo       := 1
nLinhaGostou     := 2
nColuna          := 01

for i := 1 to 50
   @ nLinhaSexo,nColuna   say "Digite seu sexo..: "
   @ nLinhaGostou,nColuna say "Gostou do produto? "

   @ nLinhaSexo,19 get cSexo            picture '@!' valid cSexo $ "FM"
   @ nLinhaSexo,19 get cGostouDoProduto picture '@!' valid cGostouDoProduto $ "SN"
   read

   nLinhaSexo   += 2
   nLinhaGostou += 2

   if nLinhaGostou > 24
      nLinhaSexo   := 0
      nLinhaGostou := 0
      nColuna      := 23
   endif
next