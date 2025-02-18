-- ALTER SESSION SET CONTAINER=XEPDB1;

-- var adressId number;

insert into
  prophetmaster.dat_adressen (adress_id,adress_name1,adress_anlageuser,adress_updateuser)
values
  (nextval('prophetmaster.seq_datadressen'), 'time-series-mandant','prophetmaster','prophetmaster');
-- returning adress_id into :adressId;

/*var azId number;

exec select az_id into :azId from prophetmaster.zrm_az where az_name = '15 Minuten';

var mandantId number;*/

insert into
  prophetmaster.dat_mandant (mandant_id, dat_adressenid,zrm_azid,mandant_anlageuser,mandant_updateuser)
values
  (nextval('prophetmaster.seq_datmandant'), 1,1,'prophetmaster','prophetmaster');
-- returning mandant_id into :mandantId;

update prophetmaster.dat_adressen
set dat_mandantid = 1
where adress_id = 1;

/*update prophetmaster.dat_adressen
set dat_mandantid = :mandantId
where adress_id = :adressId;*/
