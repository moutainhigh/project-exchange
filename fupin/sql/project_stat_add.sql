create table fp_project_stat
(
	id bigint primary key,
	stat_type varchar(255),
	year int,
	month int,
	half varchar(255),
	complete varchar(1024),
	problem varchar(1024),
	money varchar(255),
	pro_cun_id bigint,
	pro_zd_id bigint,
	pro_sh_id bigint
)

