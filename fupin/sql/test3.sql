select c.name,
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='1' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='2' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='3' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='4' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='5' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='6' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='7' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='8' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='9' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='10' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='11' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月',
	(select count(*) from fp_report r where r.report_type=1 and r.type='month' and r.time='12' and r.year=2012 and r.lock_status=1 and r.cun_id=c.id) as '1月'
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
where c.diqu_type='cun'