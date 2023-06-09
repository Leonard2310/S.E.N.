create or replace PACKAGE PACK_SEN
IS

-- ***** PROCEDURES *****

    PROCEDURE valori_iniziali_utenti;

-----------------------------------

    PROCEDURE insert_utente(
        InNumeroDiTelefono IN NUMBER,
        InNome IN VARCHAR2,
        InCognome IN VARCHAR2,
        InProvincia IN CHAR,
        InCittà IN VARCHAR2,
        InCAP IN NUMBER,
        InVia IN VARCHAR2,
        InNumeroCivico IN NUMBER
    );

-----------------------------------

    PROCEDURE stampa_utenti;

-----------------------------------

    PROCEDURE delete_utente(
        InNumeroDiTelefono IN NUMBER
    );

-----------------------------------

    PROCEDURE valori_iniziali_dipartimenti;

-----------------------------------

    PROCEDURE insert_dipartimento(
        InNumeroEmergenza IN NUMBER,
        InTipologia IN VARCHAR2,
        InNumeroVeicoli IN NUMBER,
        InProvincia IN CHAR,
        InCittà IN VARCHAR2,
        InCAP IN NUMBER,
        InVia IN VARCHAR2,
        InNumeroCivico IN NUMBER
    );

-----------------------------------

    PROCEDURE stampa_dipartimenti;

-----------------------------------

    PROCEDURE delete_dipartimento(
        InID IN NUMBER
    );

-----------------------------------

    PROCEDURE valori_iniziali_operatori;

-----------------------------------

    PROCEDURE insert_operatore(
        InNome IN VARCHAR2,
        InCognome IN VARCHAR2,
        InSpecTitolo VARCHAR2,
        InIDDip NUMBER,
        InRuolo IN VARCHAR2
    );

-----------------------------------

    PROCEDURE insert_titolo(
        InSpecializzazione IN TITOLIDISTUDI.Specializzazione%TYPE
    );

-----------------------------------

    PROCEDURE insert_nuovo_titolo_operatore(
        InIDOpe IN NUMBER,
        InSpecTitolo IN VARCHAR2
    );

-----------------------------------

    PROCEDURE stampa_operatori;
    
-----------------------------------

    PROCEDURE delete_operatore(
        InID IN OPERATORI.ID%TYPE
    );
    
-----------------------------------

    PROCEDURE delete_titolo(
        InSpecializzazione IN TITOLIDISTUDI.Specializzazione%TYPE
    );

-----------------------------------

    PROCEDURE insert_segnalazione(
        InNumTelefonicoUtente IN SEGNALAZIONI.NumTelefonicoUtente%TYPE,
        InTipologiaEmergenza IN SEGNALAZIONI.TipologiaEmergenza%TYPE,
        InProvincia IN SEGNALAZIONI.Provincia%TYPE,
        InCittà IN SEGNALAZIONI.Città%TYPE,
        InCAP IN SEGNALAZIONI.CAP%TYPE,
        InVia IN SEGNALAZIONI.Via%TYPE,
        InNumeroCivico IN SEGNALAZIONI.NumeroCivico%TYPE,
        InData_Ora IN SEGNALAZIONI.Data_Ora%TYPE
    );

-----------------------------------

     PROCEDURE informazioni_segnalazione(
        InCodiceSegnalazione IN SEGNALAZIONI.Codice%TYPE,
        OutTipologiaEmergenza OUT SEGNALAZIONI.TipologiaEmergenza%TYPE,
        OutProvincia OUT SEGNALAZIONI.Provincia%TYPE,
        OutCittà OUT SEGNALAZIONI.Città%TYPE,
        OutCAP OUT SEGNALAZIONI.CAP%TYPE,
        OutVia OUT SEGNALAZIONI.Via%TYPE,
        OutNumeroCivico OUT SEGNALAZIONI.NumeroCivico%TYPE,
        OutData_Ora OUT SEGNALAZIONI.Data_Ora%TYPE
    );
    
-----------------------------------

    PROCEDURE insert_coinvolgimento(
        InIDDip IN COINVOLGIMENTI.IDDip%TYPE,
        InCodSegnalazione IN COINVOLGIMENTI.CodSegnalazione%TYPE
    );


-----------------------------------

    PROCEDURE stampa_titoli;

-----------------------------------

    PROCEDURE stampa_segnalazioni;

-----------------------------------

    PROCEDURE stampa_storico;

-----------------------------------

    PROCEDURE stampa_competenze;
    
-----------------------------------

END PACK_SEN;