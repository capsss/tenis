CREATE DATABASE Tenis;

use Tenis;

CREATE TABLE Permissao( 
                  id                            INTEGER, 
                  nome                      VARCHAR(45),
                  PRIMARY KEY (id));

CREATE TABLE Clubes( 
                  id                     INTEGER, 
                  nome               VARCHAR(45),
                  PRIMARY KEY (id));

CREATE TABLE Torneio(
                   id                                 INTEGER, 
                   nome                           VARCHAR(45),
                   local                            VARCHAR (45),
                   estado                           CHAR (2),
	       horario                          DATETIME,
	       nivel                             CHAR,
                   progresso                       CHAR,
                   PRIMARY KEY(id));

CREATE TABLE Jogadores(
                   cpf                              INTEGER, 
                   nome                           VARCHAR(100),
                   email                            VARCHAR(45),
                   senha                            VARCHAR(20),
                   telefone                        VARCHAR(14),
                   nivel                             CHAR,
                   dataNascimento           DATE,
                   clube_id                      INTEGER,
                   permissao_id               INTEGER,
	       PRIMARY KEY (cpf),
                   FOREIGN KEY (clube_id) REFERENCES Clubes(id),
                   FOREIGN KEY (permissao_id) REFERENCES Permissao(id));	

CREATE TABLE Endereco(
                   rua                                  VARCHAR(45), 
                   numero                           INTEGER,
	       cep                                 INTEGER,
                   cidade                             VARCHAR (45),
                   bairro                              VARCHAR (45),
                   estado                              VARCHAR(45),
                   Jogadores_cpf                 INTEGER,
                   PRIMARY KEY (rua),
                   FOREIGN KEY (Jogadores_cpf) REFERENCES Jogadores(cpf));	



CREATE TABLE Ranking(
                   Jogdores_cpf                       INTEGER,
                   Torneio_id                           INTEGER,
                   PRIMARY KEY(Jogadores_cpf, Torneio_id),
                   FOREIGN KEY (Jogadores_cpf) REFERENCES Jogadores(cpf),
                   FOREIGN KEY (Torneio_id) REFERENCES Torneio(id));

CREATE TABLE Ranking(
                   Jogdores_cpf                       INTEGER,
                   Torneio_id                           INTEGER,
                   Pontos                                  INTEGER,
                   PRIMARY KEY(Jogadores_cpf, Torneio_id),
                   FOREIGN KEY (Jogadores_cpf) REFERENCES Jogadores(cpf),
                   FOREIGN KEY (Torneio_id) REFERENCES Torneio(id));
