
CREATE TABLE ISTRUTTORE
(
  CodFisc char (16) PRIMARY KEY,
  Nome char (20),
  Cognome,
  DataNscita date,
  Email,
  Telefono char (13)
);

CREATE TABLE CORSI
(
  CodC char (5) PRIMARY KEY,
  Nome,
  Tipo,
  Livello smallint CHECK ( Livello >=1 AND Livello <= 4 )
);

CREATE TABLE PROGRAMMA
(
  CodFisc,
  Giorno ,
  OraInizio,
  Durata smallint,
  CodC,
  Sala,
  
  FOREIGN KEY (CodFisc) REFERENCES ISTRUTTORE(CodFisc),
  FOREIGN KEY (CodC) REFERENCES CORSI (CodC),
  PRIMARY KEY ( CodFisc, Giorno, OraInizio )
);