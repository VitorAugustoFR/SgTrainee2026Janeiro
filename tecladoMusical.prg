clear

nTom := 0


do while .t.
   InKey(0)
   if LastKey() == 119
      //C
      nTom := 1046.5
   elseif LastKey() == 51
      //C#
      nTom := 1108.73
   elseif LastKey() == 101
      //D
      nTom := 1174.66
   elseif LastKey() == 52
      //D#
      nTom := 1244.51
   elseif LastKey() == 114
      //E
      nTom := 1318.51
   elseif LastKey() == 116
      //F
      nTom := 1396.91
   elseif LastKey() == 54
      //F#
      nTom := 1479.98
   elseif LastKey() == 121
      //G
      nTom := 1567.98
   elseif LastKey() == 55
      //G#
      nTom := 1661.22
   elseif LastKey() == 117
      //A
      nTom := 1760
   elseif LastKey() == 56
      //A#
      nTom := 1864.66
   elseif LastKey() == 105
      //B
      nTom := 1975.53
   endif

   @ 02,01 say Str(nTom)
   Tone(nTom, 3)
enddo