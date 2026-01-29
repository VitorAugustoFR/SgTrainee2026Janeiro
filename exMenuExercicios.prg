set message to 06 center
set scoreBoard off
set date to brit
set epoch to 1940

do while .t.
   nOpcao                := 0
   nExercicioSelecionado := 0

   clear

   @ 00,00 to 05,79

   @ 00,30 say "* MENU PRINCIPAL *"
   @ 01,33 prompt "Exercicio 07" message "Entrar no exericio 07"
   @ 02,33 prompt "Exercicio 08" message "Entrar no exericio 08"
   @ 03,33 prompt "Exercicio 09" message "Entrar no exericio 09"
   @ 04,37 prompt "Sair"         message "Sair do programa"
   menu to nOpcao

   if nOpcao == 1
      nExercicioSelecionado := 1
   elseif nOpcao == 2
      nExercicioSelecionado := 2
   elseif nOpcao == 3
      nExercicioSelecionado := 3
   else
      exit
   endif

   do while nExercicioSelecionado == 1
         clear

      nResultado      := 0
      nSegundoNumero  := 0
      cOperacao       := space(1)
      lEmOperacao     := space(1)

      do while .t.
         @ 01,01 say "Calculadora simples em harbour"
         @ 03,01 say "Digite dois numeros e a operacao a ser realziada"

         @ 04,01 get nResultado
         @ 05,01 get cOperacao
         @ 06,01 get nSegundoNumero
         read

         if LastKey() == 27
            nMenuOpcao := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
            if nMenuOpcao == 1

            elseif nMenuOpcao == 2
               loop
            elseif nMenuOpcao == 3
               nExercicioSelecionado := 0
               exit
            endif
         endif

         if cOperacao == "+"
            nResultado += nSegundoNumero
         elseif cOperacao == "-"
            nResultado -= nSegundoNumero
         elseif cOperacao == "*"
            nResultado := nResultado * nSegundoNumero
         elseif cOperacao == "/"
            nResultado := nResultado / nSegundoNumero
         else
            Alert("Operador invalido!")
            loop
         endif

         @ 08,01 say "Resultado ate o momento = " + Alltrim(Str(nResultado))
         @ 09,01 say "Deseja continuar fazendo contas? "
         @ 09,33 get lEmOperacao picture '@!' valid lEmOperacao $ "SN"
         read

         if LastKey() == 27
            nMenuOpcao2 := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
            if nMenuOpcao2 == 1

            elseif nMenuOpcao2 == 2
               loop
            elseif nMenuOpcao2 == 3
               exit
            endif
         endif


         do While lEmOperacao == "S"
            clear
            @ 01,01 say "Resultado Atual = " + Alltrim(Str(nResultado))

            @ 03,01 say "Calculadora simples em harbour"
            @ 05,01 say "Digite a operacao a ser realziada e um numero"

            @ 06,01 get cOperacao
            @ 07,01 get nSegundoNumero
            read

            if LastKey() == 27
               nMenuOpcao3 := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
               if nMenuOpcao3 == 1

               elseif nMenuOpcao3 == 2
                  loop
               elseif nMenuOpcao3 == 3
                  exit
               endif
            endif

            if cOperacao == "+"
               nResultado += nSegundoNumero
            elseif cOperacao == "-"
               nResultado -= nSegundoNumero
            elseif cOperacao == "*"
               nResultado := nResultado * nSegundoNumero
            elseif cOperacao == "/"
               nResultado := nResultado / nSegundoNumero
            else
               Alert("Operador invalido!")
               loop
            endif

            clear
            
            @ 01,01 say "Resultado ate o momento = " + Alltrim(Str(nResultado))
            @ 03,01 say "Deseja continuar fazendo contas? "

            @ 03,33 get lEmOperacao picture '@!' valid lEmOperacao $ "SN"
            read

            if LastKey() == 27
               nMenuOpcao4 := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
               if nMenuOpcao4 == 1

               elseif nMenuOpcao4 == 2
                  loop
               elseif nMenuOpcao4 == 3
                  exit
               endif
            endif

         enddo
         exit
      enddo
   enddo


   do while nExercicioSelecionado == 2
      clear

      nLoopProdutos  := 0 
      nLoopPagamento := 0

      //Cliente
      cNome         := space(20)
      dDataDoPedido := CToD("")

      //Produto
      nIndex        := 1
      cProduto      := space(20)
      dDataDaVenda  := date()
      nQuantidade   := 0 // N/5/2 '99.99'
      nValor        := 0 // N/6/2 '999.99'
      nSubTotal     := 0
      nTotal        := 0

      nLinha        := 3

      //Pagamento
      cMetodoDePagamento   := space(1)
      nPagamentoAvista     := 0
      nNumeroDeParcelas    := 0
      nJuros               := 0.01
      nValorTotalParcela   := 0
      nValorParcela        := 0
      dVencimentoDaParcela := dDataDaVenda

      //@ 00,00 to 10,79
      @ 00,00 to 03,79

      @ 00,25 say "MERCEARIA DO SEU ZE"
      @ 01,01 say "Digite seu nome........: "
      @ 02,01 say "Digite a data do pedido: "
      
      @ 01,25 get cNome         valid !Empty(cNome)
      @ 02,25 get dDataDoPedido valid !Empty(dDataDoPedido) .and. dDataDoPedido < dDataDaVenda
      read
      if LastKey() == 27
         nMenuOpcao1 := Alert("Deseja sair?",{"Sim", "Nao"}, 'W/RB')
         if nMenuOpcao1 == 1 
            nExercicioSelecionado := 0
            exit
         endif
      endif

      nLoopProdutos := 1

      clear
      //Produtos
      do while .t.
         if nLinha > 23
            clear
            nLinha := 3
         endif

         @ 01,09 to 24,70
         @ 01,29 say "MERCEARIA DO SEU ZE"
         @ 02,10 say " Index |        Produto       |  QNT  |  Valor | Sub. Total "

         @ nLinha,10 say "   " + AllTrim(Str(nIndex)) + "   |                      |       |        |            "

         @ nLinha,19 get cProduto    picture '@!' valid !Empty(cProduto)
         @ nLinha,44 get nQuantidade picture "@E 99" valid nQuantidade > 0
         @ nLinha,50 get nValor      picture '@E 999.99' valid nValor > 0
         read
         if LastKey() == 27
            nMenuOpcao2 := Alert("O que deseja fazer?",{"Continuar", "Abandonar", "Faturar"}, 'W/RB')
            if nMenuOpcao2 == 1

            elseif nMenuOpcao2 == 2
               exit
            elseif nMenuOpcao2 == 3
               if nTotal > 0
                  nLoopPagamento := 1
                  exit
               else
                  Alert("Valor precisa ser maior que zero para faturar!", 'W/RB')
                  loop
               endif
            endif
         endif

         nSubTotal := nQuantidade * nValor
         @ nLinha,59 say AllTrim(Str(nSubTotal))

         nTotal += nSubTotal
         nLinha++
         nIndex++
      enddo

      clear

      //Pagamento
      do while nLoopPagamento == 1
         @ 01,01 say "Valor a pagar: " + AllTrim(Str(nTotal))
         @ 02,01 say "Quar metodo de pagamento deseja usar? (P)arcelado (A)vista "

         @ 03,01 get cMetodoDePagamento picture '@!' valid cMetodoDePagamento $ "PA"
         read
         if LastKey() == 27
            nMenuOpcao3 := Alert("Deseja", {"Continuar", "Abandonar"}, 'W/RB')
            if nMenuOpcao3 == 1

            elseif nMenuOpcao3 == 2
               nLoopPagamento := 0
               exit
            endif
         endif

         if cMetodoDePagamento == "A"
            clear
            @ 00,00 to 4,79
            @ 00,31 say "PAGAMENTO A VISTA"
            
            @ 01,01 say "Seu pagamento: "

            @ 01,15 get nPagamentoAvista picture '@E 999,999,999.99' valid nPagamentoAvista > nTotal
            read
            if LastKey() == 27
               nMenuOpcao4 := Alert("Deseja selecionar outro metodo de pagamento?", {"Sim", "Nao"}, 'W/RB')
               if nMenuOpcao4 == 1
                  loop
               endif
            endif

            @ 03,01 say "Seu troco: " + AllTrim(Str(nPagamentoAvista - nTotal))
            Inkey(0)
         endif

         if cMetodoDePagamento == "P"
            clear
            @ 00,00 to 24,79
            @ 00,30 say "PAGAMENTO PARCELADO"
            @ 01,01 say "Digite em quantas vezes quer pagar(maximo 12): "

            @ 01,47 get nNumeroDeParcelas picture '99' valid nNumeroDeParcelas <= 12 .and. nNumeroDeParcelas > 0
            read
            if LastKey() == 27
               nMenuOpcao5 := Alert("Deseja selecionar outro metodo de pagamento?", {"Sim", "Nao"}, 'W/RB')
               if nMenuOpcao6 == 1
                  loop
               endif
            endif

            nValorTotalParcela := nTotal
            if nNumeroDeParcelas > 3
               nValorTotalParcela += nValorTotalParcela * (nJuros * nNumeroDeParcelas)
            endif

            @ 03,11 say "Valor da parcela | Vencimento da parcela"

            nValorParcela := nValorTotalParcela / nNumeroDeParcelas
            @ 02,10 to 16, 61
            for i := 1 to nNumeroDeParcelas
               dVencimentoDaParcela := dDataDaVenda + 30 * i
               @ i+3,11 say AllTrim(Str(nValorParcela))
               @ i+3,28 say " | "
               @ i+3,31 say DToC(dVencimentoDaParcela)
            next
            Inkey(0)

         endif

         exit
      enddo
      if nPagamentoAvista > 0 .or. nValorTotalParcela > 0 
         clear
         @ 00,00 to 07,79
         @ 00,34 say "NOTA FISCAL"

         @ 01,01 say "Cliente...........................: " + cNome
         @ 02,01 say "Data em que o pedido foi realizado: " + DToC(dDataDoPedido)
         @ 03,01 say "Data da venda.....................: " + DToC(dDataDaVenda)
         @ 04,01 say "Quantidade de produtos............: " + AllTrim(Str(nIndex))
         @ 05,01 say "Data da entrega...................: " + DToC(dDataDaVenda + 7) 
         @ 06,01 say "Valor total do pedido.............: " + AllTrim(Str(nTotal))
         Inkey(0)
      endif
   enddo

   do while nExercicioSelecionado == 3
      clear

      cLetra         := space(1)
      dData          := CToD("")
      nNumeroInteiro := 0
      nNumeroDecimal := 0
      cString        := space(30)

      @ 01,01 say "Digite"
      @ 02,01 say "Uma letra........: "
      @ 03,01 say "Uma data.........: "
      @ 04,01 say "Um numero inteiro: "
      @ 05,01 say "Um numero decimal: "
      @ 06,01 say "Uma string.......: "

      @ 02,19 get cLetra
      @ 03,19 get dData
      @ 04,19 get nNumeroInteiro picture '999,999,999'
      @ 05,19 get nNumeroDecimal picture "@E 999,999,999.99"
      @ 06,19 get cString valid Len(cString) > 1
      read

      if LastKey() == 27
         nMenuOpcao7 := Alert("Deseja",{"Sair", "Continuar"})
         if nMenuOpcao7 == 1
            exit
         endif
      endif

      @ 01,01 say "Letra digitada.........: " + cLetra
      @ 02,01 say "Data digitada..........: " + DToC(dData)
      @ 03,01 say "Numero inteiro digitado: " + Alltrim(Str(nNumeroInteiro))
      @ 04,01 say "Numero decimal digitado: " + Alltrim(Str(nNumeroDecimal))
      @ 05,01 say "String digitada........: " + cString
      Inkey(0)
   enddo
enddo