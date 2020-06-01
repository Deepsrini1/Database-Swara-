-- Generated by Oracle SQL Developer Data Modeler 18.2.0.179.0756
--   at:        2018-11-18 16:55:31 EST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE composer (
    composerid     VARCHAR2(40 CHAR) NOT NULL,
    composername   VARCHAR2(70 CHAR),
    songtypeid     VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE composer ADD CONSTRAINT composer_pk PRIMARY KEY ( composerid );

CREATE TABLE gati (
    gatiid         VARCHAR2(40 CHAR) NOT NULL,
    gatiname       VARCHAR2(40 CHAR),
    notesperbeat   VARCHAR2(100 CHAR)
);

ALTER TABLE gati ADD CONSTRAINT gati_pk PRIMARY KEY ( gatiid );

CREATE TABLE genre (
    genreid   VARCHAR2(40 CHAR) NOT NULL,
    type      VARCHAR2(50 CHAR)
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( genreid );

CREATE TABLE jati (
    jatiid            VARCHAR2(40 CHAR) NOT NULL,
    jatiname          VARCHAR2(100 CHAR),
    beatsnoforlaghu   VARCHAR2(40 CHAR)
);

ALTER TABLE jati ADD CONSTRAINT jati_pk PRIMARY KEY ( jatiid );

CREATE TABLE members (
    memberid         VARCHAR2(40 CHAR) NOT NULL,
    addressline      VARCHAR2(100 CHAR),
    city             VARCHAR2(50 CHAR),
    state            VARCHAR2(5 CHAR),
    zip              VARCHAR2(20 CHAR),
    email            VARCHAR2(40 CHAR),
    subscriptionid   VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE members ADD CONSTRAINT members_pk PRIMARY KEY ( memberid );

CREATE TABLE notesdownload (
    songsid         VARCHAR2(40 CHAR) NOT NULL,
    memberid        VARCHAR2(40 CHAR) NOT NULL,
    downloadprice   NUMBER(10,10),
    reasontypeid    VARCHAR2(40 CHAR) NOT NULL
);

ALTER TABLE notesdownload ADD CONSTRAINT notesdownload_pk PRIMARY KEY ( songsid,
                                                                        memberid );

CREATE TABLE ragas (
    ragaid          VARCHAR2(40 CHAR) NOT NULL,
    raganame        VARCHAR2(100 CHAR),
    ragasignature   VARCHAR2(100 CHAR)
);

ALTER TABLE ragas ADD CONSTRAINT ragas_pk PRIMARY KEY ( ragaid );

CREATE TABLE reasontype (
    reasontypeid   VARCHAR2(40 CHAR) NOT NULL,
    reason         VARCHAR2(50 CHAR)
);

ALTER TABLE reasontype ADD CONSTRAINT reasontype_pk PRIMARY KEY ( reasontypeid );

CREATE TABLE songs (
    songsid        VARCHAR2(40 CHAR) NOT NULL,
    songname       VARCHAR2(100 CHAR),
    composerid     VARCHAR2(40 CHAR) NOT NULL,
    ragaid         VARCHAR2(40 CHAR) NOT NULL,
    talaid         VARCHAR2(40 CHAR) NOT NULL,
    jatiid         VARCHAR2(40 CHAR) NOT NULL,
    gatiid         VARCHAR2(40 CHAR) NOT NULL,
    genreid        VARCHAR2(40 CHAR) NOT NULL,
    songtypeid     VARCHAR2(40 CHAR) NOT NULL,
    datecomposed   DATE,
    musicnotes     CLOB
);

ALTER TABLE songs ADD CONSTRAINT songs_pk PRIMARY KEY ( songsid );

CREATE TABLE songstype (
    songtypeid   VARCHAR2(40 CHAR) NOT NULL,
    songtype     VARCHAR2(20 CHAR)
);

ALTER TABLE songstype ADD CONSTRAINT songstype_pk PRIMARY KEY ( songtypeid );

CREATE TABLE subscription (
    subscriptionid   VARCHAR2(40 CHAR) NOT NULL,
    startdate        DATE,
    enddate          DATE,
    price            NUMBER(10,10)
);

ALTER TABLE subscription ADD CONSTRAINT subscription_pk PRIMARY KEY ( subscriptionid );

CREATE TABLE talas (
    talaid        VARCHAR2(40 CHAR) NOT NULL,
    talaname      VARCHAR2(50 CHAR),
    talapattern   NVARCHAR2(50)
);

ALTER TABLE talas ADD CONSTRAINT talas_pk PRIMARY KEY ( talaid );

ALTER TABLE composer
    ADD CONSTRAINT composer_songstype_fk FOREIGN KEY ( songtypeid )
        REFERENCES songstype ( songtypeid );

ALTER TABLE members
    ADD CONSTRAINT members_subscription_fk FOREIGN KEY ( subscriptionid )
        REFERENCES subscription ( subscriptionid );

ALTER TABLE notesdownload
    ADD CONSTRAINT notesdownload_members_fk FOREIGN KEY ( memberid )
        REFERENCES members ( memberid );

ALTER TABLE notesdownload
    ADD CONSTRAINT notesdownload_reasontype_fk FOREIGN KEY ( reasontypeid )
        REFERENCES reasontype ( reasontypeid );

ALTER TABLE notesdownload
    ADD CONSTRAINT notesdownload_songs_fk FOREIGN KEY ( songsid )
        REFERENCES songs ( songsid );

ALTER TABLE songs
    ADD CONSTRAINT songs_composer_fk FOREIGN KEY ( composerid )
        REFERENCES composer ( composerid );

ALTER TABLE songs
    ADD CONSTRAINT songs_gati_fk FOREIGN KEY ( gatiid )
        REFERENCES gati ( gatiid );

ALTER TABLE songs
    ADD CONSTRAINT songs_genre_fk FOREIGN KEY ( genreid )
        REFERENCES genre ( genreid );

ALTER TABLE songs
    ADD CONSTRAINT songs_jati_fk FOREIGN KEY ( jatiid )
        REFERENCES jati ( jatiid );

ALTER TABLE songs
    ADD CONSTRAINT songs_ragas_fk FOREIGN KEY ( ragaid )
        REFERENCES ragas ( ragaid );

ALTER TABLE songs
    ADD CONSTRAINT songs_songstype_fk FOREIGN KEY ( songtypeid )
        REFERENCES songstype ( songtypeid );

ALTER TABLE songs
    ADD CONSTRAINT songs_talas_fk FOREIGN KEY ( talaid )
        REFERENCES talas ( talaid );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
