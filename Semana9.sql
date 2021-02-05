/*#Exercicio 1
**#Crie um banco de dados chamado “escola” no seu servidor local.
**#Resposta:
*/
    CREATE DATABASE escola;

/*#Exercicio 2
**#Crie 3 tabelas:
- Uma para armazenar os dados de professores 
    (nome, sobrenome, endereço, telefone, e-mail, data de nascimento, nacionalidade, etc.)
- Outra para estudantes 
    (nome, sobrenome, matrícula, e-mail, data de nascimento, nacionalidade, média geral, etc.)
- Outra para cursos 
    (código, nome, se é EAD ou presencial, quem é o professor, número máximo de alunos, etc.)
**#Resposta:
*/

CREATE TABLE professores (
	idProfessor INT PRIMARY KEY  NOT NULL UNIQUE,
    nome VARCHAR(255), 
    sobrenome VARCHAR(255), 
    endereço VARCHAR(255), 
    telefone VARCHAR(255), 
    email VARCHAR(255), 
    dataDeNascimento DATE, 
    nacionalidade VARCHAR(255)
);
CREATE TABLE estudantes (
    nome VARCHAR(255), 
    sobrenome VARCHAR(255), 
    matricula INT PRIMARY KEY  NOT NULL UNIQUE,  
    email VARCHAR(255), 
    dataDeNascimento DATE, 
    nacionalidade VARCHAR(255), 
    mediaGeral DEC(5,2)
);
CREATE TABLE cursos (
	codigo INT PRIMARY KEY NOT NULL UNIQUE, 
    nome VARCHAR(255), 
    EAD BOOL, 
    idProfessor INT, 
    nMaxAlunos INT,
    FOREIGN KEY (idProfessor) REFERENCES professores(idProfessor)
);

/*#Exercicio 3
**#Insira pelo menos 3 registros em cada tabela (quanto mais, melhor).
**#Resposta:
*/
INSERT INTO professores VALUES (01, "Maria", "Flores","Avenida Brasil", "99003333","maria.flores@email","1990-10-22","Brasileira");
INSERT INTO professores VALUES (02, "Amanda", "Gentil","Avenida USA", "99444422","gentil.amanda@email","1985-03-12","Brasileira");
INSERT INTO professores VALUES (03, "Roberto", "Silva","Avenida Japao", "99556677","darth.roberto@email","1980-05-02","Brasileiro");

INSERT INTO estudantes VALUES ("Arthur", "Stark",20020001, "estudante.stark@email","1995-05-02","Brasileiro", 9.25);
INSERT INTO estudantes VALUES ("Thor", "Odinson",21010002, "godofthunder@email","1995-05-02","Brasileiro", 7.75);
INSERT INTO estudantes VALUES ("Lois", "Lane",21010003, "lane@email","1995-05-02","Brasileira", 10.00);

INSERT INTO cursos VALUES (0001, "Programaçao Web", false, 03, 45);
INSERT INTO cursos VALUES (0002, "Introdução a Programação", false, 01, 60);
INSERT INTO cursos VALUES (0003, "Topicos de Programação", true, 02, 20);

/*#Exercicio 4
**#Busque os cursos presenciais que possuem número máximo de alunos maior do que 30.
**#Resposta:
*/

SELECT * FROM cursos WHERE nMaxAlunos>30 AND EAD=false;

/*#Exercicio 5
**#Atualize a informação de média geral de um aluno.
**#Resposta:
*/

UPDATE estudantes SET mediaGeral=5.00 WHERE matricula=21010002;

/*#Exercicio 6
**#Realize a exclusão de um curso.
**#Resposta:
*/

DELETE FROM cursos WHERE codigo=0003;

/*#Exercicio 7
**#Busque os professores nascidos na América do Sul.
**#Resposta:
*/

SELECT * FROM professores WHERE nacionalidade="América do Sul";

/*Para os INSERTS acima*/
SELECT * FROM professores WHERE nacionalidade="Brasileiro" OR nacionalidade="Brasileira";

/*#Exercicio 8
**#Busque os alunos cujos nomes iniciem com a letra J.
**#Resposta:
*/

SELECT * FROM estudantes WHERE (nome like "J%")

/*#Exercicio 9
**#Busque os alunos com a média geral maior do que 7, 
    ordenando a exibição do resultado da maior para a menor média.
**#Resposta:
*/

SELECT * FROM estudantes WHERE mediaGeral>7 ORDER BY mediaGeral DESC;

/*#Exercicio 10
**#Crie uma tabela de ligação entre alunos e cursos, 
    contendo a matrícula do aluno, o código do curso e a média do aluno naquele curso.
**#Resposta:
*/

SELECT cursos.codigo, estudantes.matricula, estudantes.mediaGeral FROM cursos CROSS JOIN estudantes;

/*#Exercicio 11
**#Crie chaves primárias para todas as tabelas existentes.
*/
/*#Exercicio 12
**#Crie chaves estrangeiras onde forem necessárias (dica: a coluna referente ao professor na tabela cursos).
*/
/*#Exercicio 13
**#Busque por todos os cursos ministrados por professoras.
**#Resposta:
*/

ALTER TABLE professores ADD sexo VARCHAR(255);
/*UPDATE todos os professores com os sexos correspondentes*/
SELECT c.codigo,c.nome,p.nome,p.sobrenome,p.sexo,p.email FROM cursos AS c JOIN professores AS p ON c.idProfessor = p.idProfessor WHERE p.sexo="Feminino";

/*#Exercicio 14
**#
**#Resposta:
*/

/*Atualmente não tem ligação dos alunos com as materias*/
SELECT * FROM cursos AS c JOIN estudantes AS E ON ????????? WHERE c.EAD=true;
