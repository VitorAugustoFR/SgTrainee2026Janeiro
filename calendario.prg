set scoreBoard off
set date Brit
set epoch to 1940

clear

dDataAtual   := date()
nAnoAtual    := Year(dDataAtual)
nMesAtual    := Month(dDataAtual)
nDiaAtual    := Day(dDataAtual)
nDiaDaSemana := DoW(dDataAtual)

@ 09,09 to 15,32
@ 10,10 say " D  S  T  Q  Q  S  S "