//Vitor Augusto Faria Ramalho
set scoreBoard off
set date Brit
set epoch to 1940

cLogin           := "JOSE"
cSenha           := "432mudar123"
cSenhaSupervisor := "AUTORIZA99"

nAnoAtual := Year(Date())
nMesAtual := Month(Date())
nDiaAtual := Day(Date())

nOrdemServico := 1


do while .t.
   clear

   cLoginDigitado := Space(4)
   cSenhaDigitada := Space(11)

   @ 00,00 to 03,79
   @ 00,37 say "LOGIN"
   @ 01,01 say "Digite o nome de usuario: "
   @ 02,01 say "Digite a senha..........: "

   @ 01,26 get cLoginDigitado picture '@!' valid !Empty(cLoginDigitado)
   @ 02,26 get cSenhaDigitada              valid !Empty(cSenhaDigitada)
   read
   if LastKey() == 27
      nMenuOpcao1 := Alert("Deseja sair?", {"Sim", "Nao"})
      if nMenuOpcao1 == 1
         exit
      endif
   endif

   if !(cLoginDigitado == cLogin)
      Alert("NOME DE USUARIO ERRADO!")
      loop
   endif

   if !(cSenhaDigitada == cSenha)
      Alert("SENHA INCORRETA!")
      loop
   endif

   @ 05,00 to 08,79
   @ 05,32 say "MENU PRINCIPAL"
   @ 06,32 prompt "Efetuar pedidos"
   @ 07,37 prompt "Sair"
   menu to nOpcao1
   if nOpcao1 == 2
      exit
   endif

   do while nOpcao1 == 1
      cNomeCliente          := Space(40)
      dDataOrdemServico     := Date()
      cNomeTecnico          := Space(30)
      cDescricaoEquipamento := Space(40)
      dDataCompra           := Date()
      cEntregaDomicilio     := Space(1)
      nLimiteDeCredito      := 0

      //Dados entrega
      cEndereco    := Space(30)
      cBairro      := Space(20)
      cReferencia  := Space(40)
      nTelefone    := 0
      nTaxaEntrega := 0.02

      nValorTotal := 0

      clear

      @ 00,00 to 09,79
      @ 00,25 say "DADOS DA ORDEM DE SERVICO N" + AllTrim(Str(nOrdemServico))
      @ 01,01 say "Digite os seguintes dados:"

      @ 02,01 say "Nome do cliente.............: "
      @ 03,01 say "Data da ordem de servico....: "
      @ 04,01 say "Nome do tecnico.............: "
      @ 05,01 say "Descricao do equipamento....: "
      @ 06,01 say "Data da compra..............: "
      @ 07,01 say "Entrega domicilio...........? "
      @ 08,01 say "Limite de credito do cliente: "

      @ 02,30 get cNomeCliente                              valid !Empty(cNomeCliente)
      @ 03,30 get dDataOrdemServico                         valid dDataOrdemServico <= Date()
      @ 04,30 get cNomeTecnico                              valid !Empty(cNomeTecnico)
      @ 05,30 get cDescricaoEquipamento                     valid !Empty(cDescricaoEquipamento)
      @ 06,30 get dDataCompra                               valid dDataCompra < Date()
      @ 07,30 get cEntregaDomicilio picture '@!'            valid cEntregaDomicilio $ "SN"
      @ 08,30 get nLimiteDeCredito  picture '@E 999,999.99' valid nLimiteDeCredito > 0
      read
      if LastKey() == 27
         nMenuOpcao2 := Alert("Deseja sair?", {"Sim", "Nao"})
         if nMenuOpcao2 == 1
            exit
         endif
      endif

      if cEntregaDomicilio == "S"
         @ 10,00 to 16,79
         @ 10,31 say "DADOS DA ENTREGA"
         @ 11,01 say "Digite os seguintes dados: "

         @ 12,01 say "Endereco..........: "
         @ 13,01 say "Bairro............: "
         @ 14,01 say "Referencia........: "
         @ 15,01 say "Numero de telefone: "

         @ 12,20 get cEndereco valid !Empty(cEndereco)
         @ 13,20 get cBairro valid !Empty(cBairro)
         @ 14,20 get cReferencia valid !Empty(cReferencia)
         @ 15,20 get nTelefone picture '(99) 99999-9999' valid nTelefone > 0
         read
         if LastKey() == 27
            nMenuOpcao3 := Alert("O que deseja fazer", {"Continuar", "Reinserir dados", "Sair"})
            if nMenuOpcao3 == 2
               loop
            elseif nMenuOpcao3 == 3
               exit
            endif
         endif
      endif

      do while .t.
         cServicoEfetuado         := Space(1)
         cSupervisor              := Space(15)
         cSenhaDigitadaSupervisor := Space(10)
         nTempoGarantia           := 0
         clear
         
         @ 24,01 say "Quais servicos serao efetuados?   [P]roduto [S]ervico"

         @ 24,32 get cServicoEfetuado picture '@!' valid cServicoEfetuado $ "PS"
         read
            if LastKey() == 27
               nMenuOpcao4 := Alert("O que deseja fazer", {"Continuar", "Fechar venda"})
               if nMenuOpcao4 == 2
                  nOpcao1 := 0
                  exit
               endif
            endif

         clear
         nLinha := 0

         do while  cServicoEfetuado == "P"
            cDescricaoProduto := Space(30)
            nQuantidade       := 0
            nPrecoUnitario    := 0 // 9999,999.99
            nDescontoProduto  := 0 // 99.99
            nSubTotalProduto := 0
            nProdutoAtual     := 1

            //Dados da garantia
            nAnoCompra     := Year(dDataCompra)
            nMesCompra     := Month(dDataCompra)
            nDiaCompra     := Day(dDataCompra)
         
            @ nLinha,00 to nLinha + 5,79
            @ nLinha,36 say "PRODUTO" + AllTrim(Str(nProdutoAtual)) 

            @ nLinha + 1,01 say "Descricao.....: "
            @ nLinha + 2,01 say "Quantidade....: "
            @ nLinha + 3,01 say "Preco Unitario: "
            @ nLinha + 4,01 say "% de desconto.: "

            @ nLinha + 1,16 get cDescricaoProduto                         valid !Empty(cDescricaoProduto)
            @ nLinha + 2,16 get nQuantidade                               valid nQuantidade > 0
            @ nLinha + 3,16 get nPrecoUnitario   picture '@E 9,999,999.99' valid nPrecoUnitario > 0
            @ nLinha + 4,16 get nDescontoProduto picture '99.99'          valid nDescontoProduto >= 0
            read
            if LastKey() == 27
               nMenuOpcao5 := Alert("Deseja efetuar outro servico?", {"Sim", "Nao"})
               if nMenuOpcao5 == 1
                  exit
               endif
            endif

            //Calculos
            nSubTotalProduto += nQuantidade * (nPrecoUnitario * (1 + nDescontoProduto / 100))
            if cEntregaDomicilio == "S"
               nSubTotalProduto * (1 + nTaxaEntrega / 100)
            endif
            nValorTotal += nSubTotalProduto

            //Garantia
            nTempoGarantia += nAnoAtual - nAnoCompra
            if nMesCompra == nMesAtual
               if nDiaCompra > nDiaAtual
                  nTempoGarantia++
               endif
            elseif nMesCompra > nMesAtual
               nTempoGarantia++
            endif

            if nTempoGarantia <= 2
               nValorTotal -= nSubTotalProduto
            endif

            //Supervisor
            if nValorTotal > nLimiteDeCredito
               Alert("LIMITE DE CREDITO INSULFICIENTE")
               clear
               @ 01,01 say "Digite o usuario de supervisor: "
               @ 02,01 say "Digite a senha de supervisor..: "

               @ 01,32 get cSupervisor              picture '@!' valid !Empty(cSupervisor)
               @ 02,32 get cSenhaDigitadaSupervisor picture '@!' valid !Empty(cSenhaDigitadaSupervisor)
               read
               if !(cSenhaDigitadaSupervisor == cSenhaSupervisor)
                  Alert("SUPERVISOR INVALIDO!")
                  nValorTotal -= nSubTotalProduto
               endif
               nLinha := 0
            endif

            
            if nLinha == 18
               nLinha := 0
            else
               nLinha += 6
            endif
            nProdutoAtual++
            @ 24,01 say "Total: R$" + Transform(nValorTotal, '@E 999,999,999.99')
         enddo

         do while cServicoEfetuado == "S"
            cDescricaoServico := Space(25)
            nDescontoServico  := 0
            nComissaoTecnico  := 0 //99,99
            nPrecoServico     := 0 //9,999,999.99
            nSubTotalSevico   := 0
            nServicoAtual     := 1

            //Dados da garantia
            nAnoOrdemservico     := Year(dDataOrdemServico)
            nMesOrdemservico     := Month(dDataOrdemServico)
            nDiaOrdemservico     := Day(dDataOrdemServico)
            
            @ nLinha,00 to nLinha +_5,79
            @ nLinha, say "SERVICO" + AllTrim(Str(nServicoAtual))
            @ nLinha + 1,01 say "Descricao............: "
            @ nLinha + 2,01 say "% de desconto........: "
            @ nLinha + 3,01 say "% comissao do tecnico: "
            @ nLinha + 4,01 say "Preco do servico.....: "

            @ nLinha + 1,23 get cDescricaoServico                          valid !Empty(cDescricaoServico)
            @ nLinha + 2,23 get nDescontoServico picture '@E 99,99'        valid nDescontoServico >= 0
            @ nLinha + 3,23 get nComissaoTecnico picture '@E 99,99'        valid nComissaoTecnico > 0
            @ nLinha + 4,23 get nPrecoServico    picture '@E 9,999,999.99' valid nPrecoServico > 0
            read
            if LastKey() == 27
               nMenuOpcao6 := Alert("Deseja efetuar outro servico?", {"Sim", "Nao"})
               if nMenuOpcao6 == 1
                  exit
               endif
            endif

            //Calculos
            nSubTotalSevico += nPrecoServico * (1 + nDescontoProduto / 100) - (nPrecoServico * (nComissaoTecnico /100))
            if cEntregaDomicilio == "S"
               nSubTotalSevico * (1 + nTaxaEntrega / 100)
            endif
            nValorTotal += nSubTotalSevico

            //Garantia
            nTempoGarantia += nAnoAtual - nAnoOrdemservico
            if nMesOrdemservico == nMesAtual
               if nDiaOrdemservico > nDiaAtual
                  nTempoGarantia++
               endif
            elseif nMesOrdemservico > nMesAtual
               nTempoGarantia++
            endif

            if nTempoGarantia <= 1
               nValorTotal -= nSubTotalSevico
            endif

            //Supervisor
            if nValorTotal > nLimiteDeCredito
               Alert("LIMITE DE CREDITO INSULFICIENTE")
               clear
               @ 01,01 say "Digite o usuario de supervisor: "
               @ 02,01 say "Digite a senha de supervisor..: "

               @ 01,32 get cSupervisor              picture '@!' valid !Empty(cSupervisor)
               @ 02,32 get cSenhaDigitadaSupervisor picture '@!' valid !Empty(cSenhaDigitadaSupervisor)
               read
               if !(cSenhaDigitadaSupervisor == cSenhaSupervisor)
                  Alert("SUPERVISOR INVALIDO!")
                  nValorTotal -= nSubTotalSevico
               endif
               nLinha := 0
            endif

            if nLinha == 18
               nLinha := 0
               clear
            else
               nLinha += 6
            endif
            nServicoAtual++
            @ 24,01 say "Total: R$" + Transform(nValorTotal, '@E 999,999,999.99')
         enddo
      enddo
   enddo
   nOrdemServico++

   if nValorTotal == 0
      clear
      @ 01,01 say "Todo o valor foi coberto pela garantia!"
      @ 02,01 say "Insira  CNPJ da empresa: "
      @ 03,01 say "Insira o numero da nota: "
      @ 04,01 say "Insira a data da nota..: "

   nQunatiaAVista := 0
   nQuantiaCheque := 0
   nQuantiaCartao := 0
   do while nValorTotal > 0
      nFormaPagamento := Space(1)
      clear
      @ 00,00 to ,79
      @ 00,35 say "PAGAMENTO"
      @ 01,01 say "Quantia a pagar " + Transform(nValorTotal, '@E 99,999,999.99')
      @ 03,01 say "Insira sua forma de pagamento:   [D]inheiro c[H]eque [C]artao"

      @ 03,32 get cFormaPagamento picture '@!' valid !Empty(cFormaPagamento)
      read

      if cFormaPagamento == "D" 
         if nQunatiaAVista > 0
            Alert("FORMA DE PAGAMENTO JA UTILIZADA!")
            loop
         else
            @ 04,01 say "Digite a quantia que deseja pagar a vista: "

            @ 04,43 get nQunatiaAVista picture '@E 999,999,999.99' valid nQunatiaAVista > 0
            read
            nValorTotal -= nQunatiaAVista
         endif
      endif

      if cFormaPagamento == "H"
         if nQuantiaCheque > 0
            Alert("FORMA DE PAGAMENTO JA UTILIZADA!")
            loop
         else
            @ 04,01 say "Digite a quantia que deseja pagar a vista: "

            @ 04,43 get nQuantiaCheque picture '@E 999,999,999.99' valid nQuantiaCheque > 0
            read
            nValorTotal -= nQuantiaCheque
         endif
      endif

      if cFormaPagamento == "C"
         if nQuantiaCartao > 0
            Alert("FORMA DE PAGAMENTO JA UTILIZADA!")
            loop
         else
            @ 04,01 say "Digite a quantia que deseja pagar a vista: "

            @ 04,43 get nQuantiaCartao picture '@E 999,999,999.99' valid nQuantiaCartao > 0
            read
            nValorTotal -= nQuantiaCartao
         endif
      endif

   enddo
enddo