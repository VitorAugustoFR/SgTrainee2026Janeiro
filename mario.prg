SetColor("N/BG")
set scoreBoard off
set message to 5 Center 

do while .t.
    LastKey(0)
   clear
   cPlayer        := "R/R"
   nPlayerLife    := 5
   cEnemy         := "GR/GR"
   nEnemyLife     := 1
   nPosicaoHEnemy := 39
   cWall          := "G/G"
   nPosicaoH      := 01
   nPosicaoV      := 23
   nLastV         := 0
   nPulo          := 2
   //ft_LastKey(K_A)

   @ 00,00 to 04,79

   @ 00,31 say "SUPER MAURO MENU"
   @ 01,37 prompt "Jogar" message "Comecar o jogo"
   @ 02,37 prompt "Score" message "Tabela de jogadores"
   @ 03,37 prompt "Sair"  message "Sair do jogo"
   menu to nOpcao

   if nOpcao == 1
      nJogo := 1
   elseif nOpcao == 2
      nJogo := 2
   else
      exit
   endif

    do while nOpcao == 1
        nKey := Inkey(0.5)

        clear
        @ 00,00 say "Vidas " + Alltrim(Str(nPlayerLife))
        @ 24,00 to 24,79 color "G/G"


        if nKey == 27
            nMenuOpcao := Alert("O que deseja fazer?", {"Continuar", "Voltar ao menu"})
            if nMenuOpcao == 2
                exit
                nOpcao := 0
            endif
            loop
        elseif nKey == 65 .or. nKey == 19  .and. nPosicaoH > 1//A
            //Ultimo A
            @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
            nPosicaoH--
        elseif nKey == 68 .or. nKey == 4 .and. nPosicaoH < 78//D
            //Ultimo D
            @ nPosicaoV,nPosicaoH clear to nPosicaoV,nPosicaoH
            nPosicaoH++
        endif

        //Fisica + colisao
        nLastV := nPosicaoV
        if nPosicaoV < 23 .and. !(nPosicaoV == 23)
            nPosicaoV++
        endif
        //Pulo
        if nKey == 32 .and. nPosicaoV == 23
            nPosicaoV -= nPulo
        endif

        //Codigo do inimigo
        if nEnemyLife == 1
            if hb_RandomInt(0,1) == 0 .and. nPosicaoHEnemy > 1
                nPosicaoHEnemy--
            elseif hb_RandomInt(0,1) == 1 .and. nPosicaoHEnemy < 78
                nPosicaoHEnemy++
            endif
        endif

        if nPosicaoH == nPosicaoHEnemy .and. nPosicaoV == 23
            if nLastV == 23
                nPlayerLife--
            elseif nLastV == 22
                nEnemyLife--
            endif
        endif

        @ 23,nPosicaoHEnemy say " " color cEnemy

        
        @ nPosicaoV,nPosicaoH say " " color cPlayer

    enddo

enddo