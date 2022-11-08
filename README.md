# 📊 Criando um dataset da Escola Matriz com SQL 

O objetivo deste projeto é criar um banco de dados relacional sobre os produtos, serviços e alunos da Escola Matriz através da linguagem SQL, feita no software pgAdmin 4.

## 📝 Entendendo o dataset

Os dados são organizados em 11 tabelas, segue o dicionário das variáveis para entendimento:


- Jogos: todos os jogos criados pelo MatrizKIDS, disponíveis para todos alunos jogarem, aprenderem e se divertirem.
A maioria dos jogos foram feitos para serem jogados no computador, porém alguns jogos possuem compatibilidade para mobile e também conectividade com a interface do 
Arduino. 
  - Informações:
    - jogo_id: ID do jogo.
    - jogo_nome: nome do jogo.
    - plataforma: plataforma onde o jogo foi desenvolvido (ex: Scratch).
    - numero_jogadores: quantidade de jogadores que podem jogar simultaneamente.
    - compativel_celular: se o jogo pode ser jogado pelo celular.
    - compativel_arduino: se o jogo possui interface com o arduino.
- Podcasts: episódios publicados do MatrizCast, o podcast de educação da Escola Matriz. O objetivo do podcast é entrevistar os mais diversos profissionais para 
que eles possam orientar os jovens estudantes sobre o mercado de trabalho, principais desafios, habilidades requeridas e maiores aprendizados que fizeram diferença na
trajetória de cada um.
  - Informações:
    - podcast_id: ID do episódio.
    - titulo: título do episódio.
    - tema: tema do episódio.
    - nome_convidado: nome do convidado entrevistado.
    - descricao: breve descrição sobre o episódio.
    - duracao_minutos: tempo de duração em minutos do episódio.
- Cursos: treinamentos sobre alfabetização digital da Escola Matriz para alunos desde o ensino fudamental, com os projetos do MatrizKIDS, até pessoas com mais de
50 anos, com os projetos do Matriz4YOU.
  - Informações:
    - curso_id: ID do curso.
    - curso_nome: nome do curso.
    - publico_alvo: público alvo de alunos do curso.
    - duracao_minutos: duração total de aulas, em minutos, do curso completo.
    - quantidade_aulas: quantidade de aulas total do curso.
    - encontro_presencial: se o curso possui ou não encontros presenciais.
    - tempo_acesso_meses: quantidade de meses que as aulas ficarão disponíveis para o aluno na plataforma.
    - preco: preço em R$ para comprar o curso.
    - descricao: breve descrição sobre o curso.
- Serviços: tipos de serviços oferecidos para pequenas empresas através do projeto MatrizDeDADOS, que busca implementar Data Science para impulsionar pequenos
negócios.
  - Informações:
    - servico_id: ID do serviço.
    - servico_nome: nome do serviço.
    - tipo_empresa: setor/tipo da empresa na qual o serviço é destinado.
    - objetivo: qual é o objetivo esperado de resultados após a realização do serviço.
    - presencial_remoto: se o serviço será realizado 100% remoto ou presencial.
    - descricao: breve descrição sobre o serviço.
- Alunos: base de alunos matriculados na Escola Matriz.
  - Informações: 
    - aluno_id: ID do aluno.
    - nome: primeiro nome do aluno.
    - sobrenome: sobrenome completo do aluno.
    - apelido: como o aluno quer ser chamado na escola.
    - email: email do aluno.
    - idade: idade do aluno.
    - genero: gênero que o aluno se define.
    - cor: cor do aluno.
    - cidade: cidade onde o aluno mora atualmente.
    - estado: estado onde o aluno mora atualmente.
    - pais: país onde o aluno mora atualmente.
    - celular: número do celular para contato.
- Compra: compras gerais realizadas dentre os serviços/cursos disponibilizados pela Escola Matriz.
  - Informações:
    - compra_id: ID da compra.
    - status: se a compra foi aprovada ou não.
    - parcelas: número de vezes em que a compra foi parcelada.
    - data: data de quando a compra foi aprovada.
    - quantidade: quantidade de itens referentes a essa compra.
- Compra de cursos: compras dos cursos disponibilizados pela Escola Matriz.
  - Informações: 
    - curso_id: ID do curso.
    - curso_nome: nome do curso.
    - compra_id: ID da compra.
    - preco: preço da compra.
    - quantidade: quantidade de cursos comprados referentes a essa compra.
- Compra de serviços: compras dos serviços disponibilizados pela Escola Matriz.
  - Informações: 
    - servico_id: ID do serviço.
    - servico_nome: nome do serviço.
    - compra_id: ID da compra.
    - preco: preço da compra.
    - quantidade: quantidade de cursos comprados referentes a essa compra.
- Turmas: turmas de alunos dos cursos da Escola Matriz.
  - Informações:
    - curso_id: ID do curso.
    - curso_nome: nome do curso.
    - quantidade_alunos: quantidade de alunos matriculados nesta turma.
- Jogadores: alunos que jogam os jogos criados pelo MatrizKIDS.
  - Informações:
    - aluno_id: ID do aluno.
    - apelido: como o aluno quer ser chamado na escola.
    - jogo_predileto: qual é o jogo do MatrizKIDS predileto deste aluno.
- Espectadores: alunos que assistem os episódios do MatrizCast, o seu podcast de educação.
  - Informações:
    - aluno_id: ID do aluno.
    - apelido: como o aluno quer ser chamado na escola.
    - episodio_predileto: qual é o episódio do MatrizCast predileto deste aluno.

## 💻 Sobre o código

A primeira parte do código foi a criação das tabelas.
1) 
```

```


## ▶️ Para rodar o projeto
