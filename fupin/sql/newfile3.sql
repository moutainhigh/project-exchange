select q.name as '区（县）',
		z.name as '镇名称',
		c.name as '村名称',		
		o.orgName as '单位名称',
		o.contactName as '联系人',
		o.contactTel as '联系电话'
from fp_report r, fp_user o,fp_diqu c,fp_diqu z,fp_diqu q
where r.org_id=o.id 
	and z.diqu_type='zhen'
	and c.zhen_id=z.id
	and q.diqu_type='area'
	and z.area_id=q.id
	and o.user_type='org' 
	and c.diqu_type='cun'
	and o.cun=c.id
	and r.type='month'
	and r.time='6'
	and r.report_type='1'
	and r.item15 is not null
	and r.item15 != ''
group by q.name,z.name,c.name


