set scoreBoard off
set date to brit
set epoch to 1940

do while .t.
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
      exit
   endif
enddo