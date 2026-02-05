//Vitor Augusto Faria Ramalho
set scoreBoard off

cNomesJogadores := Space(30)
cPontosJogadores := Space(3)

do while .t.

   clear
   @ 00,00 to 04,79
   @ 00,25 say "JOGO DA MEMORIA EM SEQUENCIAS"

   @ 01,37 prompt "JOGAR"
   @ 02,34 prompt "SCOREBOARD"
   @ 03,37 prompt "SAIR"
   menu to nOpcao
   if nOpcao == 1
   elseif nOpcao == 3
      exit
   endif

   //se pressionar esc abandonar sem guardar a pontuação
   do while nOpcao == 1
      cNomeJogador     := Space(30)
      nPontuacao       := 0
      nNumeroAtual     := 1
      cNumeroAleatorio := Space(10)

      clear
      @ 00,00 to 02,79
      @ 01,01 say "Digite seu nome: "

      @ 01,17 get cNomeJogador picture '@!' valid !Empty(cNomeJogador)
      read
      if LastKey() == 27
         nMenuOpcao := Alert("Deseja voltar para o menu principal?", {"Sim", "Nao"})
         if nMenuOpcao == 1
            exit
         else
            loop
         endif
      endif

      Alert("O jogo vai comecar. Fique atento!")
      do while nNumeroAtual <= 10

         nColunaAleatorio := 1
         for i := 1 to nNumeroAtual
            @ 03,00 to 05,79
            cNumeroAleatorio += AllTrim(Str(hb_RandomInt(1,4)))

            @ 04,nColunaAleatorio say "[" + SubStr(AllTrim(cNumeroAleatorio), i, 1) + "]"
            Inkey(1)
            nColunaAleatorio += 4
         next

         @ 04,01 clear to 04,78

         nColunaDigitado := 2
         for i := 1 to nNumeroAtual
            cNumeroDigitado  := Space(1)
            @ 04,nColunaDigitado - 1 say "[ ]"
            @ 04,nColunaDigitado get cNumeroDigitado valid !Empty(cNumeroDigitado)
            read
            if LastKey() == 27
               nNumeroAtual := 11
               exit
            endif

            if cNumeroDigitado == SubStr(AllTrim(cNumeroAleatorio), i, 1)
               nPontuacao += 10
            elseif !(cNumeroDigitado == SubStr(Alltrim(cNumeroAleatorio), i, 1))
               Alert("Voce errou! Pontuacao final " + Transform(nPontuacao, '999'))

               cPontosJogadores += Transform(nPontuacao, '999')
               cNomesJogadores  += cNomeJogador

               nNumeroAtual := 11
               exit
            endif
            nColunaDigitado += 4
         next
         if nNumeroAtual == 10
            Alert("Parabens " + AllTrim(cNomeJogador) + " voce acertou os 10 numeros conseguindo um score de " + AllTrim(Str(nPontuacao)))
            
            cPontosJogadores += Transform(nPontuacao, '999')
            cNomesJogadores  += cNomeJogador
         endif

         @ 04,01 clear to 04,78
         nNumeroAtual++
      enddo
   enddo

   clear
   do while nOpcao == 2
      @ 00,00 to 24,39
      @ 00,40 to 24,79

      nLinha := 3
      nColuna := 1

      @ 00,38 say "SCORE"
      @ 01,01 say "NOME                            PONTOS"
      @ 01,41 say "NOME                            PONTOS"
      @ 02,01 say "--------------------------------------"
      @ 02,41 say "--------------------------------------"
      
      nTamanhoStrNomes := Len(cNomesJogadores)
      for i := 1 to nTamanhoStrNomes / 30
         cNomeScoreJogador  := SubStr(cNomesJogadores, 30 * i + 1, 30)
         cPontoScoreJogador := SubStr(cPontosJogadores, 3 * i + 1, 3)

         @ nLinha,nColuna say AllTrim(cNomeScoreJogador)
         @ nLinha,nColuna + 32 say AllTrim(cPontoScoreJogador)

         if nLinha == 23
            nLinha := 3
            nColuna := 41
         else
            nLinha++
         endif
         if nLinha == 23 .and. nColuna == 41
            Inkey(0)
            nLinha := 3
            nColuna := 1
         endif
      next
      Inkey(0)
      exit
   enddo
enddo