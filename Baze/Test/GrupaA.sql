-- na osnovu lazar_aleksic_kontrolni_a.docx

-- predmeti (id, naziv)
-- profesori (id, ime, prezime, predmet_id)
-- odeljenje (id, naziv, razred, staresina_id)
-- ucenik (id, ime, prezime, odeljenje_id, datum_rodjenja)
-- ocene (id, ucenik_id, predmet_id, ocena, datum, profesor_id)

-- I. Kreacija tabela

-- Tabela predmeti
CREATE TABLE predmeti (
--id INT PRIMARY KEY AUTO_INCREMENT,
id INT PRIMARY KEY ,
naziv VARCHAR(100) NOT NULL
);
CREATE TABLE profesori (
--id INT PRIMARY KEY AUTO_INCREMENT,
id INT  PRIMARY KEY ,
ime VARCHAR(50) NOT NULL,
prezime VARCHAR(50) NOT NULL,
predmet_id INT,
FOREIGN KEY (predmet_id) REFERENCES predmeti(id));

CREATE TABLE odeljenje (
--id INT PRIMARY KEY AUTO_INCREMENT,
id INT  PRIMARY KEY,
naziv VARCHAR(20) NOT NULL,
razred INT NOT NULL,
staresina_id INT,
FOREIGN KEY (staresina_id) REFERENCES profesori(id)
);

CREATE TABLE ucenik (
--id INT PRIMARY KEY AUTO_INCREMENT,
id INT PRIMARY KEY ,
ime VARCHAR(50) NOT NULL,
prezime VARCHAR(50) NOT NULL,
odeljenje_id INT,
datum_rodjenja DATE,
FOREIGN KEY (odeljenje_id) REFERENCES odeljenje(id)
);

CREATE TABLE ocene (
--id INT PRIMARY KEY AUTO_INCREMENT,
id INT PRIMARY KEY ,	
ucenik_id INT NOT NULL,
predmet_id INT NOT NULL,
ocena INT NOT NULL CHECK (ocena BETWEEN 1 AND 5),
datum DATE NOT NULL,
profesor_id INT NOT NULL,
FOREIGN KEY (ucenik_id) REFERENCES ucenik(id),
FOREIGN KEY (predmet_id) REFERENCES predmeti(id),
FOREIGN KEY (profesor_id) REFERENCES profesori(id)
);

-- II. Unos podataka

INSERT INTO predmeti (id, naziv) VALUES
(1,'Matematika'),
(2,'Srpski jezik'),
(3,'Engleski jezik'),
(4,'Fizika'),
(5,'Hemija'),
(6,'Biologija'),
(7,'Informatika'),
(8,'Istorija'),
(9,'Geografija');

INSERT INTO profesori (id, ime, prezime, predmet_id) VALUES
(1, 'Marko', 'Petrović', 1)
(2, 'Ana', 'Jovanović', 2)
(3, 'Ivana', 'Nikolić', 3)
(4, 'Petar', 'Pavlović', 4)
(5, 'Milan', 'Simić', 5)
(6, 'Jelena', 'Đorđević', 6)
(7, 'Dejan', 'Stanković', 7)
(8, 'Snežana', 'Popović', 8)
(9, 'Nenad', 'Milić', 9)
(10, 'Bojana', 'Radović', 1)
(11, 'Goran', 'Perišić', 4)

INSERT INTO odeljenje (id, naziv, razred, staresina_id) VALUES
(1, 'IV-1', 4, 1)
(2,'IV-2', 4, 7)
(3,'IV-3', 4, 4)
(4,'IV-4', 4, 2)


 --Insert podataka za učenike

INSERT INTO ucenik (ID, ime, prezime, odeljenje_id, datum_rodjenja) VALUES

 --Odeljenje IV-1
(1, 'Nikola', 'Marković', 1, '2006-03-15')
(2, 'Marija', 'Ilić', 1, '2006-07-22')
(3, 'Stefan', 'Radić', 1, '2006-01-10')
(4, 'Jovana', 'Todorović', 1, '2006-11-05')
(5, 'Aleksandar', 'Lukić', 1, '2006-04-18')

 --Odeljenje IV-2
INSERT INTO ucenik (ID, ime, prezime, odeljenje_id, datum_rodjenja) VALUES
(6, 'Milica', 'Savić', 2, '2006-09-12')
(7, 'Dušan', 'Miletić', 2, '2006-02-28')
(8, 'Tamara', 'Božić', 2, '2006-06-14')
(9, 'Luka', 'Vasić', 2, '2006-12-03')
(10, 'Sara', 'Milosavljević', 2, '2006-08-19')

 --Odeljenje IV-3
INSERT INTO ucenik (ID, ime, prezime, odeljenje_id, datum_rodjenja) VALUES
(11, 'Nemanja', 'Janković', 3, '2006-05-25')
(12, 'Kristina', 'Stojanović', 3, '2006-10-08')
(13, 'Filip', 'Mitić', 3, '2006-03-30')
(14, 'Ana', 'Ristić', 3, '2006-07-17')
(15, 'Marko', 'Antić', 3, '2006-11-21')

-- Odeljenje IV-4
INSERT INTO ucenik (ID, ime, prezime, odeljenje_id, datum_rodjenja) VALUES
(16, 'Ivana', 'Marjanović', 4, '2006-04-05')
(17, 'Bojan', 'Živković', 4, '2006-09-27')
(18, 'Teodora', 'Veljković', 4, '2006-01-14')
(19, 'Vladimir', 'Milanović', 4, '2006-06-09')
(20, 'Mina', 'Popović', 4, '2006-12-15')


---- Ocene za odeljenje IV-1 (Matematika - profesor Marko Petrović je starešina)
INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
 (1, 1, 1, 5, '2024-01-15', 1)
(2, 1, 1, 5, '2024-02-10', 1)
(3, 1, 1, 5, '2024-03-05', 1)
(4, 2, 1, 4, '2024-01-15', 1)
(5, 2, 1, 5, '2024-02-10', 1)
(6, 2, 1, 4, '2024-03-05', 1)
(7, 3, 1, 3, '2024-01-15', 1)
(8, 3, 1, 4, '2024-02-10', 1)
(9, 3, 1, 3, '2024-03-05', 1)

---- Ocene za Informatiku (profesor Dejan Stanković)
INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
(10, 1, 7, 5, '2024-01-20', 7)
(11, 1, 7, 5, '2024-02-15', 7)
(12, 2, 7, 4, '2024-01-20', 7)
(13, 2, 7, 5, '2024-02-15', 7)
(14, 6, 7, 5, '2024-01-20', 7)
(15, 6, 7, 5, '2024-02-15', 7)

INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
---- Ocene od profesora čije prezime počinje na "P"
(16, 1, 4, 5, '2024-01-25', 4)
(17, 1, 8, 5, '2024-02-01', 8)
(18, 2, 4, 5, '2024-01-25', 4)
(19, 3, 4, 5, '2024-01-25', 4)

INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
---- Ocene za testiranje prosečnih ocena po predmetima
(20, 4, 1, 5, '2024-01-10', 1)
(21, 4, 1, 5, '2024-02-08', 1)
(22, 4, 1, 5, '2024-03-12', 1)
(23, 5, 1, 5, '2024-01-10', 1)
(24, 5, 1, 4, '2024-02-08', 1)
(25, 5, 1, 5, '2024-03-12', 1)

INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
---- Hemija - nizak prosek
(26, 1, 5, 2, '2024-02-14', 5)
(27, 1, 5, 3, '2024-02-14', 5)
(28, 2, 5, 3, '2024-02-14', 5)
(29, 2, 5, 2, '2024-02-14', 5)
(30, 3, 5, 1, '2024-02-14', 5)
(31, 3, 5, 2, '2024-02-14', 5)

INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
-- Ocene 1 za profesora koji je dao više od 10 jedinica
(32, 6, 5, 1, '2024-02-14', 5)
(33, 7, 5, 1, '2024-02-14', 5)
(34, 8, 5, 1, '2024-02-14', 5)
(35, 9, 5, 1, '2024-02-14', 5)
(36, 10, 5, 1, '2024-02-14', 5)
(37, 11, 5, 1, '2024-02-14', 5)
(38, 12, 5, 1, '2024-02-14', 5)
(39, 13, 5, 1, '2024-02-14', 5)
(40, 14, 5, 1, '2024-02-14', 5)
(41, 15, 5, 1, '2024-02-14', 5)
(42, 16, 5, 1, '2024-02-14', 5)
(43, 17, 5, 1, '2024-02-14', 5)
(44, 18, 5, 1, '2024-02-14', 5)
(45, 19, 5, 1, '2024-02-14', 5)
(46, 20, 5, 1, '2024-02-14', 5)

INSERT INTO ocene (ID, ucenik_id, predmet_id, ocena, datum, profesor_id) VALUES
-- Ostale ocene za kompletniju sliku
(47, 1, 2, 4, '2024-01-22', 2)
(48, 1, 3, 5, '2024-01-24', 3)
(49, 2, 2, 3, '2024-01-22', 2)
(50, 2, 3, 4, '2024-01-24', 3)

-- III. Zadaci

-- 1. prikazi id, ime i prezime i prosecnu ocenu svih ucenika ciji je 
-- prosek veci od 2.5
SELECT ucenik.id as "id ucenika", ucenik.ime as "ime ucenika", ucenik.prezime as "prezime ucenika", 
       AVG(ocene.ocena) as "prosek ucenika"
FROM ucenik JOIN ocene ON (ucenik.id=ocene.ucenik_id)
GROUP BY ucenik.id, ucenik.ime, ucenik.prezime
HAVING AVG(ocene.ocena) > 2.5

-- 2. pronadji predmete i prosecnu ocenu kod kojih je najvisa prosecna ocena medju svim predmetima
-- !!! trebalo bi da je resenje tacno !!!
-- !!! ali ovaj zadatak nije proveren !!!
SELECT predmeti.naziv AS "predmet",
       AVG(ocene.ocena) AS "prosecna ocena"
FROM predmeti
JOIN ocene ON (predmeti.id = ocene.predmet_id)
GROUP BY predmeti.naziv
HAVING AVG(ocene.ocena) = (
        SELECT
            MAX(prosek)
        FROM (
            SELECT AVG(ocene.ocena) as prosek
            FROM ocene
            GROUP BY ocene.predmet_id
        ) 
    )

-- 3. prikazi spojeno ime i prezime ucenika koji ima bar jednu ocenu 5 od profesora sa prezime na P
SELECT UNIQUE ucenik.id, ucenik.ime || ' ' || ucenik.prezime as "Ime i prezime ucenika", ocene.ocena
FROM ucenik JOIN ocene ON (ucenik.id=ocene.ucenik_id)
            JOIN profesori ON (ocene.profesor_id=profesori.id)
WHERE ocene.ocena = 5 AND profesori.ime LIKE 'P%'

-- 4. sva odeljenja i broj ucenika u svakom odeljenju sortirano opadajuce po broju ucenika
SELECT odeljenje.naziv as "Odeljenje", COUNT(ucenik.id) as "Broj ucenika"
FROM odeljenje JOIN ucenik ON (ucenik.odeljenje_id=odeljenje.id)
GROUP BY odeljenje.naziv
ORDER BY COUNT(ucenik.id) DESC

-- 5. prikazi profesori koji su ocenjivali odeljenja gde su i razredne staresine
SELECT UNIQUE profesori.ime || ' ' || profesori.prezime as "Ime i prezime profesora"
FROM ucenik JOIN odeljenje ON (ucenik.odeljenje_id=odeljenje.id)
            JOIN ocene ON (ucenik.id=ocene.ucenik_id)
            JOIN profesori ON (profesori.id=profesor_id)
WHERE profesori.id = odeljenje.staresina_id
