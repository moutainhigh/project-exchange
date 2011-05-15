SELECT u.loginName AS '登录账号', u.orgName AS '单位名称', d.name AS '村的名称', l.leaderName AS '干部名', l.tel AS '手机号码'
FROM fp_user u
LEFT JOIN fp_diqu d ON u.id = d.org
LEFT JOIN fp_leader l ON l.org_id = u.id
WHERE u.user_type = 'org' 
--and u.orgName='市汽车工业集团'


select u.orgName,d.name
from fp_diqu d left join fp_user u on u.id=d.org
where u.user_type='org' and u.orgName='市汽车工业集团'

select name
from fp_diqu d
where d.name = '龙新村'


create table fp_leader_help
(
	`id` bigint(20) NOT NULL primary key,
	`family_id` bigint(20),
	`leader_id` bigint(20)
)
commit;



select f.name,f.reason
from fp_family f
where (f.reason is null or f.reason='')