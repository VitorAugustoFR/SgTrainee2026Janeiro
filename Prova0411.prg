//Vitor Augusto Faria Ramalho
set scoreBoard off
set date Brit
set epoch to 1940

cIdProdutos    := space(8)
cDescricoes    := space(30)
cQuantidades   := space(4)
cDatasCadastro := space(8)
do while .t.
   clear

   @ 00,00 to 24,79

   //Variaveis validações
   cValidacaoLetras   := "ABCDEFGHIJKLMNOPQRSTUWXYZ"
   cValidacoesNumeros := "1234567890"
   cValidacaoSimbolos := "!@#$%¨&*()_+=-¬¢£³²¹'`´^~{[]}^~:;>.<<?/°ºª§\|"



   @ 01,34 say "SG SISTEMAS"
   @ 02,01 to 02,78

   @ 03,14 to 23,14
   @ 03,03 prompt "CADASTRAR"
   @ 04,03 prompt "DELETAR"
   @ 05,03 prompt "SAIR"
   if LastKey() == 27
      nOpcao := 3
   endif
   menu to nOpcao

   if nOpcao == 2
      if Len(AllTrim(cIdProdutos)) < 8
         Alert("NENHUM PRODUTO CADASTRADO!")
         loop
      endif
   elseif nOpcao == 3
      exit
   endif

   //Cadastro
   do while nOpcao == 1
      @ 03,17 clear to 23,78

      cIdProduto    := space(8)
      cDescricao    := space(30)
      nQuantidade   := 0
      dDataCadastro := Date()


      @ 03,17 say "ID (8 CARACTERES): "
      @ 04,17 say "DESCRICAO........: "
      @ 05,17 say "QUANTIDADE.......: "
      @ 06,17 say "DATA CADASTRO....: "

      @ 03,36 get cIdProduto picture '@!' valid !Empty(cIdProduto)
      read
      if LastKey() == 27
         nMenuOpcao1 := Alert("Deseja?", {"Continuar", "Sair"})
         if nMenuOpcao1 == 1
            loop
         elseif nMenuOpcao1 == 2
            exit
         endif
      endif

      //validacoes Id
      //variaveis de validacao
      nTamanoId            := Len(AllTrim(cIdProduto))
      nChecagemAtual       := 1
      nQuantidadeLetras    := 0
      nQuantidadeNumeros   := 0
      nTemCaracterEspecial := 0
      //tamanho
      if nTamanoId < 8
         Alert("ID DEVE TER EXATAMENTE 8 CARACTERES!")
         loop
      endif
      //Letras e Numeros
      do while nTamanoId >= nChecagemAtual
         cCaractereAtual    := space(1)

         cCaractereAtual := SubStr(cIdProduto,nChecagemAtual,1)
         if cCaractereAtual $ cValidacaoLetras
            nQuantidadeLetras++
         elseif cCaractereAtual $ cValidacoesNumeros
            nQuantidadeNumeros++
         elseif cCaractereAtual $ cValidacaoSimbolos .or. cCaractereAtual == '"'
            nTemCaracterEspecial++
         endif
         nChecagemAtual++
      enddo
      //checagem
      if nTemCaracterEspecial > 0
         Alert("ID INVALIDO! USE APENAS LETRAS E NUMEROS.")
         loop
      elseif nQuantidadeLetras < 4
         Alert("ID DEVE TER PELO MENOS 4 LETRAS!")
         loop
      elseif nQuantidadeNumeros < 2
         Alert("ID DEVE TER PELO MENOS 2 NUMEROS!")
         loop
      endif

      cIdProdutos    += cIdProduto

      @ 04,36 get cDescricao     picture '@!'   valid !Empty(cDescricao)
      @ 05,36 get nQuantidade    picture '9999' valid nQuantidade > 0
      @ 06,36 get dDataCadastro
      read
      if LastKey() == 27
         nMenuOpcao1 := Alert("Deseja?", {"Continuar", "Abandonar"})
         if nMenuOpcao1 == 2
            exit
         endif
      endif
      
      cDescricoes    += cDescricao
      cQuantidades   += Str(nQuantidade)
      cDatasCadastro += DToC(dDataCadastro)
      
   enddo

   //Deletar
   do while nOpcao == 2 
      @ 03,25 clear to 23,25 
      @ 03,25 to 23,25

      nIdAtual := 1
      nTamanhoIds := Len(cIdProdutos)
      cIdAtual := space(8)
      nTotalInseridos := 0

      cIdSelecionado := space(8)
      cDescricaoSelecionada := space(30)
      nQuantidadeSelecionada := 0
      dDataCadastroSelecionda := CToD("")

      for i := 1 to (nTamanhoIds / 8)
         cIdAtual := SubStr(AllTrim(cIdProdutos),nIdAtual,8)
         @ i + 2,16 prompt cIdAtual

         nIdAtual += 8
         nTotalInseridos++
      next
      menu to nOpcao2
      
      if LastKey() == 27
         exit
      endif

      for s := 1 to 30
         cIdSelecionado          := SubStr(cIdProdutos,nOpcao2 * 8 + 1, 8)
         cDescricaoSelecionada   := SubStr(cDescricoes,nOpcao2 * 30 + 1, 30)
         nQuantidadeSelecionada  := Val(SubStr(cQuantidades,nOpcao2 * 4 + 1, 4))
         dDataCadastroSelecionda := CToD(SubStr(cDatasCadastro,nOpcao2 * 8 + 1, 8))
      next
      @ 03,27 say "ID.................: " + cIdSelecionado
      @ 04,27 say "DESCRICAO..........: " + cDescricao
      @ 05,27 say "QUANTIDADE.........: " + Str(nQuantidadeSelecionada)
      @ 06,27 say "DATA CADASTRO......: " + DToC(dDataCadastroSelecionda)

      //calendario
      nDiaDaSemana := DoW(dDataCadastroSelecionda)
      nDia := Day(dDataCadastroSelecionda)
      nMes := Month(dDataCadastroSelecionda)
      nAno := Year(dDataCadastroSelecionda)

      nUltimoDiaDoMes := Day(CToD("1/"+ AllTrim(Str(nMes)) + "/" + AllTrim(Str(nAno))) - 1)

      nColuna := 10
      nLinha  := 31

      @ 15,01 say Str(nUltimoDiaDoMes)
      for d := 1 to nUltimoDiaDoMes
         @ 31,09 say "D  S  T  Q  Q  S  S"

         @ nLinha,nColuna say AllTrim(Str(nDia))

         if nDiaDaSemana == 7
            nColuna++
         endif
         if nDia > 10
            nLinha++
         else
            nLinha += 2
         endif
      next

      //deletando
      cConfirmaExclusao := space(1)
      @ 23,27 say "Confirma exlclusao:   [S/N]"

      @ 23,47 get cConfirmaExclusao picture '@!' valid cConfirmaExclusao $ "SN"
      read
      if cConfirmaExclusao == "S"
         for e := 1 to 30
            cIdProdutos    := SubStr(cIdProdutos, 1, nOpcao2 * 8 + 1) + SubStr(cIdProdutos, nOpcao2 * 8 + 2, nTotalInseridos - nOpcao2 * 8)
            cDescricoes    := SubStr(cDescricoes, 1, nOpcao2 * 8 + 1) + SubStr(cDescricoes, nOpcao2 * 8 + 2, nTotalInseridos - nOpcao2 * 8)
            cQuantidades   := SubStr(cQuantidades, 1, nOpcao2 * 8 + 1) + SubStr(cQuantidades, nOpcao2 * 8 + 2, nTotalInseridos - nOpcao2 * 8)
            cDatasCadastro := SubStr(cDatasCadastro, 1, nOpcao2 * 8 + 1) + SubStr(cDatasCadastro, nOpcao2 * 8 + 2, nTotalInseridos - nOpcao2 * 8)
         next
         loop
      else
         loop
      endif

      
   enddo
   
enddo

//╔══════════════════════════════════════════════════════════════════════════════╗
//║                                 SG SISTEMAS                                  ║
//║══════════════════════════════════════════════════════════════════════════════║
//║  CADASTRAR  ║ ID (8 CARACTERES):                                             ║
//║  DELETAR    ║ DESCRICAO........:                                             ║
//║  SAIR       ║ QUANTIDADE.......:                                             ║
//║             ║ DATA CADASTRO....:                                             ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//║             ║                                                                ║
//╚══════════════════════════════════════════════════════════════════════════════╝

//╔══════════════════════════════════════════════════════════════════════════════╗
//║                                 SG SISTEMAS                                  ║
//║══════════════════════════════════════════════════════════════════════════════║
//║  CADASTRAR  ║ DFGB8345 ║ ID.................: DFGB8345                       ║
//║  DELETAR    ║ IFDJG874 ║ DESCRICAO..........: DJKFGHJD3845                   ║
//║  SAIR       ║ DFKJGH83 ║ QUANTIDADE.........: 3498                           ║
//║             ║          ║ DATA CADASTRO......: 30/01/26                       ║
//║             ║          ║                                                     ║
//║             ║          ║     D  S  T  Q  Q  S  S                             ║
//║             ║          ║                 1  2  3                             ║
//║             ║          ║     4  5  6  7  8  9 10                             ║
//║             ║          ║    11 12 13 14 15 16 17                             ║
//║             ║          ║    18 19 20 21 22 23 24                             ║
//║             ║          ║    25 26 27 28 29 30 31                             ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║                                                     ║
//║             ║          ║ Confirma exlclusao:   [S/N]                         ║
//╚══════════════════════════════════════════════════════════════════════════════╝