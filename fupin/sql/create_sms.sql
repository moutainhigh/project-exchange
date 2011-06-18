CREATE TABLE fp_sms
(
	id bigint primary key,
	content varchar(512),
	send_date timestamp,
	smsUserId bigint,
	smsUserName varchar(215),
	tel varchar(32)
)
