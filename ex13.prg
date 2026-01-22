SetColor ("N/W")
set scoreBoard off

do while .t.
   clear

   cClassificacao := space(31)
   cCor := 'W/G'
   nCodigo := 0

   @ 00,00 to 04,79 color 'Y/W'

   @ 01,01 say "Digite o codigo do produto comprado: "

   @ 01,37 get nCodigo picture "99" valid nCodigo > 0 
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

   if nCodigo == 1
      cClassificacao := "Alimento nao-perecivel"
      cCor := 'N/W'
   elseif nCodigo >= 2 .and. nCodigo <= 4
      cClassificacao := "Alimento perecivel"
      cCor := 'B/W'
   elseif nCodigo >= 5 .and. nCodigo <= 6
      cClassificacao := "Vestuario"
      cCor := 'G/W'
   elseif nCodigo == 7
      cClassificacao := "Higiene pessoal"
      cCor := 'R/W'
   elseif nCodigo >= 8 .and. nCodigo <= 15
      cClassificacao := "Limpeza e utensilios domesticos"
      cCor := 'GR+/W'
   else
      cClassificacao := "Codigo invalido"
      cCor := 'W/RB'
   endif

   @ 03,01 say "Classificacao do produto: " + AllTrim(cClassificacao) color cCor 
enddo