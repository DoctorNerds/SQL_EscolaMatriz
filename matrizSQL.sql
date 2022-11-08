CREATE TABLE jogos (
	jogo_id serial PRIMARY KEY,
	jogo_nome VARCHAR(30) NOT NULL,
	plataforma VARCHAR(30) NOT NULL,
	numero_jogadores INT NOT NULL,
	compativel_celular VARCHAR(30) NOT NULL,
	compativel_arduino VARCHAR(30) NOT NULL,
	UNIQUE (jogo_nome)
);

CREATE TABLE podcasts (
	podcast_id serial PRIMARY KEY,
	titulo VARCHAR(30) NOT NULL,
	tema VARCHAR(30),
	nome_convidado VARCHAR(30) NOT NULL,
	descricao VARCHAR(255),
	duracao_minutos INT NOT NULL,
	UNIQUE (titulo)
);

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

CREATE TABLE servicos (
	servico_id serial PRIMARY KEY,
	servico_nome VARCHAR(30) NOT NULL,
	tipo_empresa VARCHAR(30),
	objetivo VARCHAR(30),
	presencial_remoto VARCHAR(30),
	descricao VARCHAR(255),
	UNIQUE (servico_nome)
);

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

CREATE TABLE compra (
	compra_id serial PRIMARY KEY,
	status VARCHAR(30) NOT NULL,
	parcelas INT NOT NULL,
	data VARCHAR(30) NOT NULL,
	quantidade INT NOT NULL,
	UNIQUE (compra_id)
);

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


INSERT INTO jogos 
	(jogo_id, jogo_nome, plataforma, numero_jogadores, compativel_celular, compativel_arduino)
VALUES
	(1, 'warX', 'Scratch', 1, 'Sim', 'Sim'),
	(2, 'Jumper', 'Scratch', 1, 'Sim', 'Sim'),
	(3, 'QuickLap', 'Scratch', 1, 'Não', 'Sim'),
	(4, 'ScratchCup', 'Scratch', 2, 'Não', 'Não');

SELECT * from jogos;

INSERT INTO podcasts 
	(podcast_id, titulo, nome_convidado, duracao_minutos)
VALUES
	(1, 'Como tomar uma decisão', 'DIONISIO AGOURAKIS', 40),
	(2, 'Resolvedor de problemas', 'GIOVANI RAVAGNANI', 56),
	(3, 'O futuro é digital', 'ANDRE BALTIERI', 58),
	(4, 'O que é a nuvem?', 'LESLE SANTOS', 62);
	
SELECT * from podcasts;	

INSERT INTO cursos 
	(curso_id, curso_nome, tempo_acesso_meses, preco)
VALUES
	(1, 'A linguagem do futuro', 12, 190),
	(2, 'cratch com Arduino', 12, 49),
	(3, 'Seja digital', 24, 99);
	
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

INSERT INTO alunos 
	(aluno_id, nome, sobrenome, apelido, email, idade, celular)
VALUES
	(1, 'Fábio', 'Mori', 'fabinho.mori' , 'fabinhomori@hotmail.com' , 33, '11 91234 5678'),
	(2, 'Sonia', 'Moraes', 'so.moraes' , 'soninhamoraes@hotmail.com' , 54, '11 91234 5678');
	
SELECT * FROM alunos;
	
INSERT INTO compra 
	(compra_id, status, parcelas, data, quantidade)
VALUES
	(1, 'Aprovada', 12, '07.11.2022' , 3 ),
	(2, 'Aprovada', 2, '01.10.2022' , 1);

SELECT * FROM compra;

INSERT INTO compra_cursos 
	(curso_id, curso_nome, compra_id, preco, quantidade)
VALUES
	(1, 'A linguagem do futuro', 1, 190 , 3 ),
	(2, 'Seja digital', 2, 99 , 1);

SELECT * FROM compra_cursos;

INSERT INTO compra 
	(compra_id, status, parcelas, data, quantidade)
VALUES
	(3, 'Aprovada', 6, '07.11.2022' , 1 );

INSERT INTO compra_servicos 
	(servico_id, servico_nome, compra_id, preco, quantidade)
VALUES
	(1, 'Aplicando Data Science', 3, 5000, 1);

SELECT * FROM compra_servicos;

INSERT INTO turmas 
	(curso_id, curso_nome, quantidade_alunos)
VALUES
	(1, 'A linguagem do futuro', 2 ),
	(2, 'Seja digital', 10);

SELECT * FROM turmas;

INSERT INTO jogadores 
	(aluno_id, apelido, jogo_predileto)
VALUES
	(1, 'fabinho.mori', 'warX' );

SELECT * FROM jogadores;

INSERT INTO espectadores 
	(aluno_id, apelido, episodio_predileto)
VALUES
	(2, 'so.moraes', 'Como tomar uma decisão' );

SELECT * FROM espectadores;


