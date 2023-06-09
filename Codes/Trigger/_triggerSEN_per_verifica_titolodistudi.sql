create or replace TRIGGER VERIFICA_TITOLODISTUDI
BEFORE INSERT ON COMPETENZE
FOR EACH ROW
-- Si attiva prima dell'inserimento su competenze del titolo di studio
DECLARE
    titolo_esistente number := 0;
BEGIN
-- Vede che la specializzazione che vogliamo inserire è già presente, e se presente aumenta il titolo esistente
--   se non è presente crea nuova tipologia di titolo di studio 
    SELECT COUNT(*)
    INTO titolo_esistente
    FROM TITOLIDISTUDI T
    WHERE T.Specializzazione = :NEW.SpecTitolo;
    IF (titolo_esistente = 0)
    THEN
        INSERT INTO TITOLIDISTUDI VALUES (:NEW.SpecTitolo)  ;
        DBMS_OUTPUT.PUT_LINE('Inserito il titolo di studi ' || :NEW.SpecTitolo || ' nella tabella TITOLIDISTUDI');
    END IF;
END;
