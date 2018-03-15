/*zad1*/

CREATE DATABASE sklep
USE sklep

/*zad2*/

create table klienci
(
klient_id int primary key,
imie varchar(255) not null,
nazwisko varchar(255) not null,
email varchar(255) not null,
)

/*zad3*/

create table klienci_adresy
(
adres_id int primary key,
klient_id int foreign key(klient_id) references klienci(klient_id) not null,
ulica varchar(255) not null,
nr_domu varchar(255) not null,
nr_mieszkania varchar(255) DEFAULT null,
miasto varchar(255) not null,
panstwo varchar(255) not null
)

/*zad4*/

create table produkty_kategorie
(
kategoria_id int primary key,
nazwa varchar(255) not null
)

/*zad5*/

create table produkty
(
produkty_id int primary key,
nazwa varchar(255) not null,
cena money not null,
kategoria_id int foreign key(kategoria_id) references produkty_kategorie(kategoria_id) not null
)

/*zad6*/

create table zamowienia
(
zamowienie_id int primary key,
klient_id int foreign key(klient_id) references klienci(klient_id) not null,
data date default getDate() not null,
rabat decimal(5, 2) default 0,
)

/*zad7*/

create table zamowienia_pozycje
(
pozycja_id int primary key,
zamowienie_id int foreign key(zamowienie_id) references zamowienia(zamowienie_id) not null,
produkty_id int foreign key(produkty_id) references produkty(produkty_id) not null,
ilosc int not null,
rabat decimal(5, 2) default 0,
)

/*zad8*/

insert into klienci
values
(1, 'jan', 'nowak', 'jan_nowak@gmail.com'),
(2, 'szymon', 'janowski', 'lol@gmail.com'),
(3, 'michu', 'hihi', 'yologmail.com')

insert into klienci_adresy
values
(1, 1, 'sezamkowa', '10a', default , 'Dabville', 'Polska'),
(2, 2, 'fajna', '69', '10', 'Yolocity', 'Polska'),
(3, 3, 'moja', 's2', '420', 'Swagtown', 'Polska')

insert into produkty_kategorie
values
(1, 'kat1'),
(2, 'kat2'),
(3, 'kat3')

insert into produkty
values
(1, 'prod1', 69, 1),
(2, 'prod2', 420, 2),
(3, 'prod3', 1337, 3)

insert into zamowienia (zamowienie_id, klient_id, rabat)
values
(1, 1, 0.8),
(2, 2, 0.32),
(3, 3, 0.41)

insert into zamowienia_pozycje
values
(1, 1, 1, 7, 6.9),
(2, 2, 2, 2, 2.2),
(3, 3, 3, 13, 7)

/*zad9*/

alter table produkty_kategorie
add constraint UC_nazwa UNIQUE (nazwa)

alter table produkty_kategorie
add constraint CHK_kategoria_id CHECK(LEN(nazwa) > 3)

alter table produkty_kategorie add opis text

/*zad10*/

update produkty_kategorie set opis = 'opisik'
WHERE nazwa = 'kat1'

