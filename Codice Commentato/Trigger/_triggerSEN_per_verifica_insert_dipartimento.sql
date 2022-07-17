create or replace TRIGGER VERIFICA_INSERT_DIPARTIMENTI
BEFORE INSERT ON DIPARTIMENTI
FOR EACH ROW
-- Si attiva successivamente dell'inserimento di un dipartimento
DECLARE
-- Controlla se il dipartimento che si vuole inserire è già presente -> aumenta count e fa raise
    -- dichiarazione variabile per verifica dell'esistenza del dipartimento
    numero_dipartimenti NUMBER := 0;
    -- dichiarazione dell'eccezione
    DIPARTIMENTO_ESISTENTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO numero_dipartimenti FROM DIPARTIMENTI D WHERE D.ID = :NEW.ID;
    IF (numero_dipartimenti > 0)
    THEN
        RAISE DIPARTIMENTO_ESISTENTE;
    END IF;
EXCEPTION
    WHEN DIPARTIMENTO_ESISTENTE
    THEN
        DBMS_OUTPUT.PUT_LINE('Inserimento rifiutato: dipartimento già esistente.');
        RAISE_APPLICATION_ERROR(-20501,'Errore inserimento di un dipartimento già esistente.');
END;
