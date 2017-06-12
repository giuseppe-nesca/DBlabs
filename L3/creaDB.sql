DROP TABLE PROGRAMMA;
DROP TABLE ISTRUTTORE;
DROP TABLE CORSI;

CREATE TABLE ISTRUTTORE
(
  CodFisc char (16),
  Nome char (20),
  Cognome char (20),
  DataNscita date,
  Email char(50),
  Telefono char (13),
  
  PRIMARY KEY (CodFisc)
);

CREATE TABLE CORSI
(
  CodC char (5) PRIMARY KEY,
  Nome char (20),
  Tipo char (50),
  Livello smallint,
  
  CONSTRAINT Livello CHECK ( Livello >=1 AND Livello <= 4 )
);

CREATE TABLE PROGRAMMA
(
  CodFisc char (20),
  Giorno char (10),
  OraInizio smallint,
  Durata smallint,
  CodC char (5),
  Sala char (2),
  
  PRIMARY KEY ( CodFisc, Giorno, OraInizio ),
  FOREIGN KEY (CodFisc) REFERENCES ISTRUTTORE(CodFisc) ON DELETE CASCADE,
  FOREIGN KEY (CodC) REFERENCES CORSI (CodC) ON DELETE CASCADE
);