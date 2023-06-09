create or replace TRIGGER VERIFICA_DATA
BEFORE INSERT ON SEGNALAZIONI
FOR EACH ROW
-- Si attiva PRIMA dell'inserimento su segnalazioni
DECLARE
-- Impedisce di immettere una data succ a quella attuale:
--   crea una varibiale data_ora_attuale dlelo settsso tipo della nostra tabella e fa una raise
--   selezione il timestamp da una tabella di sistema detta DUAL e lo inserisce in data_ora_attuale
    -- variabile per memorizzare il time stamp attuale
    data_ora_attuale SEGNALAZIONI.Data_Ora%TYPE;
    -- dichiarazione dell'eccezione
    DATA_ORA_FUTURA EXCEPTION;
BEGIN
    SELECT CURRENT_TIMESTAMP INTO data_ora_attuale FROM DUAL;
    IF (data_ora_attuale < :NEW.Data_Ora)
    THEN
        RAISE DATA_ORA_FUTURA;
    END IF;
EXCEPTION
    WHEN DATA_ORA_FUTURA
    THEN
        DBMS_OUTPUT.PUT_LINE('Inserimento rifiutato: data o ora non valida.');
        RAISE_APPLICATION_ERROR(-20900,'Errore inserimento di data o ora futura.');
END;
