//Vitor Augusto Faria Ramalho

clear

/*Correções feitas
validaçao para evitar ter notas e faltas a baixo de 0
coloquei as disciplinas as quais o aluno reprovou
calculo da mensalidade unico(ao invés de usar varios ifs)
*/

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
cMateriasQueFicouEmDP      := " "
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

@ 02,00 to 08,75
@ 05,01 say " " + cDisciplinaUm
@ 06,01 say " " + cDisciplinaDois
@ 07,01 say " " + cDisciplinaTres
@ 03,05 say " |Primeiro Bimestre | Segundo Bimestre | Terceiro Bimestre | Quarto Bimestre"
@ 04,05 say " | Notas |  Faltas  | Notas |  Faltas  | Notas  |  Faltas  | Notas | Faltas "
@ 05,05 say " |       |          |       |          |        |          |       |"
@ 06,05 say " |       |          |       |          |        |          |       |"
@ 07,05 say " |       |          |       |          |        |          |       |"

@ 05,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100 .and. nPrimeiroBiNotas >= 0
@ 05,17 get nPrimeiroBiFaltas picture "99"  valid nPrimeiroBiFaltas >= 0
@ 05,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100 .and. nSegundoBiNotas >= 0
@ 05,36 get nSegundoBiFaltas  picture "99"  valid nSegundoBiFaltas >= 0
@ 05,46 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100 .and. nTerceiroBiNotas >= 0
@ 05,56 get nTerceiroBiFaltas picture "99"  valid nTerceiroBiFaltas >= 0
@ 05,66 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100 .and. nQuartoBiNotas >= 0
@ 05,74 get nQuartoBiFaltas   picture "99"  valid nQuartoBiFaltas >= 0
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
@ 06,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100 .and. nPrimeiroBiNotas >= 0
@ 06,17 get nPrimeiroBiFaltas picture "99"  valid nPrimeiroBiFaltas >= 0
@ 06,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100 .and. nSegundoBiNotas >= 0
@ 06,36 get nSegundoBiFaltas  picture "99"  valid nSegundoBiFaltas >= 0
@ 06,46 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100 .and. nTerceiroBiNotas >= 0
@ 06,56 get nTerceiroBiFaltas picture "99"  valid nTerceiroBiFaltas >= 0
@ 06,66 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100 .and. nQuartoBiNotas >= 0
@ 06,74 get nQuartoBiFaltas   picture "99"  valid nQuartoBiFaltas >= 0
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
@ 07,08 get nPrimeiroBiNotas  picture "999" valid nPrimeiroBiNotas <= 100 .and. nPrimeiroBiNotas >= 0
@ 07,17 get nPrimeiroBiFaltas picture "99"  valid nPrimeiroBiFaltas >= 0
@ 07,27 get nSegundoBiNotas   picture "999" valid nSegundoBiNotas  <= 100 .and. nSegundoBiNotas >= 0
@ 07,36 get nSegundoBiFaltas  picture "99"  valid nSegundoBiFaltas >= 0
@ 07,46 get nTerceiroBiNotas  picture "999" valid nTerceiroBiNotas <= 100 .and. nTerceiroBiNotas >= 0
@ 07,56 get nTerceiroBiFaltas picture "99"  valid nTerceiroBiFaltas >= 0
@ 07,66 get nQuartoBiNotas    picture "999" valid nQuartoBiNotas   <= 100 .and. nQuartoBiNotas >= 0
@ 07,74 get nQuartoBiFaltas   picture "99"  valid nQuartoBiFaltas >= 0
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
   cMateriasQueFicouEmDP += cDisciplinaUm + " "
end if

if cAprovaDisciplinaDoisNota == "R/N" .or. cAprovaDisciplinaDoisFalta == "R/N"
   nNumeroDeDPs++
   cMateriasQueFicouEmDP += cDisciplinaDois + " "
end if

if cAprovaDisciplinaTresNota == "R/N" .or. cAprovaDisciplinaTresFalta == "R/N"
   nNumeroDeDPs++
   cMateriasQueFicouEmDP += cDisciplinaTres + " "
end if

nValorMensalidade += nValorMensalidadeOriginal * (nNumeroDeDPs * 0.2)

if nNumeroDeDPs > 0
   cAprovacao := "Aprovado com pendencia(s)"
   if nNumeroDeDPs >= 3
      cAprovacao := "Reprovado"
   end if
end if



clear
//boletim
@ 00,00 to 12,64

@ 00,24 say "Boletim Escolar"
@ 01,01 say "Aluno: " + cNome
@ 02,01 say "Curso: " + cCurso
@ 03,01 say "Serie: " + AllTrim(Str(nSerie))
@ 04,01 say "---------------------------------------------------------------"
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
@ 10,01 say "Ficou com Dependencia nas seguintes materia(s):" + cMateriasQueFicouEmDP
@ 11,01 say "Situacao: " + cAprovacao