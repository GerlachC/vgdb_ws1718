# Übungen

Im folgenden Skript werden die Beispiel-Tabellen `VERTRETER`, `VERKAUF` und `ARTIKEL` verwendet.

## Aufgabe 1
Führe das SQL-Skript [DB-Vertreter](./SQL_-_DB-Vertreter.sql) in SQLPlus aus, um die Tabellen anzulegen und mit Beispieldaten zu füllen. Wie lautet dein Befehl um das SQL-Skript auszuführen?

### Lösung
```sql
Deine Lösung
```
start Pfad

## Aufgabe 2
Mache dich mit den Tabellen vertraut bzgl.:
* Spalten und Datentypen
* Beziehung der Tabellen zueinander
* Datensätzen in den Tabellen und was diese bedeuten

## Aufgabe 3
Zeige alle Vertreter mit `NAME` und `VNR` an, die eine Provision von  weniger als 7% erhalten. 

### Lösung
```sql
Deine Lösung
SELECT VNR, VNAME
FROM vertreter
WHERE provision < 0.07;
```
## Aufgabe 4
Bei welchen Artikeln (`NAME` und `ARTIKELNUMMER`) liegt der Preis über `100`?

### Lösung
```sql
Deine Lösung

SELECT ANAME, ANR
FROM artikel
WHERE APREIS > 100;

```

## Aufgabe 5

### Lösung
```sql
Deine Lösung 

SELECT VNAME, GEBURTSDATUM
FROM VERTRETER
WHERE to_date(GEBURTSDATUM, 'dd.mm.yyyy') < '01.01.1980' AND VNAME LIKE '%i%'; 
oder
WHERE geburtsadtum < to_date('01.01.1980', 'dd.mm.yyyy')
			AND vname LIKE '%i%';

```
## Aufgabe 6

### Lösung 
```sql
insert into vertreter (VNR, PROVISION)
values (7777, 0.06) ;
```

### Aufgabe 7

## Lösung
```sql

insert into verkauf (UNR, VNR, ANZAHL, DATUM)
values (1014, 7777, 22, '27.09.2017');
oder 
INSERT into verkauf
values (1014, 7777, 13,22, sysdate);
```

### Aufgabe 8

## Lösung
```sql

UPDATE artikel
SET APREIS = 88.90
WHERE ANR = 12 ;

### Aufgabe 9
## Lösung
```sql
ALTER TABLE vertreter
ADD (bonus NUMBER(4,0));
```

###Aufgabe 10
##Lösung
```sql
UPDATE vertreter
set bonus = 500;
```

###Aufgabe 11
##Lösung
```sql
ALTER TABLE vertreter
MODIFY (VNAME VARCHAR2(20));
``` 
###Aufgabe 12  
##Lösung
```sql
SELECT DISTINCT datum
FROM verkauf;
```