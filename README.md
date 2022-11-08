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
1) Criando a tabela **jogos**:
```
CREATE TABLE jogos (
	jogo_id serial PRIMARY KEY,
	jogo_nome VARCHAR(30) NOT NULL,
	plataforma VARCHAR(30) NOT NULL,
	numero_jogadores INT NOT NULL,
	compativel_celular VARCHAR(30) NOT NULL,
	compativel_arduino VARCHAR(30) NOT NULL,
	UNIQUE (jogo_nome)
);
```
2) Criando a tabela **podcasts**:
```
CREATE TABLE podcasts (
	podcast_id serial PRIMARY KEY,
	titulo VARCHAR(30) NOT NULL,
	tema VARCHAR(30),
	nome_convidado VARCHAR(30) NOT NULL,
	descricao VARCHAR(255),
	duracao_minutos INT NOT NULL,
	UNIQUE (titulo)
);
```
3) Criando a tabela **cursos**:
```
CREATE TABLE cursos (
	curso_id serial PRIMARY KEY,
	curso_nome VARCHAR(30) NOT NULL,
	publico_alvo VARCHAR(30),
	duracao_minutos INT,
	quantidade_aulas INT,
	encontro_presencial VARCHAR(30),
	tempo_acesso_meses INT NOT NULL,
	preco INT NOT NULL,
	descricao VARCHAR(255),
	UNIQUE (curso_nome)
);
```
4) Criando a tabela **servicos**:
```
CREATE TABLE servicos (
	servico_id serial PRIMARY KEY,
	servico_nome VARCHAR(30) NOT NULL,
	tipo_empresa VARCHAR(30),
	objetivo VARCHAR(30),
	presencial_remoto VARCHAR(30),
	descricao VARCHAR(255),
	UNIQUE (servico_nome)
);
```
5) Criando a tabela **alunos**:
```
CREATE TABLE alunos (
	aluno_id serial PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	sobrenome VARCHAR(30) NOT NULL,
	apelido VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	idade INT NOT NULL,
	genero VARCHAR(30),
	cor VARCHAR(30),
	cidade VARCHAR(30),
	estado VARCHAR(30),
	país VARCHAR(30),
	celular VARCHAR(30) NOT NULL,
	UNIQUE (apelido)
);
```
6) Criando a tabela **compra**:
```
CREATE TABLE compra (
	compra_id serial PRIMARY KEY,
	status VARCHAR(30) NOT NULL,
	parcelas INT NOT NULL,
	data VARCHAR(30) NOT NULL,
	quantidade INT NOT NULL,
	UNIQUE (compra_id)
);
```
7) Criando a tabela **compra_cursos**:
```
CREATE TABLE compra_cursos (
	curso_id INT NOT NULL,
	curso_nome VARCHAR(30) NOT NULL,
	compra_id INT NOT NULL,
	preco INT NOT NULL,
	quantidade INT NOT NULL,
	CONSTRAINT fk_curso_id
		FOREIGN KEY (curso_id)
			REFERENCES cursos(curso_id)
);
ALTER TABLE compra_cursos
    ADD CONSTRAINT fk_compra_id FOREIGN KEY (compra_id) REFERENCES compra(compra_id);
ALTER TABLE compra_cursos
    ADD CONSTRAINT fk_curso_nome FOREIGN KEY (curso_nome) REFERENCES cursos(curso_nome);
```
8) Criando a tabela **compra_servicos**:
```
CREATE TABLE compra_servicos (
	servico_id INT NOT NULL,
	servico_nome VARCHAR(30) NOT NULL,
	compra_id INT NOT NULL,
	preco INT NOT NULL,
	quantidade INT NOT NULL,
	CONSTRAINT fk_servico_id
		FOREIGN KEY (servico_id)
			REFERENCES servicos(servico_id),
	CONSTRAINT fk_servico_nome
		FOREIGN KEY (servico_nome)
			REFERENCES servicos(servico_nome),
	CONSTRAINT fk_compra_id
		FOREIGN KEY (compra_id)
			REFERENCES compra(compra_id)
);
```
9) Criando a tabela **turmas**:
```
CREATE TABLE turmas (
	curso_id INT NOT NULL,
	curso_nome VARCHAR(30) NOT NULL,
	quantidade_alunos INT NOT NULL,
	CONSTRAINT fk_curso_id
		FOREIGN KEY (curso_id)
			REFERENCES cursos(curso_id),
	CONSTRAINT fk_curso_nome
		FOREIGN KEY (curso_nome)
			REFERENCES cursos(curso_nome)
);
```
10) Criando a tabela **jogadores**:
```
CREATE TABLE jogadores (
	aluno_id INT NOT NULL,
	apelido VARCHAR(30) NOT NULL,
	jogo_predileto VARCHAR(30) NOT NULL,
	CONSTRAINT fk_aluno_id
		FOREIGN KEY (aluno_id)
			REFERENCES alunos(aluno_id),
	CONSTRAINT fk_apelido
		FOREIGN KEY (apelido)
			REFERENCES alunos(apelido)
);
ALTER TABLE jogadores
    ADD CONSTRAINT fk_jogo_predileto FOREIGN KEY (jogo_predileto) REFERENCES jogos(jogo_nome);
```
11) Criando a tabela **espectadores**:
```
CREATE TABLE espectadores (
	aluno_id INT NOT NULL,
	apelido VARCHAR(30) NOT NULL,
	episodio_predileto VARCHAR(30) NOT NULL,
	CONSTRAINT fk_aluno_id
		FOREIGN KEY (aluno_id)
			REFERENCES alunos(aluno_id),
	CONSTRAINT fk_apelido
		FOREIGN KEY (apelido)
			REFERENCES alunos(apelido)
);
ALTER TABLE espectadores
    ADD CONSTRAINT fk_episodio_predileto FOREIGN KEY (episodio_predileto) REFERENCES podcasts(titulo);
```
Agora vamos inserir informações nas tabelas com o comando ``INSERT`` e vizualizá-las com o comando ``SELECT``.
12) Inserindo valores na tabela **jogos** e vizualizando em seguida:
```
INSERT INTO jogos 
	(jogo_id, jogo_nome, plataforma, numero_jogadores, compativel_celular, compativel_arduino)
VALUES
	(1, 'warX', 'Scratch', 1, 'Sim', 'Sim'),
	(2, 'Jumper', 'Scratch', 1, 'Sim', 'Sim'),
	(3, 'QuickLap', 'Scratch', 1, 'Não', 'Sim'),
	(4, 'ScratchCup', 'Scratch', 2, 'Não', 'Não');

SELECT * from jogos;
```
13) Inserindo valores na tabela **podcasts** e vizualizando em seguida:
```
INSERT INTO podcasts 
	(podcast_id, titulo, nome_convidado, duracao_minutos)
VALUES
	(1, 'Como tomar uma decisão', 'DIONISIO AGOURAKIS', 40),
	(2, 'Resolvedor de problemas', 'GIOVANI RAVAGNANI', 56),
	(3, 'O futuro é digital', 'ANDRE BALTIERI', 58),
	(4, 'O que é a nuvem?', 'LESLE SANTOS', 62);
	
SELECT * from podcasts;	
```
14) Inserindo valores na tabela **cursos**:
```
INSERT INTO cursos 
	(curso_id, curso_nome, tempo_acesso_meses, preco)
VALUES
	(1, 'A linguagem do futuro', 12, 190),
	(2, 'cratch com Arduino', 12, 49),
	(3, 'Seja digital', 24, 99);
```
15) Inserindo valores na tabela **servicos** e vizualizando em seguida:
```
INSERT INTO servicos 
	(servico_id, servico_nome, descricao)
VALUES
	(1, 'Aplicando Data Science', 'Serviço de implementação de DS em pequenas empresas'),
	(2, 'Criando KPIs', 'Estudo para identificar KPIs para pequenas empresas');
	
INSERT INTO servicos 
	(servico_id, servico_nome)	
VALUES
	(3, 'Utilizando ML');
	
SELECT * FROM servicos;
```
16) Inserindo valores na tabela **alunos** e vizualizando em seguida:
```
INSERT INTO alunos 
	(aluno_id, nome, sobrenome, apelido, email, idade, celular)
VALUES
	(1, 'Fábio', 'Mori', 'fabinho.mori' , 'fabinhomori@hotmail.com' , 33, '11 91234 5678'),
	(2, 'Sonia', 'Moraes', 'so.moraes' , 'soninhamoraes@hotmail.com' , 54, '11 91234 5678');
	
SELECT * FROM alunos;
```
17) Inserindo valores na tabela **compra** e vizualizando em seguida:
```
INSERT INTO compra 
	(compra_id, status, parcelas, data, quantidade)
VALUES
	(1, 'Aprovada', 12, '07.11.2022' , 3 ),
	(2, 'Aprovada', 2, '01.10.2022' , 1);
  
INSERT INTO compra 
	(compra_id, status, parcelas, data, quantidade)
VALUES
	(3, 'Aprovada', 6, '07.11.2022' , 1 );

SELECT * FROM compra;
```
18) Inserindo valores na tabela **compra_cursos** e vizualizando em seguida:
```
INSERT INTO compra_cursos 
	(curso_id, curso_nome, compra_id, preco, quantidade)
VALUES
	(1, 'A linguagem do futuro', 1, 190 , 3 ),
	(2, 'Seja digital', 2, 99 , 1);

SELECT * FROM compra_cursos;
```
19) Inserindo valores na tabela **compra_servicos** e vizualizando em seguida:
```
INSERT INTO compra_servicos 
	(servico_id, servico_nome, compra_id, preco, quantidade)
VALUES
	(1, 'Aplicando Data Science', 3, 5000, 1);

SELECT * FROM compra_servicos;
```
20) Inserindo valores na tabela **turmas** e vizualizando em seguida:
```
INSERT INTO turmas 
	(curso_id, curso_nome, quantidade_alunos)
VALUES
	(1, 'A linguagem do futuro', 2 ),
	(2, 'Seja digital', 10);

SELECT * FROM turmas;
```
21) Inserindo valores na tabela **jogadores** e vizualizando em seguida:
```
INSERT INTO jogadores 
	(aluno_id, apelido, jogo_predileto)
VALUES
	(1, 'fabinho.mori', 'warX' );

SELECT * FROM jogadores;
```
22) Inserindo valores na tabela **espectadores** e vizualizando em seguida:
```
INSERT INTO espectadores 
	(aluno_id, apelido, episodio_predileto)
VALUES
	(2, 'so.moraes', 'Como tomar uma decisão' );

SELECT * FROM espectadores;
```

## ▶️ Para rodar o projeto

Para rodar o projeto basta fazer download do software (pgAdmin4)[https://www.pgadmin.org/download/] e rodar o código fornecido nesta parta em uma 'Query Tool' dentro
do database da raiz do projeto do software.
