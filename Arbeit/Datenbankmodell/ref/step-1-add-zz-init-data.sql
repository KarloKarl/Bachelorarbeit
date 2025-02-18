
-- ALTER SESSION SET CONTAINER=XEPDB1;

insert into
  prophetmaster.zrm_zz (zz_id, zz_name, zz_langtext, zz_offset_min, zz_usedst, zz_dst_offset_min)
values
  (nextval('prophetmaster.seq_zrmzz'), 'MEZ/MESZ', 'Mitteleuropäische Lokalzeit', 60, 'j', 60);
  
insert into
  prophetmaster.zrm_zz (zz_id, zz_name, zz_langtext, zz_offset_min, zz_usedst, zz_dst_offset_min)
values
  (nextval('prophetmaster.seq_zrmzz'), 'UT', 'Universal Time', 0, 'n', 0);
  
insert into
  prophetmaster.zrm_zz (zz_id, zz_name, zz_langtext, zz_offset_min, zz_usedst, zz_dst_offset_min)
values
  (nextval('prophetmaster.seq_zrmzz'), 'MEZ', 'Mitteleuropäische Zeit', 60, 'n', 0); 
