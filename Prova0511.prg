//Vitor Augusto Faria Ramalho

set scoreBoard off
set date Brit
set epoch to 1940

cUsuario := "CLEBER"
cSenha   := "ABACATE123"

//Codigo
nCodigoJaca      := 1100
nCodigoUva       := 4544
nCodigoTangerina := 3515
nCodigoAbacate   := 7215
//Desconto maximo
nDencontoMaxJaca      := 12
nDescontoMaxUva       := 11
nDescontoMaxTangerina := 10
nDescontoMaxAbacate   := 3
//Estoque
nEstoqueJaca      := 7100
nEstoqueUva       := 448.5
nEstoqueTangerina := 145
nEstoqueAbacate   := 280

nNumeroPedido  := 1

nLoopPrincipal := 1

do while nLoopPrincipal == 1
   nEfetuarPedido := 0

   //variaveis para login
   cLoginUsuario  := Space(6)
   cLoginSenha    := Space(10)

   //Dados da venda
   cNomeCliente   := Space(20)
   nLimiteCredito := 0//999,999.99
   dDataPedido    := Date()

   nSubTotal := 0

   clear
   @ 00,00 to 03,79
   @ 00,32 say "FRUTARIA VITOR"
   @ 01,37 prompt "LOGIN"
   @ 02,37 prompt "SAIR"
   menu to nOpcao
   if nOpcao == 1
      @ 04,01 say "Digite o nome de usuario e a senha:"
      
      @ 05,01 get cLoginUsuario picture '@!'
      @ 06,01 get cLoginSenha   picture '@!'
      read
      if LastKey() == 27
         nMenuOpcao1 := Alert("Deseja?", {"Continuar", "Sair"})
         if nMenuOpcao1 == 2
            exit
         endif
      endif

   else
      exit
   endif
   
   if cLoginUsuario == cUsuario .and. cLoginSenha == cSenha
      nEfetuarPedido := 1
   else
      Alert("Usuario e/ou senha errado(s)!")
      loop
   endif

   do while nEfetuarPedido == 1
      @ 10,00 to 13,79
      @ 11,32 prompt "EFETUAR PEDIDOS"
      @ 12,37 prompt "SAIR"
      menu to nOpcao2
      if nOpcao2 == 1
         exit
      else
         nEfetuarPedido := 0
         exit
      endif
   enddo

   do while nOpcao2 == 1
      nLinha := 8

      clear
      @ 00,00 to 04,79
      @ 00,27 say "INSIRA OS DADOS DA VENDA!"
      @ 01,01 say "Nome do cliente..: "
      @ 02,01 say "Limite de credito: "
      @ 03,01 say "Data do pedido...: "

      @ 01,19 get cNomeCliente   picture '@!'            valid !Empty(cNomeCliente)
      @ 02,19 get nLimiteCredito picture '@E 999,999.99' valid nLimiteCredito > 0
      @ 03,19 get dDataPedido                            valid dDataPedido <= Date()
      read
      if LastKey() == 27
         nMenuOpcao2 := Alert("Deseja?", {"Continuar1", "Sair"})
         if nMenuOpcao2 == 2
            exit
         endif
      endif

      clear
      //Efetuando compra
      do while .t.
         nCodigoDigitado     := 0
         nQuantidadeDigitada := 0
         nDescontoDigitado   := 0
         nPrecoProduto       := 0
         nTotalProduto       := 0
         nEstoqueAntigo     := 0

         @ 00,00 to 23,79
         @ 00,36 say "PEDIDOS"
         @ 01,01 say " CODIGO | DESCRICAO DO PRODUTO | PRECO UNIT. | % MAX. DESCONTO | ESTOQUE "
         @ 02,01 say "  1100  |         Jaca         |   R$3,50    |       12%       | " + Transform(nEstoqueJaca, "@E 9,999.99")
         @ 03,01 say "  4544  |         Uva          |    R$15     |       11%       | " + Transform(nEstoqueUva, "@E 999.9")
         @ 04,01 say "  3515  |      Tangerina       |   R$21,90   |       10%       | " + Transform(nEstoqueTangerina, "999")
         @ 05,01 say "  7215  |       Abacate        |   R$15,49   |       3%        | " + Transform(nEstoqueAbacate, "280")

         @ 06,01 to 06, 78

         @ 07,03 say " Codigo | Quantidade | % do Desconto |    Valor    | Numero do Pedido "
         @ nLinha,03 say "        |            |               |             |"

         @ nLinha,06 get nCodigoDigitado     picture '9999'        valid nCodigoDigitado > 1000
         @ nLinha,14 get nQuantidadeDigitada picture '@E 9,999.99' valid nQuantidadeDigitada > 0
         @ nlinha,31 get nDescontoDigitado   picture '99'          valid nDescontoDigitado >= 0
         read
         if LastKey() == 27
            nMenuOpcao3 := Alert("Deseja Finalizar a compra?", {"Sim", "Nao"})
            if nMenuOpcao3 == 1
               nOpcao2 := 0
               exit
            endif
         endif
         @ nLinha,61 say AllTrim(Str(nNumeroPedido))


         //Validacoes
         if nCodigoDigitado == nCodigoJaca
            if nDescontoDigitado > nDencontoMaxJaca .or. nEstoqueJaca < nQuantidadeDigitada
               Alert("DESCONTO DIGITADO ACIMA DO MAXIMO, OU ESTOQUE INSULFICIENTE!")
               loop
            endif
            nPrecoProduto   := 3.5
            nEstoqueAntigo := nEstoqueJaca
         elseif nCodigoDigitado == nCodigoUva
            if nDescontoDigitado > nDescontoMaxUva .or. nEstoqueUva < nQuantidadeDigitada
               Alert("DESCONTO DIGITADO ACIMA DO MAXIMO, OU ESTOQUE INSULFICIENTE!")
               loop
            endif
            nPrecoProduto := 15
            nEstoqueAntigo := nEstoqueUva + 0.005
         elseif nCodigoDigitado == nCodigoTangerina
            if nDescontoDigitado > nDescontoMaxTangerina .or. nEstoqueTangerina < nQuantidadeDigitada
               Alert("DESCONTO DIGITADO ACIMA DO MAXIMO, OU ESTOQUE INSULFICIENTE!")
               loop
            endif
            nPrecoProduto := 21.9
            nEstoqueAntigo := nEstoqueTangerina
         elseif nCodigoDigitado == nCodigoAbacate
            if nDescontoDigitado > nDescontoMaxAbacate .or. nEstoqueAbacate < nQuantidadeDigitada
               Alert("DESCONTO DIGITADO ACIMA DO MAXIMO, OU ESTOQUE INSULFICIENTE!")
               loop
            endif
            nPrecoProduto := 15.49
            nEstoqueAntigo := nEstoqueAbacate
         else
            Alert("CODIGO INVALIDO!")
            loop
         endif

         nTotalProduto := (nPrecoProduto * (1 + nDescontoDigitado / 100)) * nQuantidadeDigitada
         @ nLinha,42 say "R$" + Transform(nTotalProduto, "99,999.99")
         if nTotalProduto > nLimiteCredito
            Alert("Credito Insulficiente!")
            loop
         else
            nLimiteCredito -= nTotalProduto
         endif

         if nCodigoDigitado == nCodigoJaca
            nEstoqueJaca -= nQuantidadeDigitada
         elseif nCodigoDigitado == nCodigoUva
            nEstoqueUva -= nQuantidadeDigitada
         elseif nCodigoDigitado == nCodigoTangerina
            nEstoqueTangerina -= nQuantidadeDigitada
         elseif nCodigoDigitado == nCodigoAbacate
            nEstoqueAbacate -= nQuantidadeDigitada
         endif

         nSubTotal     += nTotalProduto
         @ 24,52 say "Total: R$" + Transform (nSubTotal, "999,999.99")
         if nLinha == 22
            nLinha := 8
            @ 07,01 clear to 22,79
         else
            nLinha++
         endif
         nNumeroPedido++

      enddo

   enddo

enddo
