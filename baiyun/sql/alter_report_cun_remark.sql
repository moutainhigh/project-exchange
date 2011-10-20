alter table fp_report
	add cun_remark varchar(1024);
alter table fp_project_stat
	add cun_remark varchar(1024); 

update fp_report set cun_remark='未审核' where report_type='1'
update fp_project_stat set cun_remark='未审核' where stat_type='cun' or stat_type='zd'