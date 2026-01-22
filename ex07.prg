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
