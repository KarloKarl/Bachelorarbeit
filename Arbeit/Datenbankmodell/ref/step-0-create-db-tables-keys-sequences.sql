
-- CREATE USER PROPHETMASTER IDENTIFIED by "a";

-- GRANT CONNECT, RESOURCE, DBA TO PROPHETMASTER;

-- GRANT CREATE SESSION TO PROPHETMASTER;

-- GRANT UNLIMITED TABLESPACE TO PROPHETMASTER;

CREATE SCHEMA prophetmaster;

CREATE TABLE prophetmaster.zrm_zz (
	zz_id numeric(20) NOT NULL,
	zz_name varchar(10) NOT NULL,
	zz_langtext varchar(255),
	zz_offset_calc float DEFAULT 0 NOT NULL,
	zz_offset_min numeric(4,0) DEFAULT 0 NOT NULL,
	zz_usedst varchar(1) DEFAULT 'n' NOT NULL,
	zz_dst_offset_calc float,
	zz_dst_offset_min numeric,
	zz_memo text,
	zz_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	zz_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	zz_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	zz_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (zz_id)
) ;

CREATE UNIQUE INDEX sk_zz_name ON prophetmaster.zrm_zz (zz_name);

COMMENT ON TABLE prophetmaster.zrm_zz IS 'enthaelt Information zur Umrechnung von Weltzeit in lokaler Zeit';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_anlagedatum IS 'Datum und Uhrzeit furr Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_anlageuser IS 'Username furr Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_id IS 'Primaerschluessel';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_langtext IS 'Ausfuehrliche Beschreibung der Zeitzone, z.B. enthaltene Laender';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_memo IS 'Feld fuer Zusatzinformation als Textfeld';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_name IS 'Bezeichnung fuer die Zeitzone (z.B. GMT)';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_offset_calc IS 'Zeitzonen-Offset in Oracle-Zeitformat umgerechnet
(Offset_Min/24/60)';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_offset_min IS 'Zeitzonen-Offset in Minuten bzgl. GMT';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_updateuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zz.zz_usedst IS 'Besitzt die Zeitzone Regeln fuer die Sommer-/Winterzeitumstellung';


CREATE TABLE prophetmaster.zrm_az (
	az_id numeric(20) NOT NULL,
	zrm_zzid numeric(20) NOT NULL,
	az_name varchar(255) NOT NULL,
	az_gueltig_ab timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	az_gueltig_bis timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	az_zyklisch varchar(1) DEFAULT 'j' NOT NULL,
	az_monat varchar(1) DEFAULT 'n' NOT NULL,
	az_interval_mnt numeric(2,0) DEFAULT 0 NOT NULL,
	az_interval_dd numeric(2,0) DEFAULT 0 NOT NULL,
	az_interval_hh numeric(2,0) DEFAULT 0 NOT NULL,
	az_interval_nn numeric(2,0) DEFAULT 0 NOT NULL,
	az_interval_ss numeric(2,0) DEFAULT 0 NOT NULL,
	az_offset_hh numeric(2,0) DEFAULT 0 NOT NULL,
	az_offset_nn numeric(2,0) DEFAULT 0 NOT NULL,
	az_offset_ss numeric(2,0) DEFAULT 0 NOT NULL,
	az_isactive varchar(1) DEFAULT 'j' NOT NULL,
	az_readonly varchar(1) DEFAULT 'n' NOT NULL,
	az_changeable varchar(1) DEFAULT 'j' NOT NULL,
	az_typ varchar(1) NOT NULL,
	az_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	az_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	az_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	az_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (az_id)
) ;
COMMENT ON TABLE prophetmaster.zrm_az IS 'enthaelt Abtastzeitdefinition der jeweiligen Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_az.az_anlagedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_az.az_anlageuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_az.az_changeable IS 'Datentyp Boolean (j/n) mit Default-Wert j';
COMMENT ON COLUMN prophetmaster.zrm_az.az_gueltig_ab IS 'Startdatum fuer die Abtastung in Ortszeit  der jeweiligen Zeitbasis';
COMMENT ON COLUMN prophetmaster.zrm_az.az_gueltig_bis IS 'Enddatum fuer die Abtastung Ortszeit der jeweiligen Zeitbasis';
COMMENT ON COLUMN prophetmaster.zrm_az.az_id IS 'Primaerschluessel der Abtastzeit';
COMMENT ON COLUMN prophetmaster.zrm_az.az_interval_dd IS 'Interval-Tage (0..99)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_interval_hh IS 'Interval-Stunden (0..23)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_interval_mnt IS 'Intervall-Monate (0..99)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_interval_nn IS 'Interval-Minuten (0..59)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_interval_ss IS 'Interval-Sekunden (0..59)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_isactive IS 'Feld fuer Aktivmarkierung';
COMMENT ON COLUMN prophetmaster.zrm_az.az_monat IS 'monatliche Abtastung
Boolscher Wert (j/n)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_name IS 'Bezeichnung';
COMMENT ON COLUMN prophetmaster.zrm_az.az_offset_hh IS 'Offset-Stunden (0..23)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_offset_nn IS 'Offset-Minuten (0..59)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_offset_ss IS 'Offset-Sekunden (0..59)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_readonly IS 'Boolscher Wert (j/n)';
COMMENT ON COLUMN prophetmaster.zrm_az.az_typ IS 'Abtastzeittyp
o - offen
v - 15 Minuten
s - Stunde
t - Tag
w - Woche
m - Monat
j -Jahr';
COMMENT ON COLUMN prophetmaster.zrm_az.az_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_az.az_updateuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_az.az_zyklisch IS 'Datentyp Boolean (j/n) mit Default-Wert j';
COMMENT ON COLUMN prophetmaster.zrm_az.zrm_zzid IS 'Primaerschluessel der Zeitzone';
CREATE INDEX fk_zrm_az_zrm_zz ON prophetmaster.zrm_az (zrm_zzid);
CREATE UNIQUE INDEX sk_az_name ON prophetmaster.zrm_az (az_name);

ALTER TABLE prophetmaster.zrm_az ADD CONSTRAINT zrm_relation_545 FOREIGN KEY (zrm_zzid) REFERENCES prophetmaster.zrm_zz(zz_id);

CREATE TABLE prophetmaster.dat_mandant (
	mandant_id numeric(20) NOT NULL,
	dat_adressenid numeric(20) NOT NULL,
	zrm_azid numeric(20) NOT NULL,
	zrm_dayazid numeric(20),
	mandant_typ varchar(2) DEFAULT 'b' NOT NULL,
	mandant_codenummer varchar(13),
	mandant_eicnummer varchar(16),
	mandant_ilnnummer varchar(13),
	mandant_abrgoffset timestamp without time zone,
	mandant_infofeld01 varchar(150),
	mandant_infofeld02 varchar(150),
	mandant_infofeld03 varchar(150),
	mandant_infofeld04 varchar(150),
	mandant_infofeld05 varchar(150),
	mandant_memo text,
	mandant_isactive varchar(1) DEFAULT 'j' NOT NULL,
	mandant_mabisverzeichnis varchar(2000),
	mandant_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	mandant_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	mandant_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	mandant_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (mandant_id),
	FOREIGN KEY (zrm_azid) REFERENCES prophetmaster.zrm_az(az_id),
	FOREIGN KEY (zrm_dayazid) REFERENCES prophetmaster.zrm_az(az_id)
) ;

CREATE INDEX fk_dat_mandant_adressen ON prophetmaster.dat_mandant (dat_adressenid);
CREATE INDEX fk_dat_mandant_az ON prophetmaster.dat_mandant (zrm_azid);
CREATE INDEX fk_dat_mandant_dayaz ON prophetmaster.dat_mandant (zrm_dayazid);

COMMENT ON COLUMN prophetmaster.dat_mandant.dat_adressenid IS 'Adressenindex Geschaeftsadresse des Mandanten';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_abrgoffset IS 'Abrechnungs-Offset hh:nn';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_anlagedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_anlageuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_codenummer IS 'VDEW-Codenummer des Mandanten';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_eicnummer IS 'EIC - Nummer (ETSO Identification Code)';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_id IS 'Index in der Mandantentabelle';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_ilnnummer IS 'ILN-Codenummer';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_isactive IS 'Feld fuer Aktivmarkierung';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_mabisverzeichnis IS 'Mandantspezifisches-Unterverzeichnisname fuer MaBis Import, Export, Archiv und Fehler';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_memo IS 'Feld fuer Zusatzinformation';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_typ IS 'Mandant-Typ';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_mandant.mandant_updateuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_mandant.zrm_azid IS 'Primaerschluessel der Abtastzeit';
COMMENT ON COLUMN prophetmaster.dat_mandant.zrm_dayazid IS 'Abtastzeit der Tagesabrechnung';


CREATE TABLE prophetmaster.dat_adressen (
	adress_id numeric(20) NOT NULL,
	dat_mandantid numeric(20),
	adress_land varchar(3),
	adress_ort varchar(255),
	adress_plz varchar(7),
	adress_vorwahl varchar(10),
	adress_name1 varchar(255) NOT NULL,
	adress_name2 varchar(255),
	adress_str varchar(255),
	adress_hausnr varchar(40),
	adress_pf varchar(10),
	adress_tel varchar(15),
	adress_fax varchar(15),
	adress_mobiltel varchar(15),
	adress_email varchar(255),
	adress_readonly varchar(1) DEFAULT 'n' NOT NULL,
	adress_isactive varchar(1) DEFAULT 'j' NOT NULL,
	adress_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	adress_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	adress_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	adress_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (adress_id),
	FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant(mandant_id)
) ;

ALTER TABLE prophetmaster.dat_mandant ADD CONSTRAINT mandant2adress FOREIGN KEY (dat_adressenid) REFERENCES prophetmaster.dat_adressen(adress_id);


CREATE INDEX fk_adressen_land ON prophetmaster.dat_adressen (adress_land);
CREATE INDEX fk_adressen_mandant ON prophetmaster.dat_adressen (dat_mandantid);
CREATE INDEX fk_adressen_name1 ON prophetmaster.dat_adressen (adress_name1);
CREATE INDEX fk_adressen_name2 ON prophetmaster.dat_adressen (adress_name2);
CREATE INDEX fk_adressen_orte ON prophetmaster.dat_adressen (adress_ort, adress_plz);

COMMENT ON TABLE prophetmaster.dat_adressen IS 'Tabelle zur Erfassung saemtlicher Adressen (Adressen)
- Netzbetreiber
- Kunden
- Lieferanten
- Adressen der Einspeise- und Entnahmestellen';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_anlagedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_anlageuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_email IS 'email';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_fax IS 'Faxnummer';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_hausnr IS 'Hausnummer';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_id IS 'Adressenindex';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_isactive IS 'Feld fuer Aktivmarkierung';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_name1 IS 'Kurzname';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_name2 IS 'Name';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_pf IS 'Postfach';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_readonly IS 'Datentyp Boolean (j/n)';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_str IS 'Strasse';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_tel IS 'Telefonnummer';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_adressen.adress_updateuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.dat_adressen.dat_mandantid IS 'Index in der Mandantentabelle';

CREATE TABLE prophetmaster.zrm_me (
	me_id numeric(20) NOT NULL,
	me_einheit varchar(10) NOT NULL,
	me_groesse varchar(10),
	me_langtext varchar(255),
	me_isbasiseinheit varchar(1) DEFAULT 'n' NOT NULL,
	me_ufaktor float,
	me_readonly varchar(1) DEFAULT 'n' NOT NULL,
	me_isactive varchar(1) DEFAULT 'j' NOT NULL,
	me_changeable varchar(1) DEFAULT 'j' NOT NULL,
	me_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	me_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	me_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	me_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (me_id)
) ;

CREATE UNIQUE INDEX sk_me_einheit ON prophetmaster.zrm_me (me_einheit, me_groesse);

COMMENT ON TABLE prophetmaster.zrm_me IS 'enthaelt Umrechnungsfaktoren zur Umrechnung der Zeitreihenwerte in die verschiedenen Masseinheiten, (Zeitreihenwerte werden immer in der jeweiligen Basiseinheit gespeichert)';
COMMENT ON COLUMN prophetmaster.zrm_me.me_anlagedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_me.me_anlageuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_me.me_changeable IS 'Aenderbarkeit ueber den Client
Datentyp Boolean (j/n) mit Default-Wert j';
COMMENT ON COLUMN prophetmaster.zrm_me.me_einheit IS 'Masseinheit';
COMMENT ON COLUMN prophetmaster.zrm_me.me_groesse IS 'Bezeichnung der Groesse (z.B. P fuer Leistung, W fuer Arbeit)';
COMMENT ON COLUMN prophetmaster.zrm_me.me_id IS 'Primaerschluessel der Masseinheiten';
COMMENT ON COLUMN prophetmaster.zrm_me.me_isactive IS 'Feld fuer Aktivmarkierung
Datentyp Boolean (j/n) mit Default-Wert j';
COMMENT ON COLUMN prophetmaster.zrm_me.me_isbasiseinheit IS 'Festlegung, ob die Einheit eine Basiseinheit darstellt';
COMMENT ON COLUMN prophetmaster.zrm_me.me_langtext IS 'Information zur physikalischen Masseinheit';
COMMENT ON COLUMN prophetmaster.zrm_me.me_readonly IS 'Lesestatus
Boolscher Wert (j/n)';
COMMENT ON COLUMN prophetmaster.zrm_me.me_ufaktor IS 'Umrechnungsfaktor zwischen Einheit und Basiseinheit';
COMMENT ON COLUMN prophetmaster.zrm_me.me_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_me.me_updateuser IS 'Username fuer Anlage oder Update';


CREATE TABLE prophetmaster.zrm_zr (
	zr_id numeric(20) NOT NULL,
	zrm_meid numeric(20) NOT NULL,
	zrm_azid numeric(20) NOT NULL,
	zrm_pltcfgid numeric(20),
	zrm_eiimpcfgid numeric(20),
	zrm_eiexpcfgid numeric(20),
	dat_mandantid numeric(20) NOT NULL,
	zr_md varchar(2000) NOT NULL,
	zr_bez varchar(750),
	zr_typ varchar(255) DEFAULT 'M' NOT NULL,
	zr_kategorie varchar(255),
	zr_key varchar(255) NOT NULL,
	zr_source varchar(255),
	zr_history varchar(1) DEFAULT 'n' NOT NULL,
	zr_memo text,
	zr_dateinameimp text,
	zr_dateinameexp text,
	zr_infofeld01 varchar(255),
	zr_infofeld02 varchar(255),
	zr_infofeld03 varchar(255),
	zr_infofeld04 varchar(255),
	zr_infofeld05 varchar(255),
	zr_infofeld06 varchar(255),
	zr_infofeld07 varchar(255),
	zr_infofeld08 varchar(255),
	zr_infofeld09 varchar(255),
	zr_infofeld10 varchar(255),
	zr_anlagedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	zr_anlageuser varchar(255) DEFAULT 'user' NOT NULL,
	zr_updatedatum timestamp without time zone DEFAULT LOCALTIMESTAMP NOT NULL,
	zr_updateuser varchar(255) DEFAULT 'user' NOT NULL,
	PRIMARY KEY (zr_id),
	FOREIGN KEY (zrm_meid) REFERENCES prophetmaster.zrm_me (me_id),
	FOREIGN KEY (zrm_azid) REFERENCES prophetmaster.zrm_az (az_id),
	FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id)
) ;

CREATE INDEX fk_zrm_zr_az ON prophetmaster.zrm_zr (zrm_azid);
CREATE INDEX fk_zrm_zr_me ON prophetmaster.zrm_zr (zrm_meid);
CREATE INDEX fk_zrm_zr_mandant ON prophetmaster.zrm_zr (dat_mandantid);

COMMENT ON TABLE prophetmaster.zrm_zr IS 'zentrale Tabelle zur Verwaltung der Zeitreihen';
COMMENT ON COLUMN prophetmaster.zrm_zr.dat_mandantid IS 'Index in der Mandantentabelle';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_anlagedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_anlageuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_bez IS 'Bezeichnung / Name';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_dateinameexp IS 'Dateiname fuer den Export';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_dateinameimp IS 'Dateiname fuer den Import';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_history IS 'Versionierungsmodus der Zeitreihe:
- n:  keine Versionierung
- j:  Messwerthistorisierung
';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_id IS 'Primaerschluessel der Zeitreihen';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld01 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld02 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld03 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld04 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld05 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld06 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld07 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld08 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld09 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_infofeld10 IS 'Infofeld zur Kategorisierung der Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_kategorie IS 'Zaehlpunkt oder Archiv-String';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_key IS 'zusaetzliche Bezeichnung fuer Zeitreihen
(z.B. Kanal bzw. OBIS)';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_md IS 'Verwaltung der zugeordneten Mandanten mittels Liste aus Indexen';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_memo IS 'Feld fuer Zusatzinformation als Textfeld';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_source IS 'Quellsystem z.B GH, GN, RPS, BKV, VNB Zeitreihen ohne Quelle sind EMS-Zeitreihen';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_typ IS 'Zeitreihentyp (M-Messwert, P-Prognose, F-Fahrplan)';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_updatedatum IS 'Datum und Uhrzeit fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zr.zr_updateuser IS 'Username fuer Anlage oder Update';
COMMENT ON COLUMN prophetmaster.zrm_zr.zrm_azid IS 'Schluessel der zugeordneten Abtastzeit';
COMMENT ON COLUMN prophetmaster.zrm_zr.zrm_eiexpcfgid IS 'Referenz auf Filter fuer Messwertexport';
COMMENT ON COLUMN prophetmaster.zrm_zr.zrm_eiimpcfgid IS 'Referenz auf Filter fuer Messwertimport';
COMMENT ON COLUMN prophetmaster.zrm_zr.zrm_meid IS 'Schluessel der zugeordneten Masseinheit
- ist der Schluessel NULL, so ist die Zeitreihe einheitenlos';
COMMENT ON COLUMN prophetmaster.zrm_zr.zrm_pltcfgid IS 'ID der Plausibilitaetskonfiguration';

-- CREATE INDEX fk_zrm_zr_eicfgexp ON zrm_zr (zrm_eiexpcfgid);
-- CREATE INDEX fk_zrm_zr_eicfgimp ON zrm_zr (zrm_eiimpcfgid);
-- CREATE INDEX fk_zrm_zr_mandant ON zrm_zr (dat_mandantid);

-- CREATE INDEX fk_zrm_zr_pltcfg ON zrm_zr (zrm_pltcfgid);
-- CREATE UNIQUE INDEX sk_zrm_zr_bez_md ON zrm_zr (zr_bez, dat_mandantid);
-- CREATE INDEX sk_zrm_zr_kategorie ON zrm_zr (zr_kategorie, zr_key);
-- ALTER TABLE zrm_zr ADD CONSTRAINT relation_1929 FOREIGN KEY (dat_mandantid) REFERENCES dat_mandant(mandant_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ALTER TABLE zrm_zr ADD CONSTRAINT relation_2211 FOREIGN KEY (zrm_pltcfgid) REFERENCES zrm_pltcfg(pltcfg_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ALTER TABLE zrm_zr ADD CONSTRAINT zrm_relation_100 FOREIGN KEY (zrm_meid) REFERENCES zrm_me(me_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ALTER TABLE zrm_zr ADD CONSTRAINT zrm_relation_103 FOREIGN KEY (zrm_eiimpcfgid) REFERENCES zrm_eicfg(eicfg_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ALTER TABLE zrm_zr ADD CONSTRAINT zrm_relation_104 FOREIGN KEY (zrm_eiexpcfgid) REFERENCES zrm_eicfg(eicfg_id) ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;



CREATE TABLE prophetmaster.zrm_zw1 (
	zrm_zrid numeric(20) NOT NULL,
	zw1_ut timestamp without time zone NOT NULL,
	zw1_wert numeric,
	zw1_wstatus varchar(1),
	zw1_vstatus varchar(1),
	zw1_version numeric DEFAULT 1 NOT NULL,
	zw1_update timestamp without time zone DEFAULT LOCALTIMESTAMP,
	zw1_pltstatus varchar(3),
	zw1_ewstatus varchar(3),
	zw1_gewstatus varchar(3),
	PRIMARY KEY (zrm_zrid, zw1_ut),
	FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id)
) ;

CREATE INDEX sk_zrm_zw1_update ON prophetmaster.zrm_zw1 (zw1_update);

CREATE INDEX sk_zrm_zw1_zrid ON prophetmaster.zrm_zw1 (zrm_zrid);

COMMENT ON TABLE prophetmaster.zrm_zw1 IS 'enthaelt aequidistante Zeitreihenwerte';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zrm_zrid IS 'Fremdschluessel auf die zugehoerige Zeitreihe';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_ewstatus IS 'Statuszusatzinformation (SZI): Ersatzwertverfahren';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_gewstatus IS 'Statuszusatzinformation (SZI): Grund fuer Ersatzwertbildung';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_pltstatus IS 'Statuszusatzinformation (SZI): Plausibilisierungshinweis';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_update IS 'Datum und Uhrzeit fuer Update';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_ut IS 'Endzeitstempel in Weltzeit (UT - universal time)';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_version IS 'aktuelle Versionsnummer des Messwertes
- Versionierung erfolgt immer';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_vstatus IS 'ASCII-codierter Verarbeitungsstatus';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_wert IS 'Zeitreihenwert in Basiseinheit';
COMMENT ON COLUMN prophetmaster.zrm_zw1.zw1_wstatus IS 'ASCII-codierter Wertstatus';



CREATE TABLE prophetmaster.wis_gruppierung (
    gruppierung_id numeric(20) NOT NULL,
	zrm_zrid numeric(20) NOT NULL,
	gruppierung_name varchar(255) NOT NULL,
	dat_mandantid numeric(20) NOT NULL,
	PRIMARY KEY (gruppierung_id),
	FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
	FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
	CONSTRAINT uc_wis_gru UNIQUE (zrm_zrid, gruppierung_name) 
) ;

CREATE INDEX index_wis_gru_zrid ON prophetmaster.wis_gruppierung (zrm_zrid);
CREATE INDEX index_wis_gru_mandantid ON prophetmaster.wis_gruppierung (dat_mandantid);

COMMENT ON TABLE prophetmaster.wis_gruppierung IS 'Gruppierungszuhoerigkeiten von Zeitreihen';
COMMENT ON COLUMN prophetmaster.wis_gruppierung.gruppierung_id IS 'autogenerierter Primarschluessel';
COMMENT ON COLUMN prophetmaster.wis_gruppierung.zrm_zrid IS 'Fremdschluessel der Zeitreihe';
COMMENT ON COLUMN prophetmaster.wis_gruppierung.gruppierung_name IS 'Name der Gruppierung';
COMMENT ON COLUMN prophetmaster.wis_gruppierung.dat_mandantid IS 'Primaerschlussel in der Mandantentabelle';

CREATE TABLE prophetmaster.clara_ts_error_measure_extension (
  eme_id             numeric(20) NOT NULL,
  eme_window_strategy varchar(255) NOT NULL,
  eme_measure        varchar(255) NOT NULL,
  eme_window_size     numeric(20),
  eme_mgid_type      varchar(255) NOT NULL,
  eme_mgid_value     varchar(255) NOT NULL,
  eme_fgid_type      varchar(255) NOT NULL,
  eme_fgid_value     varchar(255) NOT NULL,
  zrm_zrid           numeric(20) NOT NULL,
  dat_mandantid      numeric(20) NOT NULL,
  PRIMARY KEY (eme_id),
  FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
  FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
  CONSTRAINT uc_clara_eme UNIQUE (zrm_zrid)
);

CREATE INDEX fk_clara_eme_mandantid ON prophetmaster.clara_ts_error_measure_extension (dat_mandantid);

-- ALTER TABLE prophetmaster.wis_errormeasure
--   ADD CONSTRAINT PK_WISERRORMEASURE primary key (ERRORMEASURE_ID)
--   USING INDEX
--   PCTFREE 10
--   INITRANS 2
--   MAXTRANS 255;

COMMENT ON COLUMN prophetmaster.clara_ts_error_measure_extension.eme_id
  is 'Id der clara_ts_error_measure_annotation Tabelle';

CREATE TABLE prophetmaster.clara_ts_quarter_device_extension (
  qde_id           numeric(20) NOT NULL,
  qde_device_gid_type     varchar(255) NOT NULL,
  qde_device_gid_value    varchar(255) NOT NULL,
  qde_quarter_gid_type     varchar(255) NOT NULL,
  qde_quarter_gid_value    varchar(255) NOT NULL,
  qde_building_gid_type     varchar(255),
  qde_building_gid_value    varchar(255),
  qde_device_type  varchar(255) NOT NULL,
  zrm_zrid         numeric(20) NOT NULL,
  dat_mandantid    numeric(20) NOT NULL,
  PRIMARY KEY (qde_id),
  FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
  FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
  CONSTRAINT uc_clara_qde_0 UNIQUE (zrm_zrid)
);

-- CREATE INDEX fk_clara_qra_zrid ON prophetmaster.clara_ts_quarter_resource_annotation (zr_id);
CREATE INDEX fk_clara_qre_mandantid ON prophetmaster.clara_ts_quarter_device_extension (dat_mandantid);

CREATE TABLE prophetmaster.clara_ts_quarter_device_battery_storage_extension (
  bs_id             numeric(20) NOT NULL,
  bs_assignment     varchar(255) NOT NULL,
  qde_id            numeric(20) NOT NULL,
  PRIMARY KEY (bs_id),
  FOREIGN KEY (qde_id) REFERENCES prophetmaster.clara_ts_quarter_device_extension (qde_id),
  CONSTRAINT uc_clara_qde_bs UNIQUE (qde_id)
);

-- CREATE INDEX fk_clara_bs_qraid ON prophetmaster.clara_ts_battery_storage (qra_id);

CREATE TABLE prophetmaster.clara_ts_forecast_extension (
  fe_id                   numeric(20) NOT NULL,
  fe_algorithm            varchar(255) NOT NULL,
  fe_details              varchar(255) NOT NULL,
  fe_forecast_gid_type    varchar(255) NOT NULL,
  fe_forecast_gid_value   varchar(255) NOT NULL,
  zrm_zrid                numeric(20) NOT NULL,
  dat_mandantid           numeric(20) NOT NULL,
  PRIMARY KEY (fe_id),
  FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
  FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
  CONSTRAINT uc_clara_fe_0 UNIQUE (zrm_zrid),
  CONSTRAINT uc_clara_fe_1 UNIQUE (dat_mandantid, fe_forecast_gid_type, fe_forecast_gid_value)
);

-- CREATE INDEX fk_clara_fa_zrid ON prophetmaster.clara_ts_forecast_annotation (zr_id);
CREATE INDEX fk_clara_fe_mandantid ON prophetmaster.clara_ts_forecast_extension (dat_mandantid);

CREATE TABLE prophetmaster.clara_ts_poll_request_extension (
  pre_id                  numeric(20) NOT NULL,
  pre_request_id          varchar(1024) NOT NULL,
  pre_requester_gid_type  varchar(1024),
  pre_requester_gid_value varchar(1024),
  pre_request_timestamp   timestamp with time zone,
  zrm_zrid                numeric(20) NOT NULL,
  dat_mandantid           numeric(20) NOT NULL,
  PRIMARY KEY (pre_id),
  FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
  FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
  CONSTRAINT uc_clara_pre_0 UNIQUE (zrm_zrid),
  CONSTRAINT uc_clara_pre_1 UNIQUE (dat_mandantid, pre_request_id)
);

-- CREATE INDEX fk_clara_fa_zrid ON prophetmaster.clara_ts_forecast_annotation (zr_id);
-- CREATE INDEX fk_clara_pre_1 ON prophetmaster.clara_ts_poll_request_extension (dat_mandantid, pre_request_id);

CREATE TABLE prophetmaster.clara_ts_gid (
  gid_id           numeric(20) NOT NULL,
  gid_type         varchar(255) NOT NULL,
  gid_value        varchar(255) NOT NULL,
  zrm_zrid         numeric(20) NOT NULL,
  dat_mandantid    numeric(20) NOT NULL,
  PRIMARY KEY (gid_id),
  FOREIGN KEY (zrm_zrid) REFERENCES prophetmaster.zrm_zr (zr_id),
  FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant (mandant_id),
  CONSTRAINT uc_clara_gid_0 UNIQUE (zrm_zrid),
  CONSTRAINT uc_clara_gid_1 UNIQUE (dat_mandantid, gid_type, gid_value)
);

-- CREATE INDEX fk_clara_qra_zrid ON prophetmaster.clara_ts_gid (zr_id);
CREATE INDEX fk_clara_gid_mandantid ON prophetmaster.clara_ts_gid (dat_mandantid);

-- sequences and trigger


-- DAT_MANDANT


CREATE SEQUENCE prophetmaster.seq_datmandant
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_dat_mandant Before Insert ON prophetmaster.dat_mandant FOR EACH ROW
WHEN (new.mandant_id is null)
BEGIN
select prophetmaster.seq_datmandant.nextval into :new.mandant_id from dual;
END ;*/
-- /

-- DAT_ADRESSEN

CREATE SEQUENCE prophetmaster.seq_datadressen
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_dat_adressen Before Insert ON prophetmaster.dat_adressen FOR EACH ROW
WHEN (new.adress_id is null)
BEGIN
select prophetmaster.seq_datadressen.nextval into :new.adress_id from dual;
END ;*/
-- /

-- ZRM_ZR

CREATE SEQUENCE prophetmaster.seq_zrmzr
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_zrm_zr Before Insert ON prophetmaster.zrm_zr FOR EACH ROW
WHEN (new.zr_id is null)
BEGIN
select prophetmaster.seq_zrmzr.nextval into :new.zr_id from dual;
END ;*/
-- /

-- ZRM_ZZ

CREATE SEQUENCE prophetmaster.seq_zrmzz
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_zrm_zz Before Insert ON prophetmaster.zrm_zz FOR EACH ROW
WHEN (new.zz_id is null)
BEGIN
select prophetmaster.seq_zrmzz.nextval into :new.zz_id from dual;
END ;*/
-- /

-- ZRM_ME

CREATE SEQUENCE prophetmaster.seq_zrmme
Minvalue 1
-- Maxvalue 10000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_zrm_me Before Insert ON prophetmaster.zrm_me FOR EACH ROW
WHEN (new.me_id is null)
BEGIN
select prophetmaster.seq_zrmme.nextval into :new.me_id from dual;
END ;*/
-- /

-- ZRM_AZ

CREATE SEQUENCE prophetmaster.seq_zrmaz
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_zrm_az Before Insert ON prophetmaster.zrm_az FOR EACH ROW
WHEN (new.az_id is null)
BEGIN
select prophetmaster.seq_zrmaz.nextval into :new.az_id from dual;
END ;*/
-- /

-- WIS_GRUPPIERUNG

CREATE SEQUENCE prophetmaster.seq_wisgruppierung
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_wis_gruppierung Before Insert ON prophetmaster.wis_gruppierung FOR EACH ROW
WHEN (new.gruppierung_id is null)
BEGIN
select prophetmaster.seq_wisgruppierung.nextval into :new.gruppierung_id from dual;
END ;*/
-- /

-- CLARA_TS_ERROR_MEASURE_EXTENSION

CREATE SEQUENCE prophetmaster.seq_clara_ts_eme
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_wis_eme Before Insert ON prophetmaster.clara_ts_error_measure_extension FOR EACH ROW
WHEN (new.eme_id is null)
BEGIN
select prophetmaster.seq_clara_ts_eme.nextval into :new.eme_id from dual;
END ;*/
-- /

-- CLARA_TS_QUARTER_RESOURCE_EXTENSION

CREATE SEQUENCE prophetmaster.seq_clara_ts_qde
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_clara_ts_qde Before Insert ON prophetmaster.clara_ts_quarter_device_extension FOR EACH ROW
WHEN (new.qde_id is null)
BEGIN
select prophetmaster.seq_clara_ts_qde.nextval into :new.qde_id from dual;
END ;*/
-- /

-- CLARA_TS_BATTERY_STORAGE

CREATE SEQUENCE prophetmaster.seq_clara_ts_qde_bs
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_clara_ts_qde_bs Before Insert ON prophetmaster.clara_ts_quarter_device_battery_storage_extension FOR EACH ROW
WHEN (new.bs_id is null)
BEGIN
select prophetmaster.seq_clara_ts_qde_bs.nextval into :new.bs_id from dual;
END ;*/
-- /

-- CLARA_TS_POLL_REQUEST_EXTENSION

CREATE SEQUENCE prophetmaster.seq_clara_ts_pre
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_clara_ts_pre Before Insert ON prophetmaster.clara_ts_poll_request_extension FOR EACH ROW
WHEN (new.pre_id is null)
BEGIN
select prophetmaster.seq_clara_ts_pre.nextval into :new.pre_id from dual;
END ;*/
-- /

-- CLARA_TS_FORECAST_EXTENSION

CREATE SEQUENCE prophetmaster.seq_clara_ts_fe
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_clara_ts_fe Before Insert ON prophetmaster.clara_ts_forecast_extension FOR EACH ROW
WHEN (new.fe_id is null)
BEGIN
select prophetmaster.seq_clara_ts_fe.nextval into :new.fe_id from dual;
END ;*/
-- /

-- CLARA_TS_GID

CREATE SEQUENCE prophetmaster.seq_clara_ts_gid
Minvalue 1
-- Maxvalue 1000000000000000000000000000
Start With 1
Increment By 1
Cache 20;
-- /

/*Create Or Replace Trigger T_BI_clara_ts_gid Before Insert ON prophetmaster.clara_ts_gid FOR EACH ROW
WHEN (new.gid_id is null)
BEGIN
select prophetmaster.seq_clara_ts_gid.nextval into :new.gid_id from dual;
END ;*/
-- /










