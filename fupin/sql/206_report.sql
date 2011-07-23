select distinct
        	a.name as '区（县）',
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
r.item1,
r.item2,
r.item3,
r.item4,
r.item5,
r.item6,
r.item7,
r.item8,
r.item9,
r.item10,
r.item11,
r.item12,
r.item13,
r.item14,
r.item15,
r.item16,
r.item17,
r.item18,
r.item19,
r.item20,
r.item21,
r.item22,
r.item23,
r.item24,
r.item25,
r.item26,
r.item27,
r.item28,
r.item29,
r.item30,
r.item31,
r.item32,
r.item33,
r.item34,
r.item35,
r.item36,
r.item37,
r.item38,
r.item39,
r.item40,
r.item41,
r.item42,
r.item43,
r.item44,
r.item45,
r.item46,
r.item47,
r.item48,
r.item49,
r.item50,
r.item51,
r.item52,
r.item53,
r.item54,
r.item55,
r.item56,
r.item57
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.time=6 and r.report_type=1 and r.type='month'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
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
and a.name='从化市'
group by a.name,z.name,c.name





select distinct
        	a.name as '区（县）',
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
r.item1,
r.item2,
r.item3,
r.item4,
r.item5,
r.item6,
r.item7,
r.item8,
r.item9,
r.item10,
r.item11,
r.item12,
r.item13,
r.item14,
r.item15,
r.item16,
r.item17,
r.item18,
r.item19,
r.item20,
r.item21,
r.item22,
r.item23,
r.item24,
r.item25,
r.item26,
r.item27,
r.item28,
r.item29,
r.item30,
r.item31,
r.item32,
r.item33,
r.item34,
r.item35,
r.item36,
r.item37,
r.item38,
r.item39,
r.item40,
r.item41,
r.item42,
r.item43,
r.item44,
r.item45,
r.item46,
r.item47,
r.item48,
r.item49,
r.item50,
r.item51,
r.item52,
r.item53,
r.item54,
r.item55,
r.item56,
r.item57
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.time=6 and r.report_type=1 and r.type='month'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and ((z.name != '温泉镇' and  
z.name != '吕田镇' and  
z.name != '良口镇' and  
z.name != '鳌头镇' and  
z.name != '小楼镇' and  
z.name != '正果镇' and  
z.name != '派潭镇' and  
z.name != '梯面镇' and  
z.name != '流溪河林场'
) or c.name = '塘田村' or c.name = '安山村')
and a.name='从化市'
group by a.name,z.name,c.name





select distinct
        	a.name as '区（县）',
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
r.item1,
r.item2,
r.item3,
r.item4,
r.item5,
r.item6,
r.item7,
r.item8,
r.item9
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.time=6 and r.report_type=2 and r.type='month'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and ((z.name != '温泉镇' and  
z.name != '吕田镇' and  
z.name != '良口镇' and  
z.name != '鳌头镇' and  
z.name != '小楼镇' and  
z.name != '正果镇' and  
z.name != '派潭镇' and  
z.name != '梯面镇' and  
z.name != '流溪河林场'
) or c.name = '塘田村' or c.name = '安山村')
and a.name='从化市'
group by a.name,z.name,c.name




select distinct
        	a.name as '区（县）',
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
r.item1,
r.item2,
r.item3,
r.item4,
r.item5,
r.item6,
r.item7,
r.item8,
r.item9
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.time=6 and r.report_type=2 and r.type='month'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
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
and a.name='从化市'
group by a.name,z.name,c.name