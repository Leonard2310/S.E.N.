-- Si è ora connessi come "sen". 

-- Si procede innanzitutto con la creazione delle tabelle: File>Nuovo>Categorie: Livello database>Oggetti di database>Tabella.

-- 1) Tabella utenti
CREATE TABLE UTENTI(
    NumeroDiTelefono NUMBER(10),
    Nome VARCHAR2(30) NOT NULL,
    Cognome VARCHAR2(30) NOT NULL,
    Provincia CHAR(2),
    Città VARCHAR2(35), -- La città con nome più lungo in Italia presenta ben 34 lettere 
    CAP NUMBER(5),
    Via VARCHAR2(35),
    NumeroCivico NUMBER(5), -- Il numero civico più alto in Italia è circa 14500
    
    CONSTRAINT PK_UTENTI PRIMARY KEY(NumeroDiTelefono)
);
-- Eseguendo ciascuna CREATE TABLE, nell'output screen appare "Creato table <nome_table>."

-- 2) Tabella segnalazioni
CREATE TABLE SEGNALAZIONI(
    Codice NUMBER(10),
    TipologiaEmergenza VARCHAR2(30) NOT NULL,
    
    CONSTRAINT PK_SEGNALAZIONI PRIMARY KEY(Codice)
);

-- 3) Tabella dipartimenti
CREATE TABLE DIPARTIMENTI(
    ID NUMBER(4),
    NumeroEmergenza NUMBER(3) NOT NULL,
    Tipologia VARCHAR2(25) NOT NULL,
    NumeroOperatori NUMBER(6),
    NumeroVeicoli NUMBER(4),
    Provincia CHAR(2) NOT NULL,
    Città VARCHAR2(35) NOT NULL,
    CAP NUMBER(5) NOT NULL,
    Via VARCHAR2(35) NOT NULL,
    NumeroCivico NUMBER(5) NOT NULL,
    
    CONSTRAINT PK_DIPARTIMENTI PRIMARY KEY(ID)
);
    
-- 4) Tabella operatori
CREATE TABLE OPERATORI(
    ID NUMBER(6),
    Nome VARCHAR2(30) NOT NULL,
    Cognome VARCHAR2(30) NOT NULL,
    SpecTitolo VARCHAR2(50),
    IDDip NUMBER(4),
    Ruolo VARCHAR2(30) NOT NULL,
    
    CONSTRAINT PK_OPERATORI PRIMARY KEY(ID)
);

-- 5) Tabella titoli_di_studi
CREATE TABLE TITOLIDISTUDI(
    Specializzazione VARCHAR2(50),
    
    CONSTRAINT PK_TITOLIDISTUDI PRIMARY KEY(Specializzazione)
);

-- 6) Tabella richieste
CREATE TABLE RICHIESTE(
    NumTelefonicoUtente NUMBER(10),
    CodSegnalazione NUMBER(10),
    Provincia CHAR(2) NOT NULL,
    Città VARCHAR2(35) NOT NULL,
    CAP NUMBER(5),
    Via VARCHAR2(35) NOT NULL,
    NumeroCivico NUMBER(5),
    --Data DATE,
    --Ora TIME, --hh:mm:ss
    TStamp TIMESTAMP(0) NOT NULL,
    
    CONSTRAINT PK_RICHIESTE PRIMARY KEY(NumTelefonicoUtente, CodSegnalazione)
);

-- 7) Tabella coinvolgimenti
CREATE TABLE COINVOLGIMENTI(
    IDDip NUMBER(4),
    CodSegnalazione NUMBER(10),
    
    CONSTRAINT PK_COINVOLGIMENTI PRIMARY KEY(IDDip, CodSegnalazione)
);

-- Definizione dei ruoli
-- Ruolo utente
CREATE ROLE utente;
    GRANT CONNECT TO utente;
    GRANT INSERT ON sen.RICHIESTE TO utente;
-- Dopo ogni singolo GRANT, apparirà nell'output screen "Grant riuscito/a."
    
-- Ruolo operatore    
CREATE ROLE operatore;
    GRANT CONNECT TO operatore;
    GRANT SELECT, INSERT, DELETE, UPDATE ON sen.SEGNALAZIONI TO operatore;

-- Creazione delle sequenze
/* Si creano le seguenti sequenze:
 * 1- codSeg_seq per Codice di SEGNALAZIONI;
 * 2- idDip_seq per ID di DIPARTIMENTI;
 * 3- idOpe_seq per ID di OPERATORI.
 */
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Creato sequence <nome_sequence>."
CREATE SEQUENCE codSeg_seq 
    INCREMENT BY 1
    START WITH 1000000
    MAXVALUE 9999999999
    NOMINVALUE
    NOCYCLE;
    
CREATE SEQUENCE idDip_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 9999
    NOMINVALUE
    NOCYCLE;
    
CREATE SEQUENCE idOpe_seq
    INCREMENT BY 1
    START WITH 10000
    MAXVALUE 999999
    NOMINVALUE
    NOCYCLE;


-- Aggiunta delle chiavi esterne
/* Si aggiungono le seguenti chiavi esterne:
 * 1- SpecTitolo:TITOLIDISTUDI per OPERATORI;
 * 2- IDDip:DIPARTIMENTI per OPERATORI;
 * 3- NumTelefonicoUtente:UTENTI per RICHIESTE;
 * 4- CodSegnalazione:SEGNALAZIONI per RICHIESTE;
 * 5- IDDip:DIPARTIMENTI per COINVOLGIMENTI;
 * 6- CodSegnalazione:SEGNALAZIONI per SEGNALAZIONI.
 */
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Table <nome_table> modificato."
ALTER TABLE OPERATORI
    ADD CONSTRAINT FK_OPE_TIT FOREIGN KEY (SpecTitolo)
    REFERENCES TITOLIDISTUDI(Specializzazione);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di TitoliDiStudi.
    
ALTER TABLE OPERATORI
    ADD CONSTRAINT FK_OPE_SEG FOREIGN KEY (IDDip)
    REFERENCES DIPARTIMENTI(ID);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di Dipartimenti.
    
ALTER TABLE RICHIESTE
    ADD CONSTRAINT FK_RIC_UTE FOREIGN KEY (NumTelefonicoUtente)
    REFERENCES UTENTI(NumeroDiTelefono);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di Utenti.
    
ALTER TABLE RICHIESTE
    ADD CONSTRAINT FK_RIC_SEG FOREIGN KEY (CodSegnalazione)
    REFERENCES SEGNALAZIONI(Codice);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di Segnalazioni.
    
ALTER TABLE COINVOLGIMENTI
    ADD CONSTRAINT FK_COI_DIP FOREIGN KEY (IDDip)
    REFERENCES DIPARTIMENTI(ID);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di Dipartimenti.
    
ALTER TABLE COINVOLGIMENTI
    ADD CONSTRAINT FK_COI_SEG FOREIGN KEY (CodSegnalazione)
    REFERENCES SEGNALAZIONI(Codice);
    -- Nessuna operazione ON DELETE: la FK si riferisce alla chiave primaria di Segnalazioni.
    

-- Eliminazione delle sequenze
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Sequence <nome_sequence> eliminato."
DROP SEQUENCE codSeg_seq;
DROP SEQUENCE idDip_seq;
DROP SEQUENCE idOpe_seq;

-- Revocazione dei privilegi
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Revoke riuscito/a."
REVOKE INSERT ON sen.RICHIESTE FROM utente;
REVOKE SELECT, INSERT, DELETE, UPDATE ON sen.SEGNALAZIONI FROM operatore;

-- Rimozione dei ruoli
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Role <nome_role> eliminato."
DROP ROLE utente;
DROP ROLE operatore;

-- Eliminazione delle tabelle
-- Dopo ogni singola esecuzione, apparirà nell'output screen "Table <nome_tabella> eliminato."
DROP TABLE OPERATORI;
DROP TABLE RICHIESTE;
DROP TABLE COINVOLGIMENTI;
DROP TABLE UTENTI;
DROP TABLE DIPARTIMENTI;
DROP TABLE TITOLIDISTUDI;
DROP TABLE SEGNALAZIONI;