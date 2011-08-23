select 
	c.name,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=1) as type1,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=2) as type2,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=3) as type3,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=4) as type4,
	(select count(*) from fp_family f where f.cun_id=c.id) as sum,
from fp_diqu c left outer join fp_user o on c.org=o.id
where c.diqu_type='cun'
	and o.user_type='org'
	and o.loginName='2011000015'
	
select 
	c.name as cunName,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=1) as type1,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=2) as type2,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=3) as type3,
	(select count(*) from fp_family f where f.cun_id=c.id and f.type=4) as type4,
	(select count(*) from fp_family f where f.cun_id=c.id) as sum
from fp_diqu c left outer join fp_user t on c.team_id=t.id
where c.diqu_type='cun'
	and t.user_type='work_team'
	and t.loginName=:loginName