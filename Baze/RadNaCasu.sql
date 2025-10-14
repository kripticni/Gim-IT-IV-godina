-- napisati upit na koji se pise datum uzimanja i naziv knjige ciji je izdavac zavod
SELECT datum_uzimanja as "Datum uzimanja", knjige.naziv as "Naziv knjige", izdavaci.naziv as "Naziv izdavaca"
FROM pozajmice JOIN primerci USING (inventarski_broj)
               JOIN knjige USING(id_knjige)
               JOIN izdavaci ON (izdavaci.id=knjige.id_izdavaca)
WHERE izdavaci.naziv = 'Zavod za udzbenike';
