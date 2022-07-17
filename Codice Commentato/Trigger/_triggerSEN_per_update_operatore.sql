create or replace TRIGGER VINCOLI_OPERATORI_UPDATE
AFTER UPDATE ON OPERATORI
FOR EACH ROW
-- Tale trigger si attiva successivamente all'aggiornamento sulla tabella operatori
BEGIN
-- Quando cambia il dipartimento dell'op aggiunge un op al dipartimento nuovo e ne toglie uno al vecchio
    -- Incremento del numero di operatori del nuovo dipartimento
    UPDATE DIPARTIMENTI D SET D.NumeroOperatori = D.NumeroOperatori + 1
    WHERE D.ID = :NEW.IDDip;

    -- Decremento del numero di operatori del vecchio dipartimento
    UPDATE DIPARTIMENTI D SET D.NumeroOperatori = D.NumeroOperatori - 1
    WHERE D.ID = :OLD.IDDip;

    DBMS_OUTPUT.PUT_LINE('Aggiornato numero operatori in tabella DIPARTIMENTI per i dipartimenti con ID ' || :NEW.IDDip || ' e ' || :OLD.IDDip);
END;
