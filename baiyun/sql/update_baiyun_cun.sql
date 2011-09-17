alter table fp_diqu 
	add column sj_income double,
	add column tudi double,
	add column the_res varchar(2048),
	add column the_plan varchar(2048),
	add column the_con varchar(2048);
	
alter table fp_project
	modify content varchar(10240)
	
alter table fp_cuoshi
	add column plan2011 varchar(2048),
	add column plan2012 varchar(2048);

alter table fp_chengxiao
	add column s1 varchar(2048),
	add column s2 varchar(2048),
	add column s3 varchar(2048),
	add column s4 varchar(2048),
	add column content2 varchar(2048);
	
alter table fp_record
	add column s1 varchar(2048),
	add column s2 varchar(2048),
	add column s3 varchar(2048),
	add column s4 varchar(2048),
	add column `year` varchar(255);
