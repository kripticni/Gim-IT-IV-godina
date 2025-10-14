-- Grupa 1
-- prosecna plata svih radnika
SELECT AVG(plata) as "Prosecna plata svih radnika"
FROM zaposleni;

-- upit za svako odeljenje koje prikazuje: id, min i max platu
SELECT MIN(plata) as "Minimalna plata radnika u odeljenju", MAX(plata) as "Minimalna plata radnika u odeljenju", id_menadzera as "Odeljenje (id menadzera)"
FROM zaposleni
GROUP BY id_menadzera;

-- za svako odeljenje broj zaposljenih i prosecnu platu
-- ali samo gde je prosek preko 80k
SELECT COUNT(id) as "Broj radnika", AVG(plata) as "Prosecna plata", id_menadzera as "Odeljenje (id menadzera)"
FROM zaposleni
GROUP BY id_menadzera
HAVING AVG(plata) > 80000;

-- Grupa 2
-- ukupan broj zaposlenih
SELECT COUNT(*)
FROM zaposleni;

-- prosecnu i ukupno platu po odeljenju
SELECT AVG(plata) as "Prosecna plata", SUM(plata) as "Ukupna plata", id_menadzera as "Odeljenje"
FROM zaposleni
GROUP BY id_menadzera;

-- broj zaposlenih po odeljenju ali ako ih ima vise od 3
SELECT COUNT(id) as "Broj zaposljenih", id_menadzera as "Odeljenje"
FROM zaposleni
GROUP BY id_menadzera
HAVING COUNT(id) > 2; -- ne postoji odeljenje sa vise od 3
