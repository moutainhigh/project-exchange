select z.name as '镇名称',c.name as '村名称',f.name as '贫困户名',f.reason as '平困原因',count(f2.id),count(f.id)
from fp_family f
LEFT JOIN fp_diqu c ON f.cun_id = c.id
LEFT JOIN fp_diqu z ON c.zhen_id = z.id
,fp_family f2
LEFT JOIN fp_diqu c2 ON f2.cun_id = c2.id
LEFT JOIN fp_diqu z2 ON c2.zhen_id = z2.id
where f.reason is null and c.diqu_type='cun' and z.diqu_type='zhen' 
		and c2.diqu_type='cun' and z2.diqu_type='zhen'


select 	q.name as '区（县）',
		z.name as '镇名称',
		c.name as '村名称',
		(select count(f2.id) 
			from fp_family f2 
			LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id
			where c2.id=c.id) as '贫困户数',
		(select count(f2.id) 
			from fp_family f2 
			LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id
			where f2.reason is not null and c2.id=c.id) as '已录入数',
		(select count(f2.id) 
			from fp_family f2 
			LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id
			where f2.reason is null and c2.id=c.id) as '未录入数',
		(select o.orgName
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '帮扶单位',
		(select o.contactName
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '联系人',
		(select o.contactTel
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '联系电话'
from fp_diqu c
LEFT OUTER JOIN fp_diqu z ON c.zhen_id = z.id
LEFT OUTER JOIN fp_diqu q ON z.area_id = q.id
where 	c.diqu_type='cun' and z.diqu_type='zhen' and q.diqu_type='area' 
group by q.name,z.name,c.name

select count(*) from fp_diqu where diqu_type = 'cun'