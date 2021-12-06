/* Inizialmente, non vi sono connessioni gi� create al di fuori degli utenti permanenti del DBMS, "sys" e "system".
 * Dunque, bisogna identificarsi come "system": dopo aver fatto click su "Crea una connessione manualmente" - o eventualmente 
 * sul '+' verde in alto a sinistra, nella sezione "Connessioni" -, si inserisce "system" presso le voci 'Nome' e 'Nome utente'
 * e si inserisce la password definita in fase di installazione nel campo 'Password'.
 * Per quanto riguarda i 'Dettagli', si lascia "localhost" in 'Nome host' e "1521" in 'Porta', mentre si sostituisce l' 'S_ID' 
 * da "xe" (Oracle expression) a "orcl". 
 * Eseguito il 'Test', qualora non siano stati riscontrati problemi, si fa click su 'Connetti' per avviare la connessione.
 */
 
/* Ci si ritrova dunque nel foglio di lavoro "system.sql".
 * Qui bisogna definire l'utente - nel caso in esame "sen" - e attribuirgli dei privilegi.
 */

-- Creazione utente "sen" con password "progetto_2021"
CREATE USER ADMINISTRATOR IDENTIFIED BY progetto_2021;
/* Si esegua soltanto tale istruzione di creazione utente: bisogna selezionarla con il mouse e successivamente su "Esegui 
 * script" (F5). Nell'output screen verr� mostrato "Creato user SEN."
 */

-- Assegnazione dei privilegi
GRANT ALL PRIVILEGES TO ADMINISTRATOR;
-- Con GRANT si assegnano i privilegi; ALL PRIVILEGES include tutti i privilegi messi a disposizione da Oracle SQL Developer.
-- Eseguendo tale istruzione con F5, nell'output screen verr� mostrato "Grant riuscito/a."

/* La connessione attuale � con "system". Bisogna innanzitutto disconnettersi tramite Connessioni>Disconnetti, per poi 
 * effettuare la connessione con l'utente "sen".
 * Basta nuovamente seguire la procedura di creazione di una nuova connessione: il nome � ora "sen", la password � ora 
 * "progetto_2021".
 */