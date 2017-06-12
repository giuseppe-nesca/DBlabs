DROP TABLE PROGRAMMA;
DROP TABLE ISTRUTTORE;
DROP TABLE CORSI;

CREATE TABLE ISTRUTTORE
(
  CodFisc char (20),
  Nome char (50),
  Cognome char (20),
  DataNascita date,
  Email char(50),
  Telefono char (20),
  
  PRIMARY KEY (CodFisc)
);

CREATE TABLE CORSI
(
  CodC char (10) PRIMARY KEY,
  Nome char (50),
  Tipo char (50),
  Livello smallint,
  
  CONSTRAINT Livello CHECK ( Livello >=1 AND Livello <= 4 )
);

CREATE TABLE PROGRAMMA
(
  CodFisc char (20),
  Giorno char (15),
  OraInizio char (5),
  Durata smallint,
  CodC char (10),
  Sala char (5),
  
  PRIMARY KEY ( CodFisc, Giorno, OraInizio ),
  FOREIGN KEY (CodFisc) REFERENCES ISTRUTTORE(CodFisc) ON DELETE CASCADE,
  FOREIGN KEY (CodC) REFERENCES CORSI (CodC) ON DELETE CASCADE
);