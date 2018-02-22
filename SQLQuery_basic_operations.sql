
/*tworze baze danych*/
CREATE DATABASE TSQL_learning

/*identyfikuje z baze danych w jakiej tworzona jest tabela*/
USE [TSQL_learning]
GO
/*tworzenie tabeli*/
CREATE TABLE Animals
(
PrimaryID int PRIMARY KEY IDENTITY,
Age int,
Name varchar(255),
Breed varchar(255)
)

/*wprowadzanie danych do tabeli*/
INSERT INTO Animals (Age, Name, Breed)
VALUES (10, 'Doggo', 'abcd'),
(4, 'tortoise', 'asdsa'),
(2, 'Cat', 'random'),
(1, 'Hamster', ':)')


/*wyciaganie danych z tabeli | '*' oznacza wszystkie kolumny*/
SELECT * FROM Animals

SELECT Name FROM Animals

/*konkatenacja kolumn*/
SELECT Age, Name + ' -> ' + Breed AS NameANDBreed
FROM Animals

/*sortowanie kolumny*/
SELECT * FROM Animals
ORDER BY Age ASC /*albo DESC*/

/*aktualizowanie rekordów w tabeli*/
UPDATE Animals
SET Name = 'TORTOISE'
WHERE Name = 'tortoise'

/*usrednianie rekordow w grupach*/
SELECT Breed, AVG(Age) AS AvrAge FROM Animals
GROUP BY Breed

/*wildcards*/
SELECT * FROM Animals
WHERE Name LIKE 'T%'

/*wiele wartosci w WHERE*/
SELECT * FROM Animals
WHERE Name IN ('Doggo', 'Cat')

/*wybieranie rekordow pomiedzy dwoma wartosciami*/
SELECT * FROM Animals
WHERE Age BETWEEN '2' AND '7'

/*usuwanie wartosci z tabeli*/
DELETE FROM Animals
WHERE Age = 10




