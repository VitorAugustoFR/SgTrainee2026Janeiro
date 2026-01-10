//Resolver o problema de cores
/*
   para guardar o canvas devo:
      guardar em um array a posicao no canvas e a cor,
      passar a posicao para um 
      if enter pressed
         array[]
*/

//static function brushMov


clear
SetMode (40,150)

cBrush := space(8)
cPencil := 'B/B'
nCorDoPincel := 0
cLimparCanvas := space(1)
lProgramaRodando := .t.
cCoresDisponiveis := "AZULVERDEBRANCOVERMELHO"
nCoordenadasPintadas := array(38, 148)
nPosicaoH := 73
nPosicaoV := 15



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

      
      @ 01,29 get cBrush picture '@!'
      read

      if LastKey() == 27
         nMenuOpcao := Alert("O que deseja fazer?", {"Continuar", "Selecao de cores", "Sair"})
         if nMenuOpcao == 1
            
         elseif  nMenuOpcao == 2
            exit
         elseif nMenuOpcao == 3
            lProgramaRodando := .f.
            exit
         endif
      endif
      
      if AllTrim(cBrush) $ "AZUL"
            cPencil := 'N/B'
            nCorDoPincel := 0
      elseif AllTrim(cBrush) $ "VERDE"
            cPencil := 'N/G'
            nCorDoPincel := 1
      elseif AllTrim(cBrush) $ "BRANCO"
            cPencil := 'N/W'
            nCorDoPincel := 2
      elseif AllTrim(cBrush) $ "VERMELHO"
            cPencil := 'N/R'
            nCorDoPincel := 3
      else
         Alert("Cor Invalida!")
         loop
      endif

      @ 01,40 say "Deseja limpar o canvas?(Digite S ou N)"
      @ 01,79 get cLimparCanvas picture '@!' valid cLimparCanvas $ "SN"
      read
      if cLimparCanvas == "S"
         @ 07,01 clear to 38,149// escolher um tamanho especifico para o canvas depois
         exit
      endif
   enddo

   do While(.t.)
      @ 06,00 to 39,149 

      if LastKey()     == 65 .or. LastKey() == 97  .and. nPosicaoH > 1//A
          //Ultimo A
      @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
          nPosicaoH--
      elseif LastKey() == 68 .or. LastKey() == 100 .and. nPosicaoH < 148//D
          //Ultimo D
      @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
          nPosicaoH++
      elseif LastKey() == 87 .or. LastKey() == 119 .and. nPosicaoV > 7//W
          //Ultimo w
      @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
          nPosicaoV--
      elseif LastKey() == 83 .or. LastKey() == 115 .and. nPosicaoV < 38//S
          //Ultimo S
      @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
          nPosicaoV++
      end if
      
      @ nPosicaoV,nPosicaoH say " " color cPencil
      InKey(0)


      if LastKey() == 13
         nCoordenadasPintadas[nPosicaoV, nPosicaoH] := cPencil
         //@ nPosicaoV, nPosicaoH say " " color cPencil
      endif


      for i := 7 to 38
         for x := 1 to 148
            @ i, x say " " color nCoordenadasPintadas[i,x]
         next
      next
      /*
      for i := 0 to linhas - 1
         for x := 0 to colunas - 1
            @ i,x say " " color nCoordenadasPintada[i,x]
         endfor
      endfor

      */

      if LastKey() == 27
         nMenuOpcao := Alert("O que deseja fazer?", {"Continuar", "Selecao de cores", "Sair"})
         if nMenuOpcao == 1
            
         elseif  nMenuOpcao == 2
            exit
         elseif nMenuOpcao == 3
            lProgramaRodando := .f.
            exit
         endif
      endif

      //
   enddo
enddo