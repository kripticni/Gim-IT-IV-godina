-- 1. prikazi ucenike koji imaju prosecnu ocenu iz matematike vecu od prosecne svih ucenika iz istog predmeta
SELECT ucenik.ime || ' ' || ucenik.prezime as "Ucenik", AVG(ocene.ocena) as "Prosek"
FROM ucenik JOIN ocene ON (ucenik.id=ocene.ucenik_id)
            JOIN predmeti ON (ocene.predmet_id=predmeti.id)
WHERE predmeti.naziv = 'Matematika'
GROUP BY ucenik.ime, ucenik.prezime, predmeti.id
HAVING AVG(ocene.ocena) >= (
    SELECT MAX(prosek)
    FROM (
        SELECT AVG(ocene.ocena) as prosek
        FROM ocene JOIN predmeti ON (ocene.predmet_id=predmeti.id)
        WHERE predmeti.naziv = 'Matematika'
        GROUP BY ocene.predmet_id
    )
)

-- 1. prikazi ucenike koji imaju prosecnu ocenu iz matematike vecu od prosecne svih ucenika iz istog predmeta
SELECT ucenik.ime || ' ' || ucenik.prezime as "Ucenik", AVG(ocene.ocena) as "Prosek"
FROM ucenik JOIN ocene ON (ucenik.id=ocene.ucenik_id)
            JOIN predmeti ON (ocene.predmet_id=predmeti.id)
WHERE predmeti.id = 1
GROUP BY ucenik.ime, ucenik.prezime, predmeti.id
HAVING AVG(ocene.ocena) = (
    SELECT MAX(prosek)
    FROM (
        SELECT AVG(ocene.ocena) as prosek
        FROM ocene JOIN predmeti ON (ocene.predmet_id=predmeti.id)
                   JOIN ucenik ON (ucenik.id = ocene.ucenik_id)
        WHERE predmeti.id = 1
        GROUP BY ocene.predmet_id, ucenik.id
    )
)

-- 2. pronadji predmete gde je razlika izmedju najvise i najnize prosecne ocene veca od 1
SELECT predmeti.id, predmeti.naziv
FROM predmeti JOIN (
    SELECT ocene.predmet_id, ocene.ucenik_id, AVG(ocene.ocena) as prosecna
    FROM ocene
    GROUP BY ocene.predmet_id,ocene.ucenik_id
) prosek ON (predmeti.id=prosek.predmet_id)
GROUP BY predmeti.naziv
HAVING MAX(prosek.prosecna) - MIN(prosek.prosecna) > 1.0  

-- 3. prikazi profesore koji su dali vise od 10 ocena 1
SELECT profesori.ime || ' ' || profesori.prezime as "ime profesora", COUNT(ocene.ocena) as "broj jedinica"
FROM profesori JOIN predmeti ON (profesori.predmet_id=predmeti.id)
               JOIN ocene ON (ocene.predmet_id=predmeti.id)
WHERE ocene.ocena = 1
GROUP BY profesori.ime, profesori.prezime
HAVING COUNT(ocene.ocena) > 10

-- 4. izlistaj odeljenja i prosecnu ocenu svih ucenika u tom odeljenju
-- pokazujuci samo gde je prosecna ocena veca od 3.5
SELECT odeljenje.naziv as "naziv odeljenja", ROUND(AVG(ocene.ocena), 2) as "prosek"
FROM ucenik JOIN odeljenje ON (ucenik.odeljenje_id=odeljenje.id)
            JOIN ocene ON (ocene.ucenik_id=ucenik.id)
GROUP BY odeljenje.naziv
HAVING AVG(ocene.ocena) > 3.5

-- 5. prikazati ucenika koji ima najvecu ocenu iz svakog predmeta
SELECT ucenik.ime, ucenik.prezime, predmeti.naziv, ocene.ocena
FROM ocene JOIN ucenik ON (ocene.ucenik_id = ucenik.id)
           JOIN predmeti ON (ocene.predmet_id = predmeti.id)
WHERE ocene.ocena = (
    SELECT MAX(ocena)
    FROM ocene
    WHERE predmeti.id = ocene.predmet_id
)
