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


   do While lEmOperacao == "S"
      clear
      @ 01,01 say "Resultado Atual = " + Alltrim(Str(nResultado))

      @ 03,01 say "Calculadora simples em harbour"
      @ 05,01 say "Digite a operacao a ser realziada e um numero"

      @ 06,01 get cOperacao
      @ 07,01 get nSegundoNumero
      read

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

   enddo
   exit
enddo
