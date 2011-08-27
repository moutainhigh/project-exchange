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
	contactTel varchar(255),
	amount varchar(255),
	baojian varchar(255),
	lixiang varchar(255),
	shishi varchar(255),
	moneyQu double,
	moneyShehui double,
	moneyShi double,
	moneyZhen double,
	fuzeren varchar(255),
	zhiwu varchar(255),
	gongshangZhiwu varchar(255),
	juanMoney varchar(255),
	shouFuzeren varchar(255),
	shouZhiwu varchar(255)	
)

