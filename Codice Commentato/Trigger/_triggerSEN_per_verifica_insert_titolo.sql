create or replace TRIGGER VERIFICA_INSERT_TITOLI
BEFORE INSERT ON TITOLIDISTUDI
FOR EACH ROW
-- Si attiva PRIMA dell'inserimento dei titoli did studi
DECLARE
-- Controlla se il TItolo di studio che si vuole inserire è già presente -> aumenta count e fa raise
    -- dichiarazione variabile per verifica dell'esistenza del titolo di studi
    numero_titoli NUMBER := 0;
    -- dichiarazione dell'eccezione
    TITOLO_ESISTENTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO numero_titoli FROM TITOLIDISTUDI T WHERE T.Specializzazione = :NEW.Specializzazione;
    IF (numero_titoli > 0)
    THEN
        RAISE TITOLO_ESISTENTE;
    END IF;
EXCEPTION
    WHEN TITOLO_ESISTENTE
    THEN
        DBMS_OUTPUT.PUT_LINE('Inserimento rifiutato: titolo già esistente.');
        RAISE_APPLICATION_ERROR(-20503,'Errore inserimento di un titolo già esistente.');
END;
