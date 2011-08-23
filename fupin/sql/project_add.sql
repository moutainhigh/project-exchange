create table fp_project
(
	id bigint primary key,
	project_type varchar(255),
	name varchar(255),
	cun_id bigint,
	org_id bigint,
	content varchar(1024),
	deadline varchar(255),
	money varchar(255),
	leader varchar(255),
	contactName varchar(255),
	contactTel varchar(255)
)