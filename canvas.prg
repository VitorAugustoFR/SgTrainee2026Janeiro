clear
SetMode (40,150)

cBrush := space(8)
cPencil := "B/B"
cLimparCanvas := space(1)
lProgramaRodando := .t.
cCoresDisponiveis := "AZULVERDEBRANCOVERMELHO"

do while lProgramaRodando == .t.
   @ 06,00 to 39,149 
   do while(cLimparCanvas != "N")
      @ 01,01 say "Escolha a cor do seu pincel: "
      @ 03,01 say "Cores disponiveis"
      @ 04,01 say " Azul | Verde | Branco | Vermelho"
      @ 05,02 say "    "     color 'N/B'  
      @ 05,09 say "     "    color 'N/G'  
      @ 05,17 say "      "   color 'N/W'  
      @ 05,26 say "        " color 'N/R'  
      @ 01,29 get cBrush picture("@!")
      read
      if !(cBrush $ cCoresDisponiveis)
         Alert("Cor Invalida!")
         loop
      endif
      switch cBrush
         case cBrush == "AZUL"
            cPencil color 'N/B' 
         case cBrush == "VERDE"
            cPencil color 'N/G'
         case cBrush == "BRANCO"
            cPencil color 'N/W'
         case cBrush == "VERMELHO"
            cPencil color 'N/R'
      end switch

      @ 01,40 say "Deseja limpar o canvas?(Digite S ou N)"
      @ 01,79 get cLimparCanvas picture("@!")
      read
      if cLimparCanvas == "S"
         clear// escolher um tamanho especifico para o canvas depois
      endif
   enddo

   do While(.t.)
      if LastKey() == 27
         nMenuOpcao := Alert("Continuar", "Selecao de cores", "Sair")
         if nMenuOpcao := 1
            
         elseif  nMenuOpcao := 2
            exit
         elseif nMenuOpcao := 3
            lProgramaRodando := .f.
         endif
      endif
      
   enddo
enddo