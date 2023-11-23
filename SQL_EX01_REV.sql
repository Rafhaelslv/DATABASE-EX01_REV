USE master
DROP DATABASE EXERC01
CREATE DATABASE EXERC01
USE EXERC01
GO

CREATE TABLE ALUNO (
ra							INT					NOT NULL,
nome						VARCHAR(45)			NOT NULL,
sobrenome					VARCHAR(45)			NOT NULL,
rua_end						VARCHAR(45)			NOT NULL,
numero_end					INT					NOT NULL,
bairro_end					VARCHAR(45)			NOT NULL,
cep_end						INT					NOT NULL,
telefone					CHAR(11)			NULL,
PRIMARY KEY (ra)
)
GO

CREATE TABLE CURSOS (
codigo_curso				INT					NOT NULL,
nome						VARCHAR(45)			NOT NULL,
carga_horaria				INT					NOT NULL,
turno						VARCHAR(45)			NOT NULL,
PRIMARY KEY (codigo_curso)
)
GO

CREATE TABLE DICIPLINAS (
codigo_diciplina			INT					NOT NULL,
nome						VARCHAR(45)			NOT NULL,
carga_horaria				INT					NOT NULL,
turno						VARCHAR(45)			NOT NULL,
semestre					INT					NOT NULL,
PRIMARY KEY (codigo_diciplina)
)
GO

--*********************************************************--
---Insert Alunos
INSERT INTO ALUNO (ra, nome, sobrenome, rua_end, numero_end, bairro_end, cep_end, telefone)
VALUES
('12345',	'Jos�',	'Silva',	'Almirante Noronha',	'236',	'Jardim S�o Paulo',	'1589000',	'69875287'),
('12346',	'Ana',	'Maria Bastos',	'Anhaia',	'1568',	'Barra Funda',	'3569000',	'25698526'),
('12347',	'Mario',	'Santos',	'XV de Novembro',	'1841',	'Centro',	'1020030', NULL	),
('12348',	'Marcia',	'Neves',	'Volunt�rios da Patria',	'225',	'Santana',	'2785090',	'78964152')
GO

--*********************************************************--
---Insert Cursos
INSERT INTO CURSOS (codigo_curso, nome, carga_horaria, turno)
VALUES
('1',	'Inform�tica',	'2800',	'Tarde'),
('2',	'Inform�tica',	'2800',	'Noite'),
('3',	'Log�stica',	'2650',	'Tarde'),
('4',	'Log�stica',	'2650',	'Noite'),
('5',	'Pl�sticos',	'2500',	'Tarde'),
('6',	'Pl�sticos',	'2500',	'Noite')
GO

--*********************************************************--
---Insert Diciplinas
INSERT INTO DICIPLINAS (codigo_diciplina, nome, carga_horaria, turno, semestre)
VALUES
('1',	'Inform�tica',	'4',	'Tarde',	'1'),
('2',	'Inform�tica',	'4',	'Noite',	'1'),
('3',	'Quimica',	'4',	'Tarde',	'1'),
('4',	'Quimica',	'4',	'Noite',	'1'),
('5',	'Banco de Dados I',	'2',	'Tarde',	'3'),
('6',	'Banco de Dados I',	'2',	'Noite',	'3'),
('7',	'Estrutura de Dados',	'4',	'Tarde', '4'),
('8',	'Estrutura de Dados',	'4',	'Noite',	'4')
GO

--*********************************************************--
---CONSULTAR: Nome e sobrenome, como nome completo dos Alunos Matriculados;
SELECT CONCAT (a.nome, ' ', a.sobrenome) AS NomeCompleto
FROM ALUNO a

--*********************************************************--
---CONSULTAR: Rua, n� , Bairro e CEP como Endere�o do aluno que n�o tem telefone
SELECT CONCAT (a.rua_end, ' ', a.numero_end, ' ', a.bairro_end,' ', a.cep_end) AS ENDERECO
FROM ALUNO a
WHERE a.telefone is NULL

--*********************************************************--
---CONSULTAR: Telefone do aluno com RA 12348
SELECT a.telefone
FROM ALUNO a
WHERE a.ra = 12348

--*********************************************************--
---CONSULTAR: Nome e Turno dos cursos com 2800 horas
SELECT c.nome, c.turno
FROM CURSOS c
WHERE c.carga_horaria = 2800

--*********************************************************--
---CONSULTAR: O semestre do curso de Banco de Dados I noite
SELECT d.semestre
FROM DICIPLINAS d
WHERE d.nome = 'Banco de Dados I' and d.turno = 'Noite'
