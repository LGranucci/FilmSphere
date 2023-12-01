SET NAMES latin1;
SET FOREIGN_KEY_CHECKS = 0;

BEGIN;
CREATE DATABASE IF NOT EXISTS `FilmSphere`;
COMMIT;
USE `filmsphere`;
-- FILM 
DROP TABLE IF EXISTS `Film`;
Create Table `Film` (
	`Codice` int not null,
    `Titolo` varchar(50) not null,
    `Descrizione` varchar(2047) not null,
    `Durata` int not null,
    `Regista` int not null,
    `PaeseDiProduzione` char(255) not null,
    `NumeroRecensioni` int default 0,
    `MediaRecensioni` int,
    Primary Key(`Codice`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Partecipazione
DROP TABLE IF EXISTS `Partecipazione`;
Create Table `Partecipazione`(
	`Film` int not null,
    `Attore` int not null,
    Primary key(`Film`,`Attore`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Attore
DROP TABLE IF EXISTS `Attore`;
Create table `Attore` (
	`Codice` int not null,
    `Nome` char(255) not null,
    `Cognome` char(255) not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Regista
DROP TABLE IF EXISTS `Regista`;
Create table `Regista` (
	`Codice` int not null,
    `Nome` char(255) not null,
    `Cognome` char(255) not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
-- Vincita
DROP TABLE IF EXISTS `Vincita`;
Create table `Vincita` (
	`Codice` int not null,
    `Film` int not null,
    `Premio` varchar(255) not null,
	`Data` date not null,
    Primary key(`Codice`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- PremiazioneRegista
DROP TABLE IF EXISTS `PremiazioneRegista`;
Create table `PremiazioneRegista` (
	`Regista` int not null,
    `Vincita` int not null,
	Primary key(`Regista`, `Vincita`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- PremiazioneAttore
DROP TABLE IF EXISTS `PremiazioneAttore`;
Create table `PremiazioneAttore` (
	`Attore` int not null,
	`Vincita` int not null,
	Primary key(`Attore`, `Vincita`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Premio
DROP TABLE IF EXISTS `Attore`;
Create table `Attore` (
	`Tipo` varchar(255) not null,
    `Valore` float not null,
	Primary key(`Tipo`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
-- Critico
DROP TABLE IF EXISTS `Critico`;
Create table `Critico` (
	`Codice` int not null,
    `Nome` char(255) not null,
    `Cognome` char(255) not null,
	Primary key(`Codice`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Recensione
DROP TABLE IF EXISTS `Recensione`;
Create table `Recensione` (
	`Film` int not null,
	`Critico` int not null,
    `Data` date not null,
    `Valore` int not null,
	Primary key(`Film`, `Critico`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Appartenenza
DROP TABLE IF EXISTS `Appartenenza`;
Create table `Appartenenza` (
	`Film` int not null,
    `Genere` varchar(63) not null,
	Primary key(`Film`, `Genere`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- Genere
DROP TABLE IF EXISTS `Genere`;
Create table `Genere` (
	`Nome` varchar(63) not null,
	Primary key(`Nome`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- FilmCodificato
DROP TABLE IF EXISTS `FilmCodificato`;
Create table `FilmCodificato` (
	`Codice` int not null,
	`Lunghezza` int not null,
	`Dimensione` int not null,
	`Film` int not null,
	`FormatoAudio` varchar(50) not null,
	`FormatoVideo` varchar(50) not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- FormatoVideo
DROP TABLE IF EXISTS `FormatoVideo`;
Create table `FormatoVideo` (
	`Codice` varchar(50) not null,
	`Risoluzione` int not null,
    `Famiglia` varchar(31) not null,
    `AspectRatio` float not null,
    `DataRilascio` date not null,
    `Qualità` int not null,
    `BitRate` int not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- FormatoAudio
DROP TABLE IF EXISTS `FormatoAudio`;
Create table `FormatoAudio` (
	`Codice` varchar(50) not null,
    `Famiglia` varchar(31) not null,
    `DataRilascio` date not null,
    `Qualità` int not null,
    `BitRate` int not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Lingua
DROP TABLE IF EXISTS `Lingua`;
Create table `Lingua` (
	`Nome` varchar(31) not null,
	
	Primary key(`Nome`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Audio
DROP TABLE IF EXISTS `Audio`;
Create table `Audio` (
	`Lingua` varchar(31) not null,
	`FilmCodificato` int not null,
	Primary key(`Lingua`, `FilmCodificato`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Sottotitolo
DROP TABLE IF EXISTS `Sottotitolo`;
Create table `Sottotitolo` (
	`Lingua` varchar(31) not null,
	`FilmCodificato` int not null,
	Primary key(`Lingua`, `FilmCodificato`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Stato
DROP TABLE IF EXISTS `Stato`;
Create table `Stato` (
	`Nome` varchar(255) not null,
    `Longitudine` int not null,
    `Latitudine` int not null,
    `IpInizio` int not null,
    `IpFine` int not null,
	Primary key(`Nome`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- RestrizioneFormato
DROP TABLE IF EXISTS `RestrizioneFormato`;
Create table `RestrizioneFormato` (
	`Stato` varchar(255) not null,
	`FilmCodificato` int not null,
	Primary key(`Stato`, `FilmCodificato`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Abbonamento
DROP TABLE IF EXISTS `Abbonamento`;
Create table `Abbonamento` (
	`Tipo` varchar(10) not null,
	`Durata` int not null,
    `MaxRisoluzione` int,
    `Download` bool not null,
    `MaxConnessioni` int,
    `TariffaMensile` int not null,
    `MaxGb` int,
	Primary key(`Tipo`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- RestrizioneAbbonamento
DROP TABLE IF EXISTS `RestrizioneAbbonamento`;
Create table `RestrizioneAbbonamento` (
	`Stato` varchar(255) not null,
	`Abbonamento` varchar(10) not null,
	Primary key(`Stato`, `Abbonamento`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Utente
DROP TABLE IF EXISTS `Utente`;
Create table `Utente` (
	`Codice` varchar(255) not null,
    `Email` varchar(255) not null,
    `Nome` varchar(255) not null,
    `Cognome` varchar(255) not null,
    `ConnessioniAttive` tinyint not null,
    `Password` varchar(255) not null,
    `Stato` varchar(255) not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Fattura
DROP TABLE IF EXISTS `Fattura`;
Create table `Fattura` (
	`Codice` int not null,
	`Tariffa` int not null,
    `DataEmissione` date not null,
    `Scadenza` date not null,
    `Utente` varchar(255) not null,
    `CartaDiCredito` int not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- CartaDiCredito
DROP TABLE IF EXISTS `CartaDiCredito`;
Create table `CartaDiCredito` (
	`NumeroCarta` int not null,
	`Scadenza` date not null,
    `CVV` int not null,
    `Utente` varchar(255),
	Primary key(`NumeroCarta`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Acquisto
DROP TABLE IF EXISTS `Acquisto`;
Create table `Acquisto` (
	`Utente` varchar(255) not null,
	`Abbonamento` varchar(10) not null,
    `InizioAbbonamento` date not null,
	Primary key(`Utente`, `Abbonamento`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Preferenza
DROP TABLE IF EXISTS `Preferenza`;
Create table `Preferenza` (
	`Nome` varchar(63) not null,
	Primary key(`Nome`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Selezione
DROP TABLE IF EXISTS `Selezione`;
Create table `Selezione` (
	`Utente` varchar(255) not null,
	`Preferenza` varchar(63) not null,
	Primary key(`Utente`, `Preferenza`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- RecensioneUtente
DROP TABLE IF EXISTS `RecensioneUtente`;
Create table `RecensioneUtente` (
	`Utente` varchar(255) not null,
	`Film` int not null,
    `Data` date not null,
    `Valore` int not null,
	Primary key(`Utente`, `Film`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Connessione
DROP TABLE IF EXISTS `Connessione`;
Create table `Connessione` (
	`Inizio` timestamp not null,
	`Dispositivo` int not null,
    `Ip` int not null,
    `Fine` timestamp default null,
	`Utente` varchar(255) not null,
	Primary key(`Inizio`, `Dispositivo`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dispositivo
DROP TABLE IF EXISTS `Dispositivo`;
Create table `Dispositivo` (
	`Codice` int not null,
	`Tipo` varchar(63) not null,
    `Risoluzione` int not null,
    `AspectRatio` float not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Visualizzazione
DROP TABLE IF EXISTS `Visualizzazione`;
Create table `Visualizzazione` (
	`Inizio` timestamp not null,
	`InizioConnessione` timestamp not null,
    `DispositivoConnessione` int not null,
    `Fine` timestamp not null,
    `Server` int not null,
    `FilmCodificato` int not null,
	Primary key(`Inizio`, `InizioConnessione`, `DispositivoConnessione`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Server
DROP TABLE IF EXISTS `Server`;
Create table `Server` (
	`Codice` int not null,
	`LarghezzaDiBanda` int not null,
	`CapacitàMassima` int not null,
	`Longitudine` int not null,
	`Latitudine` int not null,
	`BandaAttuale` int not null,
	`CapacitàAttuale` int not null,
	`FilmCodificato` int not null,
	Primary key(`Codice`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- PossessoServer
DROP TABLE IF EXISTS `PossessoServer`;
Create table `PossessoServer` (
	`Server` int not null,
	`FilmCodificato` int not null,
	Primary key(`Server`, `FilmCodificato`)
    )ENGINE=InnoDB DEFAULT CHARSET=latin1;
