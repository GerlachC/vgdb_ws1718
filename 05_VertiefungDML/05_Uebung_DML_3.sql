# Übung

Für folgende Aufgaben werden die Tabellen Vertreter, Verkauf und Artikel verwendet.

## Aufgabe 1
Wie viel kostet der teuerste Artikel?

### Lösung
```sql
SELECT MAX(apreis) maxAPREIS
FROM ARTIKEL;

```

## Aufgabe 2
Wie hoch ist die durchschnittliche Provision aller Vertreter?

### Lösung
```sql
SELECT AVG(PROVISION) avgPROVISION
FROM VERTRETER;

```

## Aufgabe 3
Wie viele Artikel hat der Vertreter Mueller insgesamt verkauft?

### Lösung
```sql
SELECT SUM(Anzahl)
FROM verkauf
WHERE VNR = (SELECT VNR
		FROM VERTRETER
		WHERE VNAME = 'Mueller');

```

## Aufgabe 4
Wie viele Wintermäntel hat der Vertreter Jahred insgesamt verkauft?

### Lösung
```sql
SELECT SUM(anzahl)
FROM VERKAUF 
WHERE ANR = (SELECT ANR
			FROM ARTIKEL 
			WHERE ANAME = 'Wintermantel')
AND VNR = (SELECT VNR
			FROM VERTRETER
			WHERE VNAME = 'Jahred');
```

## Aufgabe 5
Wessen Provision liegt über der durchschnittlichen Provision aller Vertreter?
> Tipp: Nutze hier eine Unterabfrage, um den Durchschnitt aller Vertreter zu ermitteln.

### Lösung
```sql

SELECT provision, vname
FROM VERTRETER 
WHERE provision > (SELECT AVG(PROVISION) avgPROVISION
			 FROM VERTRETER);
```

