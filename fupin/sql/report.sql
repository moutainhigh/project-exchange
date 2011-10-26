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
		(select rm.item1
			from fp_report rm
			where rm.type='month' and rm.time=9 and rm.cun_id=r.cun_id and rm.report_type=2 order by rm.id desc limit 1) as '规划投入资金（元）',
r.item2 as '已投入帮扶资金',
r.item3 as '用于帮扶到户资金(元)',
r.item4 as '用于帮扶到村资金(元)',
r.item5 as '财政专项(元)',
r.item6 as '信贷资金(元)',
r.item7 as '单位自筹(元)',
r.item8 as '社会募捐(元)',
r.item9 as '社会引资(元)'
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.report_type=2 and r.type='year'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and a.name='萝岗区'
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
r.item3 as '1低保对象(户) ',
r.item4 as '1低保对象(人) ',
r.item5 as '1低收入困难家庭(户) ',
r.item6 as '1低收入困难家庭(人) ',
r.item7 as '2低保对象(户) ',
r.item8 as '2低保对象(人) ',
r.item9 as '2低收入困难家庭(户) ',
r.item10 as '2低收入困难家庭(人) ',
r.item11 as '危房户(户) ',
r.item12 as '贫困户去世、失踪等情况(户) ',
r.item13 as '预计本年脱贫户数(户) ',
r.item14 as '预计本年脱贫人数(人) ',
r.item15 as '帮扶单位领导(人次) ',
r.item16 as '帮扶单位干部　职工(人次) ',
r.item17 as '种植(户) ',
r.item18 as '养殖(户) ',
r.item19 as '务工(人) ',
r.item20 as '创业(人) ',
r.item21 as '农业科技培训(人次)',
r.item22 as '就业技能培训(人次) ',
r.item23 as '完成危房改造(户) ',
r.item24 as '参加农村合作医疗(人) ',
r.item25 as '参加农村养老保险(人) ',
r.item26 as '义务教育阶段(人) ',
r.item27 as '高中、职高、技校、中专等(人) ',
r.item28 as '大专、本科以上(人) ',
r.item29 as '产业发展带动农户(户) ',
r.item30 as '上年村级集体经济收入(元) ',
r.item31 as '预计今年村级集体经济收入(元) ',
r.item32 as '组织活动(次) ',
r.item33 as '扶贫工作会议(次) ',
r.item34 as '发展新党员(人) ',
r.item35 as '文娱体育(次) ',
r.item36 as '送医送药(次) ',
r.item37 as '科技下乡(次) ',
r.item38 as '其他(次) ',
r.item39 as '工业开发项目(个) ',
r.item40 as '商贸旅游项目(个) ',
r.item41 as '农业开发项目(个) ',
r.item42 as '手工加工项目(个) ',
r.item43 as '招商引资项目(个) ',
r.item44 as '企业捐建项目(个) ',
r.item45 as '硬底化村道(公里) ',
r.item46 as '安装路灯村道(公里) ',
r.item47 as '二次改水工程(个) ',
r.item48 as '生活污水处理设施(个) ',
r.item49 as '农田水利设施(个) ',
r.item50 as '受益农田(鱼塘)面积(亩) ',
r.item51 as '标准农田(鱼塘)(亩) ',
r.item52 as '村委会(个) ',
r.item53 as '文化室(个) ',
r.item54 as '卫生站(个) ',
r.item55 as '环卫设施(个) ',
r.item56 as '体育设施(个) ',
r.item57 as '其他(个) '
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id and r.report_type=1 and r.type='year'
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and a.name='萝岗区'
group by a.name,z.name,c.name
