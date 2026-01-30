//Praticamente concluido só falta a parte visual

clear

nTom := 0
//C4
nNotas     := Array(12)
nNotas[1]  := 261.63
nNotas[2]  := 277.18
nNotas[3]  := 293.66
nNotas[4]  := 311.12
nNotas[5]  := 329.62
nNotas[6]  := 349.22
nNotas[7]  := 369.99
nNotas[8]  := 391.99
nNotas[9]  := 415.30
nNotas[10] := 440
nNotas[11] := 466.16
nNotas[12] := 493.88


do while .t.
   InKey(0)

   if LastKey() == 5 .and. nNotas[12] < 3951.05
      for i := 1 to 12
         nNotas[i] := nNotas[i] * 2
      next
   elseif LastKey() == 24 .and. nNotas[1] > 16.36
      for i := 1 to 12
         nNotas[i] := nNotas[i] / 2
      next
   endif

   if LastKey() == 119
      //C
      nTom := nNotas[1]
   elseif LastKey() == 51
      //C#
      nTom := nNotas[2]
   elseif LastKey() == 101
      //D
      nTom := nNotas[3]
   elseif LastKey() == 52
      //D#
      nTom := nNotas[4]
   elseif LastKey() == 114
      //E
      nTom := nNotas[5]
   elseif LastKey() == 116
      //F
      nTom := nNotas[6]
   elseif LastKey() == 54
      //F#
      nTom := nNotas[7]
   elseif LastKey() == 121
      //G
      nTom := nNotas[8]
   elseif LastKey() == 55
      //G#
      nTom := nNotas[9]
   elseif LastKey() == 117
      //A
      nTom := nNotas[10]
   elseif LastKey() == 56
      //A#
      nTom := nNotas[11]
   elseif LastKey() == 105
      //B
      nTom := nNotas[12]
   endif

   @ 10,05 to 5,05
   @ 10,05 to 10,25

   @ 02,01 say Str(nTom)
   Tone(nTom, 3)
enddo