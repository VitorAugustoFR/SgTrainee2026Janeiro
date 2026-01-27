//Vitor Augusto Faria Ramalho
set scoreBoard off
set date Brit
set epoch to 1940

clear

do while .t.
   clear
   nNumeroDeEmpregados := 0
   nEmpregadoAtual     := 1
   nEstaCancelado      := 0
   //Informações
   nHomensAptos                    := 0
   nMulheresAptas                  := 0
   nValorTotalRemuneracao          := 0
   nHomensComMaisDeNoventaEUm      := 0
   nMulheresAntesDoisMilETreze     := 0
   nMulheresQuePagamIRRF           := 0
   nPercentualMulheresQuePagamIRRF := 0 

   @ 00,00 to 02,79
   @ 00,33  say "CONTROLE INSS"
   @ 01,01 say "Digite o numero de empregados a serem analaizados: "

   @ 01,51 get nNumeroDeEmpregados valid nNumeroDeEmpregados > 0
   read
   if LastKey() == 27
      nMenuOpcao1 := Alert("Deseja sair?",{"Sim", "Nao"})
      if nMenuOpcao1 == 1
         exit
      end if
   end if

   do while nEmpregadoAtual <= nNumeroDeEmpregados

      cNomeColaborador        := space(20)
      cSexo                   := space(1)
      dDataNascimento         := CToD("")
      dDataAdmissao           := CToD("")
      dDataDemissao           := CToD("")
      nValorSalarioBase       := 0
      nValorLimiteIRRF        := 0 //IRRF == imposto de renda
      nAdicionalNoturno       := 0
      nAdicionalInsalubridade := 0

      clear
      @ 00,00 to 11,79
      @ 00,29 say "COLABORADOR NUMERO: " + AllTrim(Str(nEmpregadoAtual))

      @ 01,01 say "Digite os dados do colaborador:"
      @ 02,01 say "Nome.....................: "
      @ 03,01 say "Sexo.....................: "
      @ 04,01 say "Data de nascimento.......: "
      @ 05,01 say "Data de admissao.........: "
      @ 06,01 say "Data de demissao.........: "
      @ 07,01 say "Valor do salario base....: "
      @ 08,01 say "Valor limite IRRF........: "
      @ 09,01 say "Adicional noturno........:      %"
      @ 10,01 say "Adicional insalubridade..:      %"

      @ 02,27 get cNomeColaborador                                  valid !Empty(cNomeColaborador)
      @ 03,27 get cSexo                   picture '@!'              valid cSexo $ "FM"
      @ 04,27 get dDataNascimento                                   valid dDataNascimento < Date()
      @ 05,27 get dDataAdmissao                                     valid dDataAdmissao > dDataNascimento
      @ 06,27 get dDataDemissao                                     valid dDataDemissao > dDataAdmissao
      @ 07,27 get nValorSalarioBase       picture '@E 9,999,999.99' valid nValorSalarioBase > 0
      @ 08,27 get nValorLimiteIRRF        picture '@E 9,999.99'     valid nValorLimiteIRRF > 0
      @ 09,27 get nAdicionalNoturno       picture '@E 999.99'       valid nAdicionalNoturno <= 100
      @ 10,27 get nAdicionalInsalubridade picture '@E 999.99'       valid nAdicionalInsalubridade <= 100
      read
      if LastKey() == 27
         nMenuOpcao2 := Alert("O que deseja fazer?",{"Cancelar", "Retornar", "Processar"})
         if nMenuOpcao2 == 1
            exit
            nEstaCancelado := 1
         elseif nMenuOpcao2 == 3
            exit
         end if
      end if

      //Variaveis para calculos
      //Salario
      nSalarioFinal := nValorSalarioBase
      nSalarioFinal += nValorSalarioBase * (nAdicionalInsalubridade / 100)
      nSalarioFinal += nValorSalarioBase * (nAdicionalNoturno / 100)
      //Aposentadoria
      nValorAposentadoria := nValorSalarioBase
      //Idade
      nAnoAtual := Year(Date())
      nMesAtual := Month(Date())
      nDiaAtual := Day(Date())

      nAnoNascimento := Year(dDataNascimento)
      nMesNascimento := Month(dDataNascimento)
      nDiaNascimento := Day(dDataNascimento)

      nIdade := nAnoAtual - nAnoNascimento
      //Tempo de contribuição
      //Data de admissao
      nAnoAdmissao := Year(dDataAdmissao)
      nMesAdmissao := Month(dDataAdmissao)
      nDiaAdmissao := Day(dDataAdmissao)
      //Data de demissao
      nAnoDemissao := Year(dDataDemissao)
      nMesDemissao := Month(dDataDemissao)
      nDiaDemissao := Day(dDataDemissao)

      nTempoDeCotribuicao := nAnoDemissao - nAnoAdmissao

      //Calculos
      //Idade
      if !(nMesNascimento >= nMesAtual)
         if !(nDiaNascimento >= nDiaAtual)
            nIdade--
         end if
      end if
      //Tempo de contribuicao
      if !(nMesAdmissao >= nMesDemissao)
         if !(nDiaAdmissao >= nDiaDemissao)
            nTempoDeCotribuicao--
         end if
      end if


      //Aptidao a aposentadoria
      if cSexo == "M"
         if nIdade >= 61 .and. nTempoDeCotribuicao >= 30
            nHomensAptos++
         else
            Alert("Nao esta apto a receber aposentadoria!")
            loop
         end if

         if nIdade > 91
            nHomensComMaisDeNoventaEUm++
         end if
      end if
      if cSexo == "F"
         if nIdade >= 58 .and. nTempoDeCotribuicao >= 20
            nMulheresAptas++
         else
            Alert("Nao esta apta a receber aposentadoria!")
            loop
         end if

         if nAnoAdmissao < 2013
            nMulheresAntesDoisMilETreze++
         end if

         if nValorLimiteIRRF < nValorSalarioBase
            nMulheresQuePagamIRRF++
         end if
      end if

      //Remuneracao aposentadoria
      if !(nAnoDemissao < 2009) .or. (nAnoDemissao - nTempoDeCotribuicao) > 2012
         nValorAposentadoria += nValorSalarioBase * 0.02
      end if
      
      if !(nAnoDemissao < 2015) .or. (nAnoDemissao - nTempoDeCotribuicao) > 2018
         nValorAposentadoria -= nValorSalarioBase * 0.05
      end if

      if nValorLimiteIRRF < nValorSalarioBase
         nValorAposentadoria -= nSalarioFinal * 0.09
      end if
      nEmpregadoAtual++
      nValorTotalRemuneracao += nValorAposentadoria
      

      @ 12,00 to 17,79
      @ 12,18 say "DADOS COLABORADOR(A)..: " + AllTrim(cNomeColaborador)
      @ 13,01 say "Idade.................: " + AllTrim(Str(nIdade))
      @ 14,01 say "Tempo de contribuicao.: " + AllTrim(Str(nTempoDeCotribuicao))
      @ 15,01 say "Aposentadoria recebida: R$" + Transform(nValorAposentadoria, "@E 99,999,999.99")
      @ 16,01 say "Salario mensal........: R$" + Transform(nSalarioFinal, "@E 9,999,999.99")
      Inkey(0)
   enddo

   nTotalColaboradores             := nHomensAptos + nMulheresAptas
   nPercentualHomens               := (nHomensAptos * 100) / nTotalColaboradores
   nPercentualMulheres             := (nMulheresAptas* 100) / nTotalColaboradores
   nPercentualMulheresQuePagamIRRF := (nMulheresQuePagamIRRF * 100) / nMulheresAptas

   clear

   @ 00,00 to 07,79 
   @ 00,20 say "RELATORIO DOS COLABORADORES APOSENTADOS"
   
   @ 01,24 say "Relacao entre homens e mulheres"
   @ 02,01 say "Homens.................................: " + AllTrim(Str(nPercentualHomens)) + "%           Mulheres: " + AllTrim(Str(nPercentualMulheres)) + "%"
   @ 03,01 say "Valor total da remuneracao.............: R$" + Transform(nValorTotalRemuneracao, "@E 99,999,999.99")
   @ 04,01 say "Homens com mais de 91 anos.............: " + AllTrim(Str(nHomensComMaisDeNoventaEUm))
   @ 05,01 say "Mulheres admitidas antes do ano de 2013: " + AllTrim(Str(nMulheresAntesDoisMilETreze))
   @ 06,01 say "Porcentagem de mulheres que pagam IRRF.: " + AllTrim(Str(nPercentualMulheresQuePagamIRRF))
   Inkey(0)
enddo