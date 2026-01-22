set scoreBoard off
do while .t.
   clear

   cSexo  := space(1)
   nIdade := 0
   nPeso  := 0

   @ 01,01 say "Digite seu sexo.: "

   @ 01,18 get cSexo picture "@!" valid cSexo $ "MF"
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

   if cSexo == "F"
      @ 02,01 say "Digite sua idade: "
      
      @ 02,18 get nIdade picture "999" valid nIdade >= 0 .and. nidade <= 130
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

      if LastKey() == 27
         nMenuOpcao2 := Alert("O que deseja fazer?",{"Continuar", "Voltar", "Sair"})
         if nMenuOpcao2 == 1

         elseif nMenuOpcao2 == 2
            loop
         elseif nMenuOpcao2 == 3
            exit
         endif
      endif

      if nIdade >= 21
         @ 03,01 say "Voce tem mais de 21 anos"
      endif
   elseif cSexo == "M"
      @ 02,01 say "Digite seu peso.: "

      @ 02,18 get nPeso picture "999.99" valid nPeso > 0
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

      if nPeso >= 100
         @ 03,01 say "Voce tem mais de 100 kilos"
      endif
   endif
enddo