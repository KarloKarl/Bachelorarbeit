CREATE TABLE prophetmaster.bil_br (
    br_id NUMBER(20) NOT NULL,
    zrm_meid NUMBER(20) NOT NULL,
    dat_mandantid NUMBER(20) NOT NULL,
    zrm_azid NUMBER(20) NOT NULL,
    br_parent_id NUMBER(20) DEFAULT NULL,
    br_gegenstand VARCHAR2(150),
    br_bez VARCHAR2(2000),
    br_memo CLOB,
    br_anlagedatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    br_anlageuser VARCHAR2(255) DEFAULT 'user' NOT NULL,
    br_updatedatum TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    br_updateuser VARCHAR2(255) DEFAULT 'user' NOT NULL,
    PRIMARY KEY (br_id),
    FOREIGN KEY (zrm_meid) REFERENCES prophetmaster.zrm_me(me_id),
    FOREIGN KEY (dat_mandantid) REFERENCES prophetmaster.dat_mandant(mandant_id),
    FOREIGN KEY (zrm_azid) REFERENCES prophetmaster.zrm_az(az_id),
    FOREIGN KEY (br_parent_id) REFERENCES prophetmaster.bil_br(br_id)
);

CREATE INDEX idx_bil_br_meid ON prophetmaster.bil_br (zrm_meid);
CREATE INDEX idx_bil_br_mandant ON prophetmaster.bil_br (dat_mandantid);
CREATE INDEX idx_bil_br_azid ON prophetmaster.bil_br (zrm_azid);
CREATE INDEX idx_bil_br_parent ON prophetmaster.bil_br (br_parent_id);


COMMENT ON TABLE prophetmaster.bil_br IS 'Tabelle zur Definition von Bilanzräumen inklusive:
- Maßeinheit der bilanzierten Zustandsgröße
- Mandant des Bilanzraums
- Bilanzzeitraum
- Vater Bilanzraum
- Untersuchungsgegenstand
- Bezeichnung
- Memo
';
COMMENT ON COLUMN prophetmaster.bil_br.br_id IS 'Primaeschluessel des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.zrm_meid IS 'Schluessel zur Maßeinheit der Zustandsgröße';
COMMENT ON COLUMN prophetmaster.bil_br.dat_mandantid IS 'Schluessel zum Mandanten des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.zrm_azid IS 'Schluessel zum Bilanzzeitintervall des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.br_parent_id IS 'Schluessel zum Vaterbilanzraum in der Baumstrukturierten Bilanzraumhierarchie';
COMMENT ON COLUMN prophetmaster.bil_br.br_gegenstand IS 'Untersuchungsgegenstand des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.br_bez IS 'Bezeichnung des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.br_memo IS 'Freitext zur Beschreibung des Bilanzraums';
COMMENT ON COLUMN prophetmaster.bil_br.br_anlagedatum IS 'Datum und Uhrzeit fuer Anlage';
COMMENT ON COLUMN prophetmaster.bil_br.br_anlageuser IS 'Username fuer Anlage';
COMMENT ON COLUMN prophetmaster.bil_br.br_updatedatum IS 'Datum und Uhrzeit fuer Anlage';
COMMENT ON COLUMN prophetmaster.bil_br.br_updateuser IS 'Username fuer Update';