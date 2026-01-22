do while .t.
   clear

   cNome  := space(20)
   nPeso  := 0 
   nIdade := 0

   @ 01,01 say "Digite seu nome.: "
   @ 03,01 say "Digite seu peso.: "
   @ 05,01 say "Digite sua idade: "

   @ 01,18 get cNome  picture '@!'        valid !Empty(cNome)
   @ 03,18 get nPeso  picture '@E 999.99' valid nPeso > 0
   @ 05,18 get nIdade picture '999'       valid nIdade >= 0 .and. nIdade < 130
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

   clear
   @ 01,01 say "Nome.: " + AllTrim(cNome)
   @ 02,01 say "Peso.: " + Alltrim(Str(nPeso))
   @ 03,01 say "Idade: " + Alltrim(Str(nIdade))

   InKey(0)
enddo