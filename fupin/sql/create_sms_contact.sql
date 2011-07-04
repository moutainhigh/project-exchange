DROP TABLE fp_contact_group;
DROP TABLE fp_contact;

CREATE TABLE fp_contact_group
(
	id bigint primary key,
	userName varchar(255),
	groupName varchar(255),
	parent_group_id bigint,
	isLeaf tinyint(1)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE fp_contact
(
	id bigint primary key,
	owner  varchar(255),
	orgName varchar(255),
	duty varchar(255),
	contactName varchar(255),
	telNo varchar(255),
	group_id bigint
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
