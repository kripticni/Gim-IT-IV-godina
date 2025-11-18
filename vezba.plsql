DECLARE
    ulaz VARCHAR2(20);
    cena1 NUMBER(6);
    cena2 NUMBER(6);
    cena3 NUMBER(6);
    prosek VARCHAR2(20);
    poz NUMBER(1);
BEGIN
    ulaz := :tri_cena;
    poz := INSTR(ulaz, ';');
    cena1 := TO_NUMBER(SUBSTR(ulaz, 1, poz-1));
    ulaz := SUBSTR(ulaz, poz+1);
    poz := INSTR(ulaz, ';');
    cena2 := TO_NUMBER(SUBSTR(ulaz, 1, poz-1));
    ulaz := SUBSTR(ulaz, poz+1);
    cena3 := TO_NUMBER(ulaz);
    DBMS_OUTPUT.PUT_LINE('Cene: '||cena1||', '||cena2||', '||cena3);
    DBMS_OUTPUT.PUT_LINE(CONCAT('Prosecna cena: ', to_char(ROUND((cena1+cena2+cena3)/3, 2))));
END

DECLARE
    unos VARCHAR(30);
    proizvod VARCHAR(10);
    proizvodjac VARCHAR(10);
    cena NUMBER(10);
    poz NUMBER(2);
BEGIN
    unos := :informacije_o_proizvodu;
    poz := INSTR(unos, ';');
    proizvod := SUBSTR(unos, 1, poz-1);
    unos := SUBSTR(unos, poz+1);
    poz := INSTR(unos, ';');
    proizvodjac := SUBSTR(unos, 1, poz-1);
    cena := SUBSTR(unos, poz+1);
    cena := ROUND(cena*0.9,2);
    DBMS_OUTPUT.PUT_LINE('Podaci sa smanjenom cenom za 10%:');
    DBMS_OUTPUT.PUT_LINE('Proizvod: '||proizvod);
    DBMS_OUTPUT.PUT_LINE('Proizvodjac: '||proizvodjac);
    DBMS_OUTPUT.PUT_LINE('Cena: '||TO_CHAR(cena));
END

-- ukupan broj ucenika jednog odeljenja i broj odlicnih
-- prikazati procenat odlicnih ucenika u odeljenju
DECLARE
    broj_ucenika VARCHAR2(10);
    odlicni_ucenici VARCHAR2(10);
BEGIN
    broj_ucenika := :broj_ucenika_u_odeljenju;
    odlicni_ucenici := :broj_odlicnih_ucenika;
    DBMS_OUTPUT.PUT_LINE('U odeljenu ima '||broj_ucenika||'ucenika, a od njih je '||odlicni_ucenici||' odlicno.');
    DBMS_OUTPUT.PUT_LINE('Procenat odlicnih ucenika je '||ROUND(odlicni_ucenici/broj_ucenika*100,2)||'%.');
END
