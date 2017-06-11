/*Q1*/  
SELECT D.NAME,D.INITIALS 
FROM DELIVERERS D
WHERE D.DELIVERERID NOT IN (
                SELECT DELIVERERID FROM PENALTIES)
;

/*Q2*/
SELECT P.DELIVERERID
FROM PENALTIES P
WHERE P.AMOUNT=30 AND P.DELIVERERID IN (
            SELECT X.DELIVERERID
            FROM PENALTIES X
            WHERE X.AMOUNT=25)
;

/*Q3*/
SELECT D.DELIVERERID, D.NAME
FROM DELIVERERS D , PENALTIES P
WHERE D.DELIVERERID=P.DELIVERERID
GROUP BY P.DELIVERERID,P.DATA,D.DELIVERERID,D.NAME
HAVING COUNT(*)>1
;

/*Q4*/
SELECT DISTINCT DELIVERERID
FROM COMPANYDEL
GROUP BY DELIVERERID
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM COMPANIES
  )
;
/*Q5*/
SELECT DELIVERERID
FROM COMPANYDEL
WHERE COMPANYID IN (
    SELECT COMPANYID
    FROM COMPANYDEL
    WHERE DELIVERERID = 57
  )
  AND DELIVERERID <> 57
;

/*Q6*/
SELECT D.DELIVERERID, D.NAME
FROM DELIVERERS D, PENALTIES P
WHERE D.DELIVERERID=P.DELIVERERID AND P.DATA>TO_DATE('31/12/1979','DD/MM/YYYY')
                                  AND P.DATA<TO_DATE('01/01/1981','DD/MM/YYYY')                                                    
GROUP BY D.DELIVERERID, D.NAME
HAVING COUNT(*)>( SELECT COUNT(*)
                  FROM PENALTIES X
                  WHERE X.DATA>TO_DATE('31/12/1980','DD/MM/YYYY')
                  AND X.DATA<TO_DATE('01/01/1982','DD/MM/YYYY')
                  AND X.DELIVERERID=D.DELIVERERID)                                         
;


/* Q7
 * Trovare il codice identificativo dei fattorini che hanno fatto consegne (o ritiri) 
 * in tutte le aziende in cui il fattorino 57 ha fatto delle consegne (o dei ritiri).
 */
SELECT DISTINCT(DELIVERERID)
FROM COMPANYDEL
WHERE 
  DELIVERERID <> 57 AND
  COMPANYID IN (
    SELECT C.COMPANYID
    FROM COMPANYDEL C
    WHERE C.DELIVERERID = 57
  )
;

/* Q8
 * Trovare il codice identificativo dei fattorini che hanno fatto consegne (o ritiri) 
 * solo nelle aziende in cui il fattorino 57 ha fatto delle consegne (o dei ritiri).
 */
SELECT DISTINCT(DELIVERERID)
FROM COMPANYDEL
WHERE 
  DELIVERERID <> 57 AND
  DELIVERERID NOT IN (
    SELECT DELIVERERID
    FROM COMPANYDEL
    WHERE 
    COMPANYID NOT IN (
      SELECT C.COMPANYID
      FROM COMPANYDEL C
      WHERE C.DELIVERERID = 57
    )
  )
;

/* Q9
 * Trovare il codice identificativo dei fattorini che hanno fatto consegne (o ritiri) 
 * in tutte e sole le aziende in cui il fattorino 57 ha fatto delle consegne (o dei ritiri).
 */
SELECT DISTINCT(DELIVERERID)
FROM COMPANYDEL
WHERE 
  DELIVERERID <> 57 AND
  DELIVERERID NOT IN (
    SELECT DELIVERERID
    FROM COMPANYDEL
    WHERE 
    COMPANYID NOT IN (
      SELECT C.COMPANYID
      FROM COMPANYDEL C
      WHERE C.DELIVERERID = 57
    )
  )
  GROUP BY DELIVERERID
  HAVING COUNT(*) = (
          SELECT COUNT(*)
          FROM COMPANYDEL
          WHERE DELIVERERID = 57
        )
;

