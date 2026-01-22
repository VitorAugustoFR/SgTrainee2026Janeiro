do while .t.
   clear

   nPrimeiroColocado := 0
   nSegundoColocado  := 0
   nTerceiroColocado := 0
   nMedia            := 0

   @ 01,01 say "Digite o peso dos tres primeiros colocados: "

   @ 02,01 get nPrimeiroColocado
   @ 03,01 get nSegundoColocado
   @ 04,01 get nTerceiroColocado
   read

   if LastKey() == 27
      nMenuOpcao := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
      if nMenuOpcao == 1

      elseif nMenuOpcao == 2
         loop
      elseif nMenuOpcao == 3
         exit
      endif
   endif

   nMedia := (nPrimeiroColocado + nSegundoColocado + nTerceiroColocado) / 3

   @ 05,01 say "Media de peso entre os tres primeiros colocados: " + AllTrim(Str(nMedia))
enddo