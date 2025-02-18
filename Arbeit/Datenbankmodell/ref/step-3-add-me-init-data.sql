
-- ALTER SESSION SET CONTAINER=XEPDB1;

-- ALTER SESSION SET NLS_CHARACTERSET = 'AL32UTF8'

insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor, me_changeable, me_readonly)
values
  (nextval('prophetmaster.seq_zrmme'),' ', ' ', 'keine Einheit', 'j', null, 'n', 'j');
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'kW', 'P', 'Leistung', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'MW', 'P', 'Leistung', 'n', 1000);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'kWh', 'W, Q', 'Arbeit, Energie', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'MWh', 'W, Q', 'Arbeit, Energie', 'n', 1000);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'', 'EURO', 'EURO', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'ct', 'Cent', 'Cent', 'n', 0.01);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'°C', 'T', 'Temperatur', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'Wh/m²', 'G', 'Globalstrahlung', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'Nm³', 'V', 'Normkubikmeter', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'kWh/Nm³', 'H', 'Brennwert', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'%', 'LF', 'Luftfeuchte', 'n', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'),'m/s', 'v', 'Windgeschwindigkeit', 'n', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), 'hPa', 'p', 'Luftdruck', 'n', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), '°', '', 'Windrichtung', 'j', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), 'Kn', '', 'Windstärke', 'j', null);  
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), 'm³', 'VB', 'Betriebsvolumen', 'n', null);
  
insert into
  prophetmaster.zrm_me (me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
    me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), 'kWh/m³', 'HS,n', 'Normalbrennwert', 'n', null);
  
insert into
  prophetmaster.zrm_me(me_id, me_einheit, me_groesse,me_langtext, me_isbasiseinheit,
     me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), '/Stk', 'Preis', 'Kosten pro Stück', 'n', null);
  
insert into
  prophetmaster.zrm_me(me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
     me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), '/MWh', 'Preis', 'Kosten pro MWh', 'n', null);
  
insert into
  prophetmaster.zrm_me(me_id, me_einheit, me_groesse, me_langtext, me_isbasiseinheit,
     me_ufaktor)
values
  (nextval('prophetmaster.seq_zrmme'), '/h', 'Preis', 'Kosten pro Stunde', 'n', null);
  
