select distinct
	a.name as '区县（市）',
	z.name as '镇名',
	c.name as '村名',
	f.name as '户名',
	f.idNo as '身份证号码',
	f.income as '年收入',
	f.type as '贫困类型'
from fp_family f
left outer join fp_diqu c on c.id=f.cun_id
left outer join fp_diqu z on c.zhen_id=z.id
left outer join fp_diqu a on a.id=z.area_id
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
