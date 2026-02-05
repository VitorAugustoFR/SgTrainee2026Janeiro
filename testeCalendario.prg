set date brit
set epoch to 1940
clear
dData := Date()
ndia := 1
dUltimoDiaDomnes := CToD("1/"+(AllTrim(Str(Month(dData) + 1)))+ "/" + AllTrim(Str(Year(dData)))) - 1
do while ndia > Day(dUltimoDiaDomnes)
   
enddo