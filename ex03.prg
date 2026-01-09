SetMode (25,80)
clear

nPreco      := 0
nQuantidade := 0

@ 01,01 say "Digite o preco de um produto........: "
@ 02,01 say "Agora digite a quantidade do produto: "

@ 01,38 get nPreco
@ 02,38 get nQuantidade
read

@ 04,01 say "Preco do produto: " + Str(nQuantidade * nPreco)