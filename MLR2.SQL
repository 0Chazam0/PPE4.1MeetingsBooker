-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (15/12/2017 15:57:24)
-- -----------------------------------------------------------------------------
--      Nom de la base : ScriptMeetingBookers
--      Projet : WS_TD SLAM3 Cowann VEYSSIERE
--      Auteur : sio2d11
--      Date de dernière modification : 15/12/2017 15:57:01
-- -----------------------------------------------------------------------------

drop database MeetingBookers;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE MeetingBookers;

-- -----------------------------------------------------------------------------
--       TABLE : CONFIG
-- -----------------------------------------------------------------------------

CREATE TABLE CONFIG
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_CONFIG PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : UTILISATEUR
-- -----------------------------------------------------------------------------

CREATE TABLE UTILISATEUR
   (
    EMAIL varchar(50) NOT NULL  ,
    MDP varchar(25) NULL  ,
    NOM varchar(20) NULL  ,
    PRENOM varchar(20) NULL  ,
    TYPEUSER varchar(2) NULL  ,
    ETAT varchar(1) NULL  ,
    CONTACTERO_N bool NULL  ,
    INSCRITO_N bool NULL  
,   CONSTRAINT PK_UTILISATEUR PRIMARY KEY (EMAIL)
   );

-- -----------------------------------------------------------------------------
--       TABLE : PAYS
-- -----------------------------------------------------------------------------

CREATE TABLE PAYS
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_PAYS PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : FACILITE
-- -----------------------------------------------------------------------------

CREATE TABLE FACILITE
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_FACILITE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : LIEU
-- -----------------------------------------------------------------------------

CREATE TABLE LIEU
   (
    CODE varchar(4) NOT NULL  ,
    CODE_DF3 varchar(4) NOT NULL  ,
    CODE_DF1 varchar(4) NOT NULL  ,
    EMAIL varchar(50) NOT NULL  ,
    LIBELLE varchar(30) NULL  ,
    ADRESSE varchar(50) NULL  ,
    DESCRIPTION varchar(50) NULL  ,
    COORDONNEES varchar(128) NULL  ,
    NBETOILES varchar(1) NULL  
,   CONSTRAINT PK_LIEU PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE LIEU
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_LIEU_VILLE
     ON LIEU (CODE_DF3)
    ;

CREATE  INDEX I_FK_LIEU_CATEG
     ON LIEU (CODE_DF1)
    ;

CREATE  INDEX I_FK_LIEU_UTILISATEUR
     ON LIEU (EMAIL)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : DATE
-- -----------------------------------------------------------------------------

CREATE TABLE DATE
   (
    DATE date NOT NULL  
,   CONSTRAINT PK_DATE PRIMARY KEY (DATE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : VILLE
-- -----------------------------------------------------------------------------

CREATE TABLE VILLE
   (
    CODE varchar(4) NOT NULL  ,
    CODE_DF4 varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_VILLE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VILLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VILLE_PAYS
     ON VILLE (CODE_DF4)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : DUREE
-- -----------------------------------------------------------------------------

CREATE TABLE DUREE
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_DUREE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TYPESALLE
-- -----------------------------------------------------------------------------

CREATE TABLE TYPESALLE
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_TYPESALLE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : SALLE
-- -----------------------------------------------------------------------------

CREATE TABLE SALLE
   (
    CODE varchar(4) NOT NULL  ,
    CODE_DF2 varchar(4) NOT NULL  ,
    CODE_DF5 varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  ,
    LARGEUR int4 NULL  ,
    LONGUEUR int4 NULL  ,
    HAUTEUR int4 NULL  ,
    SURFACE int4 NULL  
,   CONSTRAINT PK_SALLE PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SALLE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SALLE_LIEU
     ON SALLE (CODE_DF2)
    ;

CREATE  INDEX I_FK_SALLE_TYPESALLE
     ON SALLE (CODE_DF5)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RESERVATION
-- -----------------------------------------------------------------------------

CREATE TABLE RESERVATION
   (
    EMAIL varchar(50) NOT NULL  ,
    CODE_DF9 varchar(4) NOT NULL  ,
    CODE varchar(4) NOT NULL  ,
    OPTIONO_N bool NULL  ,
    EFFECTIF int4 NULL  ,
    DATED date NULL  ,
    DATEF date NULL  
,   CONSTRAINT PK_RESERVATION PRIMARY KEY (EMAIL, CODE_DF9, CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RESERVATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RESERVATION_SALLE
     ON RESERVATION (CODE)
    ;

CREATE  INDEX I_FK_RESERVATION_DUREE
     ON RESERVATION (CODE_DF9)
    ;

CREATE  INDEX I_FK_RESERVATION_UTILISATEUR
     ON RESERVATION (EMAIL)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CATEG
-- -----------------------------------------------------------------------------

CREATE TABLE CATEG
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_CATEG PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPEMENT
   (
    CODE varchar(4) NOT NULL  ,
    LIBELLE varchar(30) NULL  
,   CONSTRAINT PK_EQUIPEMENT PRIMARY KEY (CODE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : CHOISIRC
-- -----------------------------------------------------------------------------

CREATE TABLE CHOISIRC
   (
    CODE varchar(4) NOT NULL  ,
    EMAIL varchar(50) NOT NULL  ,
    CODE_DF9 varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  
,   CONSTRAINT PK_CHOISIRC PRIMARY KEY (CODE, EMAIL, CODE_DF9, CODE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CHOISIRC
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CHOISIRC_CONFIG
     ON CHOISIRC (CODE)
    ;

CREATE  INDEX I_FK_CHOISIRC_RESERVATION
     ON CHOISIRC (EMAIL, CODE_DF9, CODE_1)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : DISPOSER
-- -----------------------------------------------------------------------------

CREATE TABLE DISPOSER
   (
    CODE varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  ,
    CAPACITE int4 NULL  
,   CONSTRAINT PK_DISPOSER PRIMARY KEY (CODE, CODE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE DISPOSER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_DISPOSER_CONFIG
     ON DISPOSER (CODE)
    ;

CREATE  INDEX I_FK_DISPOSER_SALLE
     ON DISPOSER (CODE_1)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CHOISIRE
-- -----------------------------------------------------------------------------

CREATE TABLE CHOISIRE
   (
    EMAIL varchar(50) NOT NULL  ,
    CODE_DF9 varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  ,
    CODE varchar(4) NOT NULL  
,   CONSTRAINT PK_CHOISIRE PRIMARY KEY (EMAIL, CODE_DF9, CODE_1, CODE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CHOISIRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CHOISIRE_RESERVATION
     ON CHOISIRE (EMAIL, CODE_DF9, CODE_1)
    ;

CREATE  INDEX I_FK_CHOISIRE_EQUIPEMENT
     ON CHOISIRE (CODE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CHOISIRF
-- -----------------------------------------------------------------------------

CREATE TABLE CHOISIRF
   (
    CODE varchar(4) NOT NULL  ,
    EMAIL varchar(50) NOT NULL  ,
    CODE_DF9 varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  
,   CONSTRAINT PK_CHOISIRF PRIMARY KEY (CODE, EMAIL, CODE_DF9, CODE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CHOISIRF
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CHOISIRF_FACILITE
     ON CHOISIRF (CODE)
    ;

CREATE  INDEX I_FK_CHOISIRF_RESERVATION
     ON CHOISIRF (EMAIL, CODE_DF9, CODE_1)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : CONTACTER
-- -----------------------------------------------------------------------------

CREATE TABLE CONTACTER
   (
    DATE date NOT NULL  ,
    EMAIL varchar(50) NOT NULL  ,
    EMAIL_HER_1 varchar(50) NOT NULL  
,   CONSTRAINT PK_CONTACTER PRIMARY KEY (DATE, EMAIL, EMAIL_HER_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE CONTACTER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_CONTACTER_DATE
     ON CONTACTER (DATE)
    ;

CREATE  INDEX I_FK_CONTACTER_UTILISATEUR
     ON CONTACTER (EMAIL)
    ;

CREATE  INDEX I_FK_CONTACTER_UTILISATEUR1
     ON CONTACTER (EMAIL_HER_1)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EQUIPER
-- -----------------------------------------------------------------------------

CREATE TABLE EQUIPER
   (
    CODE varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  
,   CONSTRAINT PK_EQUIPER PRIMARY KEY (CODE, CODE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EQUIPER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EQUIPER_SALLE
     ON EQUIPER (CODE)
    ;

CREATE  INDEX I_FK_EQUIPER_EQUIPEMENT
     ON EQUIPER (CODE_1)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : POSSEDER
-- -----------------------------------------------------------------------------

CREATE TABLE POSSEDER
   (
    CODE varchar(4) NOT NULL  ,
    CODE_1 varchar(4) NOT NULL  
,   CONSTRAINT PK_POSSEDER PRIMARY KEY (CODE, CODE_1)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE POSSEDER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_POSSEDER_FACILITE
     ON POSSEDER (CODE)
    ;

CREATE  INDEX I_FK_POSSEDER_LIEU
     ON POSSEDER (CODE_1)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_VILLE
          FOREIGN KEY (CODE_DF3)
               REFERENCES VILLE (CODE);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_CATEG
          FOREIGN KEY (CODE_DF1)
               REFERENCES CATEG (CODE);

ALTER TABLE LIEU ADD 
     CONSTRAINT FK_LIEU_UTILISATEUR
          FOREIGN KEY (EMAIL)
               REFERENCES UTILISATEUR (EMAIL);

ALTER TABLE VILLE ADD 
     CONSTRAINT FK_VILLE_PAYS
          FOREIGN KEY (CODE_DF4)
               REFERENCES PAYS (CODE);

ALTER TABLE SALLE ADD 
     CONSTRAINT FK_SALLE_LIEU
          FOREIGN KEY (CODE_DF2)
               REFERENCES LIEU (CODE);

ALTER TABLE SALLE ADD 
     CONSTRAINT FK_SALLE_TYPESALLE
          FOREIGN KEY (CODE_DF5)
               REFERENCES TYPESALLE (CODE);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_SALLE
          FOREIGN KEY (CODE)
               REFERENCES SALLE (CODE);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_DUREE
          FOREIGN KEY (CODE_DF9)
               REFERENCES DUREE (CODE);

ALTER TABLE RESERVATION ADD 
     CONSTRAINT FK_RESERVATION_UTILISATEUR
          FOREIGN KEY (EMAIL)
               REFERENCES UTILISATEUR (EMAIL);

ALTER TABLE CHOISIRC ADD 
     CONSTRAINT FK_CHOISIRC_CONFIG
          FOREIGN KEY (CODE)
               REFERENCES CONFIG (CODE);

ALTER TABLE CHOISIRC ADD 
     CONSTRAINT FK_CHOISIRC_RESERVATION
          FOREIGN KEY (EMAIL, CODE_DF9, CODE_1)
               REFERENCES RESERVATION (EMAIL, CODE_DF9, CODE);

ALTER TABLE DISPOSER ADD 
     CONSTRAINT FK_DISPOSER_CONFIG
          FOREIGN KEY (CODE)
               REFERENCES CONFIG (CODE);

ALTER TABLE DISPOSER ADD 
     CONSTRAINT FK_DISPOSER_SALLE
          FOREIGN KEY (CODE_1)
               REFERENCES SALLE (CODE);

ALTER TABLE CHOISIRE ADD 
     CONSTRAINT FK_CHOISIRE_RESERVATION
          FOREIGN KEY (EMAIL, CODE_DF9, CODE_1)
               REFERENCES RESERVATION (EMAIL, CODE_DF9, CODE);

ALTER TABLE CHOISIRE ADD 
     CONSTRAINT FK_CHOISIRE_EQUIPEMENT
          FOREIGN KEY (CODE)
               REFERENCES EQUIPEMENT (CODE);

ALTER TABLE CHOISIRF ADD 
     CONSTRAINT FK_CHOISIRF_FACILITE
          FOREIGN KEY (CODE)
               REFERENCES FACILITE (CODE);

ALTER TABLE CHOISIRF ADD 
     CONSTRAINT FK_CHOISIRF_RESERVATION
          FOREIGN KEY (EMAIL, CODE_DF9, CODE_1)
               REFERENCES RESERVATION (EMAIL, CODE_DF9, CODE);

ALTER TABLE CONTACTER ADD 
     CONSTRAINT FK_CONTACTER_DATE
          FOREIGN KEY (DATE)
               REFERENCES DATE (DATE);

ALTER TABLE CONTACTER ADD 
     CONSTRAINT FK_CONTACTER_UTILISATEUR
          FOREIGN KEY (EMAIL)
               REFERENCES UTILISATEUR (EMAIL);

ALTER TABLE CONTACTER ADD 
     CONSTRAINT FK_CONTACTER_UTILISATEUR1
          FOREIGN KEY (EMAIL_HER_1)
               REFERENCES UTILISATEUR (EMAIL);

ALTER TABLE EQUIPER ADD 
     CONSTRAINT FK_EQUIPER_SALLE
          FOREIGN KEY (CODE)
               REFERENCES SALLE (CODE);

ALTER TABLE EQUIPER ADD 
     CONSTRAINT FK_EQUIPER_EQUIPEMENT
          FOREIGN KEY (CODE_1)
               REFERENCES EQUIPEMENT (CODE);

ALTER TABLE POSSEDER ADD 
     CONSTRAINT FK_POSSEDER_FACILITE
          FOREIGN KEY (CODE)
               REFERENCES FACILITE (CODE);

ALTER TABLE POSSEDER ADD 
     CONSTRAINT FK_POSSEDER_LIEU
          FOREIGN KEY (CODE_1)
               REFERENCES LIEU (CODE);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------