//Vitor Augusto Faria Ramalho

set date Brit
set epoch to 1940

clear

do while .t.
   //Dados do cabeçalho
   cVendedor      := space(30)
   dDataDaCotacao := Date()

   //Dados pessoais
   cNome    := space(30)
   nIdade   := 0
   cSexo    := space(1)
   nPeso    := 0 //999,9
   nAltura  := 0 //9,99
   cFumante := space(1)

   //Dados do plano
   cTipoDoPlano := space(1)
   cAbrangencia := space(1)

   //Dados da cotação
   nValorBaseCuidar  := 400
   nValorBaseVital   := 350

   //Variaveis variadas
   nImc                  := 0
   nContagemCarregamento := 0
   cBarraDeCarregamento  := space(1)
   cContagemVisual       := "########"
   nIndexadorCuidar      := 0
   nIndexadorVital       := 0


   @ 00,00 to 02,79
   @ 00,26 say "COTACAO DE PLANOS DE SAUDE"
   @ 01,01 say "Vendedor: "
   @ 01,54 say "Data da cotacao: " + DToC(dDataDaCotacao)

   @ 01,10 get cVendedor picture '@!' valid !Empty(cVendedor)
   @ 01,71 get dDataDaCotacao         valid !Empty(dDataDaCotacao)
   read
   if LastKey() == 27
      nMenuOpcao1 := Alert("Deseja sair do sistema?", {"Sim", "Nao"})
      if nMenuOpcao1 == 1
         exit
      endif
   endif

   @ 04,00 to 10,79
   @ 04,32 say "DADOS PESSOAIS"
   @ 05,01 say "Nome.........:                                        Idade: "
   @ 06,01 say "Sexo.........:   [M]asculino [F]eminino"
   @ 07,01 say "Peso (kg)....: "
   @ 08,01 say "Altura (m)...: "
   @ 09,01 say "Fumante?.....:   [S]im [Nao]"

   @ 05,15 get cNome    picture '@!'       valid !Empty(cNome)
   @ 05,61 get nIdade   picture '999'      valid nIdade > 0 .and. nIdade < 130
   @ 06,15 get cSexo    picture '@!'       valid cSexo $ "FM"
   @ 07,15 get nPeso    picture '@E 999.9' valid nPeso > 0 .and. nPeso < 700
   @ 08,15 get nAltura  picture '@E 9.99'  valid nAltura > 0 .and. nAltura < 3
   @ 09,15 get cFumante picture '@!'       valid cFumante $ "SN"
   read
   if LastKey() == 27
      nMenuOpcao2 := Alert("Abandonar cotacao?", {"Sim", "Nao"})
      if nMenuOpcao2 == 1
         loop
      endif
   endif

   @ 11,00 to 14,79
   @ 11,32 say "DADOS DO PLANO"
   @ 12,01 say "Tipo do plano....:   [E]nf [A]part [V]IP"
   @ 13,01 say "Abrangencia......:   [R]egional [N]acional"

   @ 12,19 get cTipoDoPlano picture '@!' valid cTipoDoPlano $ "EAV"
   @ 13,19 get cAbrangencia picture '@!' valid cAbrangencia $ "RN"
   read
   if LastKey() == 27
      nMenuOpcao3 := Alert("Abandonar cotacao?", {"Sim", "Nao"})
      if nMenuOpcao3 == 1
         loop
      endif
   endif

   do while nContagemCarregamento < 10
      @ 15,00 to 17,79
      @ 15,34 say "CALCULANDO"

      @ 16,01 say AllTrim(cBarraDeCarregamento)

      Inkey(1)
      nContagemCarregamento++
      cBarraDeCarregamento += cContagemVisual
   enddo

   //calculos
   nValorFinalCuidar := nValorBaseCuidar
   nValorFinalVital  := nValorBaseVital
   nImc              := nPeso / (nAltura * nAltura)
   nMesDaCotacao     := Month(dDataDaCotacao)

   //CUIDAR
   if nIdade < 35
      nIndexadorCuidar -= 0.15
   endif
   if nIdade > 55
      nIndexadorCuidar += 0.25
   endif
   if cSexo == "M"
      nIndexadorCuidar +=  0.1
   endif
   if cSexo == "F"
      nIndexadorCuidar -= 0.1
   endif
   if nImc > 28
      nIndexadorCuidar += 0.2
   endif
   if cFumante == "S"
      nIndexadorCuidar += 0.3
   endif
   if cTipoDoPlano == "A"
      nIndexadorCuidar += 0.35
   endif
   if cTipoDoPlano == "V"
      nIndexadorCuidar += 0.6
   endif
   if cAbrangencia == "N"
      nIndexadorCuidar += 0.2
   endif
   if nMesDaCotacao == 6
      nIndexadorCuidar -= 0.15
   endif

   //Vital
   if nIdade < 28
      nIndexadorVital -= 0.2
   endif
   if nIdade > 62
      nIndexadorVital += 0.3
   endif
   if cSexo == "M"
      nIndexadorVital -= 0.1
   endif
   if cSexo == "F"
      nIndexadorVital += 0.15
   endif
   if nImc > 26
      nIndexadorVital += 0.15
   endif
   if cFumante == "S"
      nIndexadorVital += 0.35
   endif
   if cTipoDoPlano == "A"
      nIndexadorVital += 0.3
   endif
   if cTipoDoPlano == "V"
      nIndexadorVital += 0.5
   endif
   if cAbrangencia == "N"
      nIndexadorVital += 0.15
   endif
   if nMesDaCotacao == 11
      nIndexadorVital -= 0.2
   endif

   //calculos finais
   nValorFinalCuidar      := nValorBaseCuidar * (1 + nIndexadorCuidar)
   nValorFinalVital       := nValorBaseVital * (1 + nIndexadorVital)
   nValorTrimestralCuidar := nValorFinalCuidar * 3
   nValorAnualCuidar      := nValorFinalCuidar * 12
   nValorTrimestralVital  := nValorFinalVital * 3
   nValorAnualVital       := nValorFinalVital * 12

   @ 15,00 clear to 17,79

   cCorCuidar := "W/G"
   cCorVital  := "W/G"

   if nValorFinalCuidar > nValorFinalVital
      cCorCuidar := "W/R"
   else
      cCorVital := "W/R"
   endif

   @ 15,00 to 21,40 color cCorCuidar
   @ 15,41 to 21,79 color cCorVital

   @ 16,01 say "CUIDAR                                 "                                                     color cCorCuidar
   @ 17,01 to 17,39                                                                                          color cCorCuidar
   @ 18,01 say "Mensal.....:R$ "   + Transform(nValorFinalCuidar, "@E 9,999.99")       + "                 " color cCorCuidar
   @ 19,01 say "Trimestral.:R$ "   + Transform(nValorTrimestralCuidar, "@E 9,999.99")  + "                 " color cCorCuidar
   @ 20,01 say "Anual......:R$"    + Transform(nValorAnualCuidar, "@E 99,999.99")      + "                "  color cCorCuidar

   @ 16,42 say "Vital                                "                                                    color cCorVital
   @ 17,42 to 17,78                                                                                       color cCorVital
   @ 18,42 say "Mensal.....:R$ "   + Transform(nValorFinalVital, "@E 9,999.99")       + "               " color cCorVital
   @ 19,42 say "Trimestral.:R$ "   + Transform(nValorTrimestralVital, "@E 9,999.99")  + "               " color cCorVital
   @ 20,42 say "Anual......:R$"    + Transform(nValorAnualVital, "@E 99,999.99")      + "              "  color cCorVital

   nAnoDaCotacao    := Year(dDataDaCotacao)
   nMesDoVencimento := Month(dDataDaCotacao)

   if nMesDoVencimento == 12
      nMesDoVencimento := 1
      nAnoDaCotacao++
   else
      nMesDoVencimento++
   endif

   dVencimentoDaCotacao := CToD("01/" + AllTrim(Str(nMesDoVencimento)) + "/" + AllTrim(Str(nAnoDaCotacao))) - 1
   @ 23,26 say "Cotacao valida ate " + DToC(dVencimentoDaCotacao)
   Inkey(0)
   clear
   loop
enddo