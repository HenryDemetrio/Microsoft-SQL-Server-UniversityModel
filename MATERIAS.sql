DROP TABLE Alunos;
DROP TABLE Professores;
DROP TABLE Materias;

CREATE TABLE Materias (
Cod SMALLINT IDENTITY(1,1),
Nome NVARCHAR(100) NOT NULL,
QtdAulasSem TINYINT NOT NULL,
CONSTRAINT PKMaterias PRIMARY KEY (Cod)
);

CREATE TABLE Alunos (
RA    INT ,
Nome  NVARCHAR(100) NOT NULL,
Email VARCHAR (100),
CONSTRAINT PKAlunos PRIMARY KEY (RA)
);

CREATE TABLE Professores (
Matr  INT ,
CPF   BIGINT        NOT NULL UNIQUE,
Nome  NVARCHAR(100) NOT NULL,
Email VARCHAR (100),
CONSTRAINT PKProfessores PRIMARY KEY (Matr)
);

CREATE TABLE Turmas (
Id    SMALLINT,
CodM  SMALLINT,
MatrP INT,
Sem   TINYINT  NOT NULL,
Ano   SMALLINT NOT NULL,
PRIMARY KEY (Id),
FOREIGN KEY (CodM)  REFERENCES Materias   (Cod),
FOREIGN KEY (MatrP) REFERENCES Professores(Matr)
);

CREATE TABLE ItensDaGrade (
IdT  SMALLINT,
RAa  INT,
Nota FLOAT NULL,
Freq TINYINT NULL,
CONSTRAINT PKGrades      PRIMARY KEY (IdT,RAa),
CONSTRAINT FKTurmasGrade FOREIGN KEY (IdT) REFERENCES Turmas (Id),
CONSTRAINT FKAlunosGrade FOREIGN KEY (RAa) REFERENCES Alunos (RA)
);

INSERT INTO Materias(Nome, QtdAulasSem)
Values
('Cálculo',24),
('Programação Web',24),
('Teologia', 10),
('Banco de Dados Relacional prático', 12),
('Banco de Dados Relacional teórico', 24);

select* 
from Materias

INSERT INTO Alunos(RA, Nome, Email)
Values
(2200510,'DIogo Nicastro', 'diogo.an@puccampinas.edu.br'),
(2201059,'Henry Demétrio','henry.d@puccampinas.edu.br');

select* 
from Alunos

UPDATE Alunos
SET RA = 22005102
WHERE Nome = 'DIogo Nicastro'

UPDATE Alunos
SET RA = 22010596
WHERE Nome = 'Henry Demétrio'


INSERT INTO Professores(Matr,CPF,Nome,Email)
Values
(1,321654,'Thais','thais@gmail.com'),
(2,123457,'Alisson','alisson@gmail.com'),
(3,514256,'Evonise','evonise@gmail.com'),
(4,423512,'André','andre@gmail.com'),
(5,987453,'José','jose@gmail.com');

select* 
from Professores

INSERT INTO Turmas(ID,CodM,MatrP,Sem,Ano)
VALUES
(1,1,1,2,2022),
(2,2,2,2,2022),
(3,3,3,2,2022),
(4,4,4,2,2022),
(5,5,5,2,2022);

select* 
from Turmas