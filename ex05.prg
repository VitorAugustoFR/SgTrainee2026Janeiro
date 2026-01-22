do while .t.
   clear
   nValorBanana    := 0
   nValorMaca      := 0
   nTrocaDeValores := 0

   @ 01,01 say "Digite os valores dos respectivos produtos"
   @ 02,01 say "Banana: "
   @ 03,01 say "Maca..: "

   @ 02,08 get nValorBanana
   @ 03,08 get nValorMaca
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

   nTrocaDeValores := nValorBanana
   nValorBanana    := nValorMaca
   nValorMaca      := nTrocaDeValores

   @ 06,01 say "Valores iniciais apos a troca"
   @ 07,01 say "Banana: " + Alltrim(Str(nValorBanana))
   @ 08,01 say "Maca..: " + Alltrim(Str(nValorMaca))
enddo