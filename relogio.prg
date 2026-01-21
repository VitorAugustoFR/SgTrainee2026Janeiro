clear

nSegundos := 0
nMinutos := 0
nHoras := 0 
nDias := 0

do while .t.
   clear
   if nSegundos < 59
      nSegundos++
   else
      if nMinutos < 59
            nMinutos++
      else
         if nHoras < 23
            nHoras++
         else
            nHoras := 0
            nDias++
         end if
         nMinutos := 0
      end if
      nSegundos := 0
      Tone(233,1)
   end if

   @ 05,05 say AllTrim(Str(nDias)) + " : " + AllTrim(Str(nHoras)) + " : " + AllTrim(Str(nMinutos)) + " : " + AllTrim(Str(nSegundos))

   Inkey(1)
enddo