# Übungen

## Aufgabe 1
Erzeuge eine View, die folgendes Ergebnis repräsentiert, das nur Verkäufe vom `27.06.2015` umfasst:

| VNR  | VNAME    | UNR  | ANZAHL | ANR | ANAME         | APREIS  |
| ---- | -------- | ---- | ------ | --- | ------------- | ------- |
| 4321 | Jahred   | 1010 | 7      | 12  | Stiefel       | 89,99   |
| 3401 | Schmitz  | 1000 | 10     | 12  | Stiefel       | 89,99   |
| 4321 | Jahred   | 1011 | 15     | 11  | Pullover      | 35,2    |
| 1010 | Mueller  | 1006 | 40     | 11  | Pullover      | 35,2    |
| 5337 | Ritsch   | 1003 | 70     | 11  | Pullover      | 35,2    |
| 4321 | Jahred   | 1009 | 35     | 13  | Wintermantel  | 123,8   |
| 1010 | Mueller  | 1007 | 35     | 13  | Wintermantel  | 123,8   |

### Lösung
```sql

CREATE OR REPLACE VIEW v_verkauf AS
SELECT vt.VNR, VNAME, vk.ANR, vk.UNR, ANZAHL, ANAME, APREIS, DATUM
FROM vertreter vt
INNER JOIN VERKAUF vk ON (vk.vnr = vt.vnr)
INNER JOIN Artikel a ON (a.anr = vk.anr) 
WHERE TO_CHAR(datum,'dd.mm.yyyy') = '27.06.2015';

```

## Aufgabe 2
Wie viele **Verkäufe** hat der Vertreter Mueller am `27.06.15` durchgeführt?

### Lösung
```sql

SELECT COUNT(VNR)
FROM VERKAUF 
WHERE DATUM IN (SELECT DATUM
				FROM VERKAUF 
				WHERE TO_CHAR(datum,'dd.mm.yyyy') = '27.06.2015')
AND   VNR = (SELECT VNR
			 FROM VERTRETER
			 WHERE VNAME = 'Mueller');
------------------------------------------			 
SELECT COUNT(*)
FROM v_verkauf
WHERE vname ='Mueller';
```

## Aufgabe 3
Wie viele **Artikel** hat der Vertreter Mueller am `27.06.15 verkauft?

### Lösung
```sql

SELECT COUNT(ANR)
FROM VERKAUF
WHERE DATUM IN (SELECT DATUM
				FROM VERKAUF 
				WHERE TO_CHAR(datum,'dd.mm.yyyy') = '27.06.2015')
AND   VNR = (SELECT VNR
			 FROM VERTRETER
			 WHERE VNAME = 'Mueller');
-----------------------------


```

## Aufgabe 4
Wie viele Artikel wurden durchschnittlich am `27.06.15` verkauft?

### Lösung
```sql

SELECT AVG(anzahl)
FROM v_verkauf;

```

## Aufgabe 5
Welcher Artikel (`ANR` und `ANAME`) wurde am `27.06.15` nicht verkauft?

### Lösung
```sql

SELECT anr, anname
FROM artikel
WHERE anr NOT IN ( SELECT DISTINCT anr
					FROM v_verkauf);


```
