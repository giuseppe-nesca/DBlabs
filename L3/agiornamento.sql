
UPDATE ISTRUTTORE
SET Telefono = '+390112333551'
WHERE CodFisc = 'KHNJHN81E30C455Y'
;

UPDATE programma
SET Sala = 'S4'
WHERE Sala = 'S2'
;

DELETE FROM CORSI
WHERE CodC IN (
  SELECT CodC
  FROM CORSI
  GROUP BY CodC
  HAVING COUNT(*) = 1
)
;

--- non puo funzionare perche livello non rispetta le restrizioni imposte 
---INSERT INTO Corsi (CodC,Nome,Tipo,Livello)
---VALUES ( 'CT120' , 'Spinning estremo' , 'Spinning' , 10 );

DELETE FROM ISTRUTTORE
WHERE CodFisc = 'SMTPLA80N31B791Z'
;