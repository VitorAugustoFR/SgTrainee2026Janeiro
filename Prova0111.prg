//Vitor Augusto Faria Ramalho

clear

//Variaveis
cNome             := space(20)
cCurso            := space(10)
nSerie            := 0
nValorMensalidade := 0
//Disciplinas
cDisciplinaUm              := space(3)
nMediaNotasDisciplinaUm    := 0
nMediaFaltasDisciplinaUm   := 0
cDisciplinaDois            := space(3)
nMediaNotasDisciplinaDois  := 0
nMediaFaltasDisciplinaDois := 0
cDisciplinaTres            := space(3)
nMediaNotasDisciplinaTres  := 0
nMediaFaltasDisciplinaTres := 0
//Bimestres
nPrimeiroBiNotas  := 0
nPrimeiroBiFaltas := 0
nSegundoBiNotas   := 0
nSegundoBiFaltas  := 0
nTerceiroBiNotas  := 0
nTerceiroBiFaltas := 0
nQuartoBiNotas    := 0
nQuartoBiFaltas   := 0
//Relacionado a aprovações
cAprovaDisciplinaUmNota    := "G/N"
cAprovaDisciplinaUmFalta   := "G/N"
cAprovaDisciplinaDoisNota  := "G/N"
cAprovaDisciplinaDoisFalta := "G/N"
cAprovaDisciplinaTresNota  := "G/N"
cAprovaDisciplinaTresFalta := "G/N"
nNumeroDeDPs               := 0
cAprovacao                 := "Aprovado"

@ 00,00 to 09,79

@ 00,25 say "Escola Municipal SG Sistemas"

@ 01,01 say "Digite os seguintes dados do aluno: "
@ 02,01 say "Nome................: "
@ 03,01 say "Curso...............: "
@ 04,01 say "Serie...............: "
@ 05,01 say "Valor da mensalidade: "
@ 06,01 say "Disciplina 1........: "
@ 07,01 say "Disciplina 2........: "
@ 08,01 say "Disciplina 3........: "


@ 02,22 get cNome             picture "@!"           valid !Empty(cNome)
@ 03,22 get cCurso            picture "@!"           valid !Empty(cCurso)
@ 04,22 get nSerie            picture "9"            valid nSerie >= 1 .and. nSerie <= 8
@ 05,22 get nValorMensalidade picture "@E 99,999.99" valid !Empty(nValorMensalidade)
@ 06,22 get cDisciplinaUm     picture "@!"           valid !Empty(cDisciplinaUm)
@ 07,22 get cDisciplinaDois   picture "@!"           valid !Empty(cDisciplinaDois)
@ 08,22 get cDisciplinaTres   picture "@!"           valid !Empty(cDisciplinaTres)
read

clear

//Disciplina 1
@ 01,01 say "Insira as notas de faltas bimestrais das respectivas disciplinas: "

@ 02,00 to 06,75
@ 02,36 say cDisciplinaUm
@ 03,01 say "Primeiro Bimestre | Segundo Bimestre | Terceiro Bimestre | Quarto Bimestre"
@ 04,01 say "                  |                  |                   |"
@ 05,01 say "                  |                  |                   |"

@ 04,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100
@ 05,09 get nPrimeiroBiFaltas picture "99" 
@ 04,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100
@ 05,28 get nSegundoBiFaltas  picture "99" 
@ 04,47 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100
@ 05,48 get nTerceiroBiFaltas picture "99" 
@ 04,65 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100
@ 05,66 get nQuartoBiFaltas   picture "99" 
read
//Calculos
nMediaNotasDisciplinaUm  := (nPrimeiroBiNotas + nSegundoBiNotas + nTerceiroBiNotas + nQuartoBiNotas) / 4
nMediaFaltasDisciplinaUm := (nPrimeiroBiFaltas + nSegundoBiFaltas + nTerceiroBiFaltas + nQuartoBiFaltas) / 4
if nSerie <= 3
   if nPrimeiroBiFaltas > 6 .or. nSegundoBiFaltas > 6 .or. nTerceiroBiFaltas > 6 .or. nQuartoBiFaltas > 6
      cAprovaDisciplinaUmFalta := "R/N"
   end if
end if

if nSerie > 3
   if nPrimeiroBiFaltas > 8 .or. nSegundoBiFaltas > 8 .or. nTerceiroBiFaltas > 8 .or. nQuartoBiFaltas > 8
      cAprovaDisciplinaUmFalta := "R/N"
   end if
end if

//Discipina 2
@ 08,00 to 12,75
@ 10,01 say "                  |                  |                   |"
@ 11,01 say "                  |                  |                   |"

@ 08,36 say cDisciplinaDois
@ 09,01 say "Primeiro Bimestre | Segundo Bimestre | Terceiro Bimestre | Quarto Bimestre"

@ 10,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100
@ 11,09 get nPrimeiroBiFaltas picture "99" 
@ 10,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100
@ 11,28 get nSegundoBiFaltas  picture "99" 
@ 10,47 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100
@ 11,48 get nTerceiroBiFaltas picture "99" 
@ 10,65 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100
@ 11,66 get nQuartoBiFaltas   picture "99" 
read
//Calculos
nMediaNotasDisciplinaDois  := (nPrimeiroBiNotas + nSegundoBiNotas + nTerceiroBiNotas + nQuartoBiNotas) / 4
nMediaFaltasDisciplinaDois := (nPrimeiroBiFaltas + nSegundoBiFaltas + nTerceiroBiFaltas + nQuartoBiFaltas) / 4
if nSerie <= 3
   if nPrimeiroBiFaltas > 6 .or. nSegundoBiFaltas > 6 .or. nTerceiroBiFaltas > 6 .or. nQuartoBiFaltas > 6
      cAprovaDisciplinaDoisFalta := "R/N"
   end if
end if

if nSerie > 3
   if nPrimeiroBiFaltas > 8 .or. nSegundoBiFaltas > 8 .or. nTerceiroBiFaltas > 8 .or. nQuartoBiFaltas > 8
      cAprovaDisciplinaDoisFalta := "R/N"
   end if
end if

//Disciplina 3
@ 14,00 to 18,75
@ 16,01 say "                  |                  |                   |"
@ 17,01 say "                  |                  |                   |"

@ 14,36 say cDisciplinaTres
@ 15,01 say "Primeiro Bimestre | Segundo Bimestre | Terceiro Bimestre | Quarto Bimestre"

@ 16,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100
@ 17,09 get nPrimeiroBiFaltas picture "99" 
@ 16,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100
@ 17,28 get nSegundoBiFaltas  picture "99" 
@ 16,47 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100
@ 17,48 get nTerceiroBiFaltas picture "99" 
@ 16,65 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100
@ 17,66 get nQuartoBiFaltas   picture "99" 
read
//Calculos
nMediaNotasDisciplinaTres  := (nPrimeiroBiNotas + nSegundoBiNotas + nTerceiroBiNotas + nQuartoBiNotas) / 4
nMediaFaltasDisciplinaTres := (nPrimeiroBiFaltas + nSegundoBiFaltas + nTerceiroBiFaltas + nQuartoBiFaltas) / 4
if nSerie <= 3
   if nPrimeiroBiFaltas > 6 .or. nSegundoBiFaltas > 6 .or. nTerceiroBiFaltas > 6 .or. nQuartoBiFaltas > 6
      cAprovaDisciplinaTresFalta := "R/N"
   end if
end if

//Validacoes
//Reprova
if nSerie > 3
   if nPrimeiroBiFaltas > 8 .or. nSegundoBiFaltas > 8 .or. nTerceiroBiFaltas > 8 .or. nQuartoBiFaltas > 8
      cAprovaDisciplinaTresFalta := "R/N"
   end if
end if

if nSerie <= 4
   if nMediaNotasDisciplinaUm < 60
      cAprovaDisciplinaUmNota := "R/N"
   end if
   if nMediaNotasDisciplinaDois < 60
      cAprovaDisciplinaDoisNota := "R/N"
   end if
   if nMediaNotasDisciplinaTres < 60
      cAprovaDisciplinaTresNota := "R/N"
   end if
end if

if nSerie > 4
   if nMediaNotasDisciplinaUm < 70
      cAprovaDisciplinaUmNota := "R/N"
   end if
   if nMediaNotasDisciplinaDois < 70
      cAprovaDisciplinaDoisNota := "R/N"
   end if
   if nMediaNotasDisciplinaTres < 70
      cAprovaDisciplinaTresNota := "R/N"
   end if
end if

//Valor da mensalidade + DPs
nValorMensalidadeOriginal := nValorMensalidade
if cAprovaDisciplinaUmNota == "R/N" .or. cAprovaDisciplinaUmFalta == "R/N"
   nNumeroDeDPs++
   nValorMensalidade += nValorMensalidadeOriginal * 0.2
end if

if cAprovaDisciplinaDoisNota == "R/N" .or. cAprovaDisciplinaDoisFalta == "R/N"
   nNumeroDeDPs++
   nValorMensalidade += nValorMensalidadeOriginal * 0.2
end if

if cAprovaDisciplinaTresNota == "R/N" .or. cAprovaDisciplinaTresFalta == "R/N"
   nNumeroDeDPs++
   nValorMensalidade += nValorMensalidadeOriginal * 0.2
end if

if nNumeroDeDPs > 0
   cAprovacao := "Aprovado com pendencia(s)"
   if nNumeroDeDPs >= 3
      cAprovacao := "Reprovado"
   end if
end if



clear
//boletim
@ 00,00 to 11,63

@ 00,32 say "Boletim Escolar"
@ 01,01 say "Aluno: " + cNome
@ 02,01 say "Curso: " + cCurso
@ 03,01 say "Seria: " + AllTrim(Str(nSerie))
@ 04,01 say "--------------------------------------------------------------"
@ 05,01 say "Disciplina 1: " + cDisciplinaUm
@ 06,01 say "Media notas: " + AllTrim(Str(nMediaNotasDisciplinaUm)) color cAprovaDisciplinaUmNota
@ 07,01 say "Media Faltas: " + AllTrim(Str(nMediaFaltasDisciplinaUm)) color cAprovaDisciplinaUmFalta
@ 05,21 say "| Disciplina 2: " + cDisciplinaDois
@ 06,21 say "| Media notas: " + AllTrim(Str(nMediaNotasDisciplinaDois)) color cAprovaDisciplinaDoisNota
@ 07,21 say "| Media Faltas: " + AllTrim(Str(nMediaFaltasDisciplinaDois)) color cAprovaDisciplinaDoisFalta
@ 05,42 say "| Disciplina: " + cDisciplinaTres
@ 06,42 say "| Media notas: " + AllTrim(Str(nMediaNotasDisciplinaTres)) color cAprovaDisciplinaTresNota
@ 07,42 say "| Media Faltas: " + AllTrim(Str(nMediaFaltasDisciplinaTres)) color cAprovaDisciplinaTresFalta
@ 09,01 say "Valor atualizado da mensaliadade: " + AllTrim(Str(nValorMensalidade))
@ 10,01 say "Situacao: " + cAprovacao