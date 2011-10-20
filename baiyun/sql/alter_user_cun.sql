alter table fp_user
	add cun_id bigint,
	add zhenWorkOrg_id bigint;
alter table fp_user
	add address varchar(255),
	add fuze varchar(255),
	add tel varchar(255),
	add zhiwu varchar(255);

alter table fp_user
	add gongshangZhiwu varchar(255);
