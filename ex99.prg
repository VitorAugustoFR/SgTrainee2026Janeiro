do while .t.
   clear

   nPrimeiroNumero := 0
   nSegundoNumero  := 0
   nterceiroNumero := 0
   nQuartoNumero   := 0

   @ 01,01 say "Digite 4 numeros que"
   @ 03,01 say "Deve ser maior que 15,25 e menor que 28,28....: "
   @ 04,01 say "Deve ser menor que o primeiro numero digitado.: "
   @ 05,01 say "Deve ser menor que o segundo numero digitado..: "
   @ 06,01 say "Deve ser o produto dos tres numeros anteriores: "

   @ 03,48 get nPrimeiroNumero picture '@E 99.99' valid nPrimeiroNumero < 28.28 .and. nPrimeiroNumero > 15.25
   @ 04,48 get nSegundoNumero  picture '@E 99.99' valid nSegundoNumero < nPrimeiroNumero
   @ 05,48 get nTerceiroNumero picture '@E 999.99' valid nTerceiroNumero < nSegundoNumero
   @ 06,48 get nQuartoNumero   picture '@E 99999.99' valid nQuartoNumero == (nPrimeiroNumero * nSegundoNumero * nTerceiroNumero)
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
   
   InKey(0)
enddo