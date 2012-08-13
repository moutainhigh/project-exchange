delete from fp_leader where family_id in (select id from fp_family where cun_id=269);
delete from fp_family where cun_id=269;
delete from fp_chengxiao where cun_id=269;
delete from fp_cuoshi where cun_id=269;
delete from fp_diqu where diqu_type='cun' and name='≤‚ ‘¥Â' ;
delete from fp_user where zhen_id=268;
delete from fp_diqu where diqu_type='zhen' and name='≤‚ ‘’Ú';
delete from fp_user where area_id=267;
delete from fp_diqu where diqu_type='area' and name='≤‚ ‘«¯';