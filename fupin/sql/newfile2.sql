select f.type as '类型',count(f.id) as '户数'
from fp_family f
group by type;


select f.type as '类型',count(f.id) as '户数'
from fp_family f, fp_diqu c, fp_diqu z, fp_diqu a
where f.cun_id=c.id and c.diqu_type='cun' 
	and c.zhen_id=z.id and z.diqu_type='zhen'
	and z.area_id=a.id and a.diqu_type='area'
	and a.name='增城市'
group by f.type;


select f.type as '类型',count(f.id) as '户数'
from fp_family f, fp_diqu c, fp_diqu z, fp_diqu a
where f.cun_id=c.id and c.diqu_type='cun' 
	and c.zhen_id=z.id and z.diqu_type='zhen'
	and z.area_id=a.id and a.diqu_type='area'
	and a.name='从化市'
group by f.type;