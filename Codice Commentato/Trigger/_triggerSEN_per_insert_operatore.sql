create or replace TRIGGER VINCOLI_OPERATORI_INSERT
AFTER INSERT ON OPERATORI
FOR EACH ROW
-- Tale trigger si attiva successivamente all'inserimento sulla tabella operatori
BEGIN
  -- Aggiornamento del numero di opertaori nel dipartimento
  -- Prende il dipartimento con lo stesso ID dell'op inserito e va ad Aggiornare il cmapo operatore aumentando di 1 
    UPDATE DIPARTIMENTI D SET D.NumeroOperatori = D.NumeroOperatori + 1
    WHERE D.ID = :NEW.IDDip;

    DBMS_OUTPUT.PUT_LINE('Aggiornato numero operatori in tabella DIPARTIMENTI per il dipartimento con ID ' || :NEW.IDDip);
END;
