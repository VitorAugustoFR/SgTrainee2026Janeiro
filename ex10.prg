set scoreBoard off
set date Brit
set epoch to 1940

do while .t.
   clear

   cNome       := space(20)
   dNascimento := CToD("")
   dDataAtual  := date()
   nIdade      := 0

   @ 00,00 to 07,79

   @ 01,01 say "Digite seu nome e sua idade: "
   @ 02,01 say "Nome.......................: "
   @ 03,01 say "Data de nascimento.........: "

   @ 02,29 get cNome  picture "@!" valid !Empty(cNome)
   @ 03,29 get dNascimento valid nIdade >= 0 .and. nIdade <= 130
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

   nAnoNascimento := Year(dNascimento)
   nMesNascimento := Month(dNascimento)
   nDiaNascimento := Day(dNascimento)

   nAnoAtual := Year(dDataAtual)
   nMesAtual := Month(dDataAtual)
   nDiaAtual := Day(dDataAtual)

   nIdade :=  nAnoAtual - nAnoNascimento
   if nMesNascimento > nMesAtual
      nIdade--
   endif
   if nMesNascimento == nMesAtual
      if nDiaNascimento > nDiaAtual
         nIdade--
      endif
   endif

   @ 04,01 say "Sua idade e: " + AllTrim(Str(nIdade))

   if nIdade < 21
      @ 05,01 say "Voce nao tem mais de 21 anos de idade"
   elseif nIdade >= 21 
      @ 05,01 say "Voce tem mais de 21 anos de idade"
   endif
enddo