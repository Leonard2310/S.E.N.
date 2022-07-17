create or replace TRIGGER CONSERVA_SEGNALAZIONI
AFTER DELETE ON UTENTI
FOR EACH ROW
-- Si Attiva DOPO l'eliminazione di un utente
DECLARE
-- Crea una tabella in cui mette tutte le info da conservare
    tCodice SEGNALAZIONI.Codice%TYPE;
    tTipologiaEmergenza SEGNALAZIONI.TipologiaEmergenza%TYPE;

    tVia SEGNALAZIONI.Via%TYPE;
    tNumeroCivico SEGNALAZIONI.NumeroCivico%TYPE;
    tCittà SEGNALAZIONI.Città%TYPE;
    tProvincia SEGNALAZIONI.Provincia%TYPE;
    tCAP SEGNALAZIONI.CAP%TYPE;
    tData_Ora SEGNALAZIONI.Data_Ora%TYPE;
-- Cursore preleva tali parametri dalla tabella SEGNALAZIONI dove il NumeroDiTelefono dell'utente eliminato = NumTelefonicoUtente
    cursor t_set IS SELECT 	S.Codice, S.TipologiaEmergenza,
                            S.Via, S.NumeroCivico, S.Città,
                            S.Provincia, S.CAP, S.Data_Ora
    FROM    SEGNALAZIONI S
    WHERE 	S.NumTelefonicoUtente=:old.NumeroDiTelefono;
BEGIN
    OPEN t_set;
    LOOP
    -- Preleviamo dalla tabella segnalazioni tutti i valori che andremo a mettere nella tabella nuova
        FETCH t_set INTO    tCodice, tTipologiaEmergenza,
                            tVia, tNumeroCivico, tCittà, tProvincia, tCAP, tData_Ora;
        EXIT WHEN t_set%NOTFOUND;
        INSERT INTO STORICO_SEGNALAZIONI
        VALUES( tCodice, :OLD.NumeroDiTelefono, :OLD.Nome, :OLD.Cognome, tTipologiaEmergenza,
                tProvincia, tCittà, tCAP, tVia, tNumeroCivico, tData_Ora);
    END LOOP;
    CLOSE t_set;
    DELETE FROM SEGNALAZIONI WHERE NumTelefonicoUtente=:old.NumeroDiTelefono;
  -- Elimina tutte le segnalazioni corrispondneti al numero utente che è stato eliminato
END;
