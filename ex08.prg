set scoreBoard off

clear

cProdutoUm      := space(20)
cProdutoDois    := space(20)
cProdutoTres    := space(20)
nQuantidadeUm   := 0 // N/5/2 '99.99'
nQuantidadeDois := 0 // N/5/2 '99.99'
nQuantidadeTres := 0 // N/5/2 '99.99'
nValorUm        := 0 // N/6/2 '999.99'
nValorDois      := 0 // N/6/2 '999.99'
nValorTres      := 0 // N/6/2 '999.99'
nSubTotalUm     := 0
nSubTotalDois   := 0
nSubTotalTres   := 0
nTotal          := 0

//@ 00,00 to 10,79

@ 01,09 to 06,70

@ 01,29 say "MERCEARIA DO SEU ZE"

@ 02,10 say " Index |        Produto       |  QNT  |  Valor | Sub. Total "
@ 03,10 say "   1   |                      |       |        |            "
@ 04,10 say "   2   |                      |       |        |            "
@ 05,10 say "   3   |                      |       |        |            "
@ 07,51 say "Total:  "

@ 03,19 get cProdutoUm    picture '@!' valid !Empty(cProdutoUm)
@ 03,44 get nQuantidadeUm picture "@E 99" valid nQuantidadeUm > 0
@ 03,50 get nValorUm      picture '@E 999.99' valid nValorUm > 0
read
nSubTotalUm := nQuantidadeUm * nValorUm
@ 03,59 say AllTrim(Str(nSubTotalUm))

@ 04,19 get cProdutoDois    picture '@!' valid !Empty(cProdutoDois)
@ 04,44 get nQuantidadeDois picture "@E 99" valid nQuantidadeDois > 0
@ 04,50 get nValorDois      picture '@E 999.99' valid nValorDois > 0
read
nSubTotalDois := nQuantidadeDois * nValorDois
@ 04,59 say AllTrim(Str(nSubTotalDois))

@ 05,19 get cProdutoTres    picture '@!' valid !Empty(cProdutoTres)
@ 05,44 get nQuantidadeTres picture "@E 99" valid nQuantidadeTres > 0
@ 05,50 get nValorTres      picture '@E 999.99' valid nValorTres > 0
read
nSubTotalTres := nQuantidadeTres * nValorTres

@ 05,59 say AllTrim(Str(nSubTotalTres))
nTotal += nSubTotalUm + nSubTotalDois + nSubTotalTres

@ 07,59 say AllTrim(Str(nTotal))


/*
//Variaveis Usuario
cNomeUsuario    := space(8)
cSenhaUsuario   := space(8)
//"ARRAY" de senha e usuarios
cNomesUsuarios  := space(40)
cSenhasUsuarios := space(40)
//Variaveis produto
cNomeProduto    := space(15)
nValorDoProduto := 0
nQuantidade     := 0
nValorTotal     := 0
//Variaveis variadas
nLoopPrincipal  := 1

do while nLoopPrincipal == 1
   clear
   cLogar          := space(1)
   cCriar          := space(1)

   @ 00,00 to 07,79
   @ 00,29 say "MERCADINHO DO SEU ZE!"
   @ 01,01 say "Deseja Logar...............? "
   @ 02,01 say "Deseja criar uma conta nova? "

   @ 01,29 get cLogar picture '@!' valid cLogar $ 'SN' 
   @ 02,29 get cCriar picture '@!' valid cCriar $ 'SN' 
   read

   do while cCriar $ 'S'
      clear
      @ 00,00 to 06,79
      @ 00,32 say "CRIE SUA CONTA!"
      @ 01,01 say "Digite seu nome de usuario: "
      @ 02,01 say "Digite sua senha..........: "

      @ 01,28 get cNomeUsuario  picture '@!'
      @ 02,28 get cSenhaUsuario picture '@!'
      read

      @ 04,01 say "Seu login e senha serao estes mesmos? "

      @ 04,38 get cLogar picture '@!' valid cLogar $ 'SN'
      read

      if cLogar $ 'S'
         cNomesUsuarios  += cNomeUsuario
         cSenhasUsuarios += cSenhaUsuario
         cCriar := 'N'
      else
         loop
      endif

      InKey(0)
   enddo

   do while cLogar $ 'S'
      
   enddo

   InKey(0)
enddo
*/