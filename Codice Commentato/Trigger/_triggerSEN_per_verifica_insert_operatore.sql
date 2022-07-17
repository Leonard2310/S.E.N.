create or replace TRIGGER VERIFICA_INSERT_OPERATORI
BEFORE INSERT ON OPERATORI
FOR EACH ROW
-- Si attiva successivamente ad un inserimento di un op
DECLARE
-- Controlla se un OP che si vuole inserire è già presente -> aumenta count e fa raise
    -- dichiarazione variabile per verifica dell'esistenza dell'operatore
    numero_operatori NUMBER := 0;
    -- dichiarazione dell'eccezione
    OPERATORE_ESISTENTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO numero_operatori FROM OPERATORI O WHERE O.ID = :NEW.ID;
    IF (numero_operatori > 0)
    THEN
        RAISE OPERATORE_ESISTENTE;
    END IF;
EXCEPTION
    WHEN OPERATORE_ESISTENTE
    THEN
        DBMS_OUTPUT.PUT_LINE('Inserimento rifiutato: operatore già esistente.');
        RAISE_APPLICATION_ERROR(-20502,'Errore inserimento di un operatore già esistente.');
END;
