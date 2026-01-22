set scoreBoard off

do while .t.
   clear

   nInteiroUm     := 0
   nInteiroDois   := 0
   nInteiroTres   := 0
   nInteiroQuatro := 0
   nMaiorNumero   := 0

   @ 01,01 say "Digite Tres numeros inteiros: "

   @ 02,01 get nInteiroUm     picture "99999"
   @ 03,01 get nInteiroDois   picture "99999"
   @ 04,01 get nInteiroTres   picture "99999"
   @ 05,01 get nInteiroQuatro picture "99999"
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

   if nInteiroUm > nMaiorNumero
      nMaiorNumero := nInteiroUm
   endif
   if nInteiroTres > nMaiorNumero
      nMaiorNumero := nInteiroTres
   endif
   if nInteiroQuatro > nMaiorNumero
      nMaiorNumero := nInteiroQuatro
   endif
   if nInteiroDois > nMaiorNumero
      nMaiorNumero := nInteiroDois
   endif


   @ 07,01 say "O inteiro: " + AllTrim(Str(nMaiorNumero)) + " e o maior"
   InKey(1)
enddo