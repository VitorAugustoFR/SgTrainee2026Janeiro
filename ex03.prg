do while .t.
   clear

   nPreco      := 0
   nQuantidade := 0

   @ 01,01 say "Digite o preco de um produto........: "
   @ 02,01 say "Agora digite a quantidade do produto: "

   @ 01,38 get nPreco
   @ 02,38 get nQuantidade
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

   @ 04,01 say "Preco do produto: " + Str(nQuantidade * nPreco)
end do