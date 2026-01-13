set scoreBoard off
clear

cSexo  := space(1)
nIdade := 0
nPeso  := 0

@ 01,01 say "Digite seu sexo.: "

@ 01,18 get cSexo picture "@!" valid cSexo $ "MF"
read

if cSexo == "F"
   @ 02,01 say "Digite sua idade: "

   @ 02,18 get nIdade picture "999" valid nIdade >= 0 .and. nidade <= 130
   read

   if nIdade >= 21
      @ 03,01 say "Voce tem mais de 21 anos"
   endif
elseif cSexo == "M"
   @ 02,01 say "Digite seu peso.: "

   @ 02,18 get nPeso picture "999.99" valid nPeso > 0
   read

   if nPeso >= 100
      @ 03,01 say "Voce tem mais de 100 kilos"
   endif
endif