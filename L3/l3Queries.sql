/* Q1
 * Trovare per ogni fattorino che ha preso almeno due multe il codice 
 * identificativo del fattorino, la data della prima multa e la data dell’ultima 
 * multa che ha preso.
 */
 SELECT DELIVERERID, MIN(DATA), MAX(DATA)
    FROM PENALTIES
    GROUP BY DELIVERERID
    HAVING COUNT(*) >= 2
 ;
 
 /* Q2
  * Trovare il codice identificato del fattorino che ha ricevuto il numero 
  * massimo di multe.
  */
 SELECT DELIVERERID
 FROM PENALTIES
 GROUP BY DELIVERERID
 HAVING COUNT(*) = (
      SELECT MAX(NUMERO)
      FROM (
          SELECT COUNT(*) AS NUMERO
          FROM PENALTIES
          GROUP BY DELIVERERID
        )
  ) 
;

/* Q3
 * Trovare per ogni fattorino che ha preso almeno una multa il codice identificativo 
 * del fattorino, la data in cui ha preso l’ultima multa e l’ammontare di tale multa.
 */
 SELECT DISTINCT TBL.DELIVERERID, TBL.MX, AMOUNT 
 FROM PENALTIES , (
    SELECT DELIVERERID, MAX(DATA) AS MX
    FROM PENALTIES
    GROUP BY DELIVERERID
  ) TBL
  WHERE PENALTIES.DELIVERERID = TBL.DELIVERERID AND TBL.MX = DATA
  GROUP BY TBL.DELIVERERID, AMOUNT, TBL.MX
;

/* Q4
 * Trovare l’identificativo delle aziende presso cui si sono recati più del 30% 
 * dei fattorini presenti nella base di dati (nota: i fattorini “recatisi” 
 * presso un’azienda sono quelli che hanno fatto almeno una consegna o un ritiro 
 * presso l’azienda in esame).
 */
 SELECT COMPANYID
 FROM COMPANYDEL
 GROUP BY COMPANYID
 HAVING COUNT(DISTINCT DELIVERERID) > (
    SELECT COUNT(*)*30/100
    FROM DELIVERERS
  )
 ;
 
 
 