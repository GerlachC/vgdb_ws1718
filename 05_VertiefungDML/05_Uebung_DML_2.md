# Übung

Löse folgende Aufgaben mit Hilfe von Unterabfragen.

## Aufgabe 1
Zeige alle Vertreter (`VNR`, `VNAME`) an, die bereits Artikel mit der `ANR` = `13` verkauft haben.

### Lösung
```sql
SELECT vt.VNR, vt.VNAME
FROM vertreter vt
WHERE vt.vnr IN (SELECT vk.vnr
				FROM verkauf vk
				WHERE vk.anr =13);


Oder

SELECT DISTINCT vt.VNR, vt.VNAME, vk.ANR 
FROM vertreter vt
INNER JOIN Verkauf vk ON vt.VNR = vk.VNR
INNER JOIN artikel a ON vk.ANR = a.ANR
WHERE a.anr = 13;
```

## Aufgabe 2
Zeige alle Artikel (`ANR`, `ANAME`) an, die der Vertreter mit der `VNR` = `4321` am `27.06.2015` verkauft hat.

### Lösung
```sql

SELECT a.anr, a.aname
FROM artikel a
WHERE a.anr IN (SELECT vk.anr
				FROM verkauf vk
				WHERE vk.vnr = 4321 AND vk.datum = to_date('27.06.2015', 'dd.mm,yyyy'));


oder

SELECT a.anr, a.aname 
FROM vertreter vt
INNER JOIN Verkauf vk ON vt.VNR = vk.VNR
INNER JOIN artikel a ON vk.ANR = a.ANR
WHERE vt.vnr = 4321 AND vk.datum = to_date('27.06.2015', 'dd.mm,yyyy');
```

## Aufgabe 3
Zeige alle Vertreter (`VNR`, `VNAME`) an, die bereits Artikel verkauft haben, deren Preis über `100`€ liegt.

### Lösung
```sql

SELECT vt.vnr, vt.vname
FROM vertreter vt
WHERE vt.vnr IN (SELECT vk.vnr
			FROM artikel a INNER JOIN verkauf vk ON vk.anr = a.anr
			WHERE a.apreis > 100);
 oder
SELECT vt.vnr, vt.vname, a.apreis
FROM vertreter vt
INNER JOIN Verkauf vk ON vt.VNR = vk.VNR
INNER JOIN artikel a ON vk.ANR = a.ANR
WHERE a.apreis > 100;
```

## Aufgabe 4
Zeige alle Vertreter, die noch nie den Artikel mit der `ANR` = `22` verkauft haben.

### Lösung
```sql

SELECT vt.vname
FROM vertreter vt
WHERE vt.vnr NOT IN (SELECT vk.vnr
				FROM verkauf vk 
				WHERE vk.anr = 22);  

```

## Aufgabe 5
Welche Vertreter (`VNR`) haben am `27.06.2015` mehr Artikel mit `ANR` = `12` verkauft als der Vertreter mit `VNR` = `4321`?

### Lösung
```sql

SELECT vt.vnr, vt.nname 
FROM vertreter vt
WHERE vt.vnr IN (

oder 
SELECT vt.vnr, vt.vname, vk.datum, vk.anr, a.anr
FROM vertreter vt
INNER JOIN Verkauf vk ON vt.VNR = vk.VNR
INNER JOIN artikel a ON vk.ANR = a.ANR
WHERE 
```

