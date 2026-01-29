clear

 nOpcao := 0

@ 01,01 prompt "Exercicio 01"
@ 01,25 prompt "Exercicio 02"
@ 01,50 prompt "Sair"
menu to nOpcao

if nOpcao == 1
   Alert("Primeira opcao selecionada!")
elseif nOpcao == 2
   Alert("Segunda opcao selecionada!")
else
   Alert("Opcao zero selecionada")
endif
