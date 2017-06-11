/*HW2*/


/*es1*/
SELECT A.CodAutore, A.Cognome, A.Universita, COUNT(DISTINCT APA.CodArticolo)
FROM ARTICOLO , AUTORE A, AUTORE_PRESENTA_ARTICOLO APA
WHERE AUTORE.CodAutore NOT IN (SELECT AA.CodAutore
                                FROM AUTORI_ARTICOLO AA, ARTICOLO B
                                WHERE AA.CorArticolo=B.CodArticolo AND
                                    B.Argomento <> 'Data Mining' )
GROUP BY APA.Conferenza , APA.Edizione , A.CodAutore, A.Cognome, A.Universita
;

/*es3*/
SELECT num.CodAutore, num.edizione, MAX(DISTINCT asd)
FROM (
    SELECT APA.CodAutore, APA.Edizione, COUNT (DISTINCT CodArticolo) AS asd
    FROM AUTORE_PRESENTA_ARTICOLO AS APA
    WHERE APA.Conferenza IN (
        SELECT Conferenza
        FROM EDIZIONI_CONFERENZA
        GROUP BY Conferenza
        HAVING COUNT(DISTINCT Edizione)>=10)

    GROUP BY APA.Edizione, APA.CodAutore
    ) AS num
GROUP BY num.Edizione, num.CodAutore
;
