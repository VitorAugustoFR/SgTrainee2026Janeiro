clear

do while .t.
   cNome           := Space(20)
   nNome           := 0
   nRepeticao      := 0
   nLinha          := 0
   nColuna         := 0
   cVoltarPrograma := Space(1)

   @ 01,01 say "Digite seu nome....................................: "
   @ 02,01 say "Digite quantas vezes voce quer que imprima seu nome: "

   @ 01,53 get cNome valid !Empty(cNome)
   @ 02,53 get nNome valid nNome > 0
   read
   if LastKey() == 27
      nMenuOpcao := Alert("O que deseja fazer?",{"Continuar", "Inserir outro nome", "Sair"})
      if nMenuOpcao == 1

      elseif nMenuOpcao == 2
         loop
      elseif nMenuOpcao == 3
         exit
      endif
   endif

   nAdicionaColuna       := Len(AllTrim(cNome)) + 8
   nQuantidadeMaxColunas := 80 / nAdicionaColuna
   nQuantidadeColuna     := 1

   clear
   do while nRepeticao < nNome

      if nQuantidadeColuna > nQuantidadeMaxColunas
         clear
         nColuna           := 0
         nQuantidadeColuna := 0
         nLinha            := 0
      endif

      @ nLinha,nColuna say AllTrim(Str(nRepeticao + 1)) + " - " + cNome
      nLinha++

      if nLinha > 24
         nColuna += nAdicionaColuna

         nQuantidadeColuna++
         nLinha  := 0
      endif

      nRepeticao++
   enddo
enddo