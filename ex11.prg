set scoreBoard off
set date Brit
set epoch to 1940

do while .t.
   clear

   cNome      := space(20)
   cEsporte   := space(15)
   cCategoria := space(10)
   dNacimento := CToD("")
   dAtual     := Date()
   nIdade     := 0

   @ 00,00 to 10,79

   @ 00,34 say "BUSCA-ALUNO"

   @ 01,01 say "Digite o esporte............: "
   @ 02,01 say "Digite o nome do praticante.: "
   @ 03,01 say "Digite a idade do praticante: "

   @ 01,30 get cEsporte picture "@!"  valid !Empty(cEsporte)
   @ 02,30 get cNome    picture "@!"  valid !Empty(cNome)
   @ 03,30 get dNascimento            valid dNacimento < dAtual - 5
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

   nAnoAtual := Year(dAtual)
   nMesAtual := Month(dAtual)
   nDiaAtual := Day(dAtual)

   nIdade :=  nAnoAtual - nAnoNascimento
   if nMesNascimento > nMesAtual
      nIdade--
   endif
   if nMesNascimento == nMesAtual
      if nDiaNascimento > nDiaAtual
         nIdade--
      endif
   endif

   if 5 <= nIdade .and. nIdade <= 7
      cCategoria := "Infantil A"
   elseif 8 <= nIDade .and. nIdade <= 10
      cCategoria := "Infantil B"
   elseif 11 <= nIDade .and. nIdade <= 13
      cCategoria := "Juvenil A"
   elseif 14 <= nIDade .and. nIdade <= 17
      cCategoria := "Juvenil B"
   elseif nIdade >= 18
      cCategoria := "Senior"
   endif

   @ 04,01 say "-------------------------------ALUNO-EM-QUESTAO-------------------------------"

   @ 06,01 say "Aluno....: " + AllTrim(cNome)
   @ 07,01 say "Esporte..: " + AllTrim(cEsporte)
   @ 08,01 say "Idade....: " + AllTrim(Str(nIdade))
   @ 09,01 say "Categoria: " + AllTrim(cCategoria)
   InKey(0)
enddo