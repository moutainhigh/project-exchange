select sum(r.item13) 
from fp_report r 
left outer join fp_diqu c on c.id=r.cun_id 
left outer join fp_diqu z on z.id=c.zhen_id 
where r.report_type='1' 
and r.type='month' 
and r.time='6' 
and c.diqu_type='cun' 
and z.diqu_type='zhen' 
and (z.name='温泉镇' or z.name='吕田镇' or z.name='良口镇' or z.name='鳌头镇' or z.name='小楼镇' or z.name='正果镇' or z.name='派潭镇' or z.name='流溪河林场' or z.name='梯面镇');

select sum(c.poorFamilyNum) 
from fp_report r 
left outer join fp_diqu c on c.id=r.cun_id 
left outer join fp_diqu z on z.id=c.zhen_id 
where r.report_type='1' 
and r.type='month' 
and r.time='6' 
and c.diqu_type='cun' 
and z.diqu_type='zhen' 
and (z.name='温泉镇' or z.name='吕田镇' or z.name='良口镇' or z.name='鳌头镇' or z.name='小楼镇' or z.name='正果镇' or z.name='派潭镇' or z.name='流溪河林场' or z.name='梯面镇');


select sum(c.poorPersonNum) 
from fp_report r 
left outer join fp_diqu c on c.id=r.cun_id 
left outer join fp_diqu z on z.id=c.zhen_id 
where r.report_type='1' 
and r.type='month' 
and r.time='6' 
and c.diqu_type='cun' 
and z.diqu_type='zhen' 
and (z.name='温泉镇' or z.name='吕田镇' or z.name='良口镇' or z.name='鳌头镇' or z.name='小楼镇' or z.name='正果镇' or z.name='派潭镇' or z.name='流溪河林场' or z.name='梯面镇');