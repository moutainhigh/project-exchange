select 	q.name as '区（县）',
		z.name as '镇名称',
		c.name as '村名称',
		(select count(f2.id) 
			from fp_family f2 
			LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id
			where c2.id=c.id) as '贫困户数',
		c.poorPersonNum  as '贫困人口数',
		(select o.orgName
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '帮扶单位',
		(select o.contactName
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '联系人',
		(select o.contactTel
			from fp_user o 
			where o.id=c.org and o.user_type='org') as '联系电话',
		(select count(*) 
			from fp_report r
			where r.cun_id=c.id and type='month' and time='5' and year=2011 and report_type='1') as '3-5月录入情况',
		(select count(*) 
			from fp_report r
			where r.cun_id=c.id and type='month' and time='6' and year=2011 and report_type='1') as '6月录入情况'
from fp_diqu c
LEFT OUTER JOIN fp_diqu z ON c.zhen_id = z.id
LEFT OUTER JOIN fp_diqu q ON z.area_id = q.id
where 	c.diqu_type='cun' and z.diqu_type='zhen' and q.diqu_type='area'
and (z.name = '温泉镇' or  
z.name = '吕田镇' or
z.name = '良口镇' or
z.name = '鳌头镇' or
z.name = '小楼镇' or
z.name = '正果镇' or
z.name = '派潭镇' or
z.name = '梯面镇' or
z.name = '流溪河林场'
)
and c.name != '塘田村' and c.name != '安山村'
group by q.name,z.name,c.name