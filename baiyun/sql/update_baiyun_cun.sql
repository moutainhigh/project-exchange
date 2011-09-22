alter table fp_diqu 
	add column sj_income double,
	add column tudi double,
	add column the_res varchar(2048),
	add column the_plan varchar(2048),
	add column the_con varchar(2048);
	
alter table fp_project
	modify content varchar(10240);
	
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

alter table fp_project_stat
	add column content varchar(2048);

alter table fp_project_stat
	add column pre_date varchar(255);	
	
alter table fp_project
	add column yongdi1 varchar(255),
	add column yongdi2 varchar(255),
	add column yongdi3 varchar(255);	
	
create table fp_report3_item
(
	id bigint primary key,
	`comment` varchar(2038),
	report3_id bigint,
	pro_cun_id bigint,
	reach_money varchar(255),
	reach_date varchar(255),
	pay_money varchar(255),
	pay_date varchar(255)
);
	
alter table fp_report
	add column zhen_id bigint;
	
	
alter table fp_project
	modify `name` varchar(2048),
	modify `content` text;