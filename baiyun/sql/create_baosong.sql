create table fp_baosong
(
	id bigint primary key,
	title varchar(255),
	content varchar(5000),
	status int,
	bao_date datetime,
	user_id bigint,
	attatch1 varchar(255),
	attatch2 varchar(255),
	attatch3 varchar(255),
	attatch4 varchar(255),
	attatch5 varchar(255)
)