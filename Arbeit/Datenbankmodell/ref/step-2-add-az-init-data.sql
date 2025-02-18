
-- ALTER SESSION SET CONTAINER=XEPDB1;

-- declare ZzMezId numeric

-- exec select zz_id into :ZzMezId from prophetmaster.zrm_zz where zz_name = 'MEZ/MESZ' and rownum = 1;
  
insert into
  prophetmaster.zrm_az (az_id, az_name, az_interval_nn, az_typ, az_changeable, az_gueltig_ab, az_gueltig_bis, zrm_zzid)
values
  (nextval('prophetmaster.seq_zrmaz'), '15 Minuten', 15, 'v', 'j', to_date('01.01.2004', 'dd.mm.yyyy'), to_date('04.02.2020', 'dd.mm.yyyy'), 1);
  
insert into
  prophetmaster.zrm_az (az_id, az_name, az_interval_hh, az_typ, az_changeable, az_gueltig_ab, az_gueltig_bis, zrm_zzid)
values
  (nextval('prophetmaster.seq_zrmaz'), 'Stunde', 1, 's', 'j', to_date('01.01.2004', 'dd.mm.yyyy'), to_date('04.02.2020', 'dd.mm.yyyy'), 1);
  
insert into
  prophetmaster.zrm_az (az_id, az_name, az_interval_dd, az_typ, az_changeable, az_gueltig_ab, az_gueltig_bis, zrm_zzid)
values
  (nextval('prophetmaster.seq_zrmaz'), 'Tag', 1, 't', 'j', to_date('01.01.2004', 'dd.mm.yyyy'), to_date('04.02.2020', 'dd.mm.yyyy'), 1);
  
insert into
   prophetmaster.zrm_az (az_id, az_name, az_interval_dd, az_offset_hh,  az_typ, az_changeable, az_gueltig_ab, az_gueltig_bis, zrm_zzid)
values
  (nextval('prophetmaster.seq_zrmaz'), 'Gastag', 1, 6, 't', 'j', to_date('01.01.2004', 'dd.mm.yyyy'), to_date('04.02.2020', 'dd.mm.yyyy'), 1);
  
insert into
  prophetmaster.zrm_az (az_id, az_name, az_zyklisch, az_typ, az_changeable, az_gueltig_ab, az_gueltig_bis, zrm_zzid)
values
  (nextval('prophetmaster.seq_zrmaz'), 'spontan', 'n', 'o', 'j', to_date('01.01.2004', 'dd.mm.yyyy'), to_date('04.02.2020', 'dd.mm.yyyy'), 1);
