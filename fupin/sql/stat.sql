select
a.name as '区（县）',
count(c.id) as '村的数目',
count(r.item1) as 'item1的数目',
r.id as rid,
sum((select count(f2.id)  from fp_family f2  LEFT OUTER JOIN fp_diqu c2 ON f2.cun_id = c2.id where c2.id=c.id)) as '贫困户户数(户) ',
sum(c.poorPersonNum) as '贫困户人数(人) ',
r.item3 as 'item3',
sum(r.item3) as '1低保对象(户) ',
sum(r.item4) as '1低保对象(人) ',
sum(r.item5) as '1低收入困难家庭(户) ',
sum(r.item6) as '1低收入困难家庭(人) ',
sum(r.item7) as '2低保对象(户) ',
sum(r.item8) as '2低保对象(人) ',
sum(r.item9) as '2低收入困难家庭(户) ',
sum(r.item10) as '2低收入困难家庭(人) ',
sum(r.item11) as '危房户(户) ',
sum(r.item12) as '贫困户去世、失踪等情况(户) ',
sum(r.item13) as '预计本年脱贫户数(户) ',
sum(r.item14) as '预计本年脱贫人数(人) ',
sum(r.item15) as '帮扶单位领导(人次) ',
sum(r.item16) as '帮扶单位干部　职工(人次) ',
sum(r.item17) as '种植(户) ',
sum(r.item18) as '养殖(户) ',
sum(r.item19) as '务工(人) ',
sum(r.item20) as '创业(人) ',
sum(r.item21) as '农业科技培训(人次)',
sum(r.item22) as '就业技能培训(人次) ',
sum(r.item23) as '完成危房改造(户) ',
sum(r.item24) as '参加农村合作医疗(人) ',
sum(r.item25) as '参加农村养老保险(人) ',
sum(r.item26) as '义务教育阶段(人) ',
sum(r.item27) as '高中、职高、技校、中专等(人) ',
sum(r.item28) as '大专、本科以上(人) ',
sum(r.item29) as '产业发展带动农户(户) ',
sum(r.item30) as '上年村级集体经济收入(元) ',
sum(r.item31) as '预计今年村级集体经济收入(元) ',
sum(r.item32) as '组织活动(次) ',
sum(r.item33) as '扶贫工作会议(次) ',
sum(r.item34) as '发展新党员(人) ',
sum(r.item35) as '文娱体育(次) ',
sum(r.item36) as '送医送药(次) ',
sum(r.item37) as '科技下乡(次) ',
sum(r.item38) as '其他(次) ',
sum(r.item39) as '工业开发项目(个) ',
sum(r.item40) as '商贸旅游项目(个) ',
sum(r.item41) as '农业开发项目(个) ',
sum(r.item42) as '手工加工项目(个) ',
sum(r.item43) as '招商引资项目(个) ',
sum(r.item44) as '企业捐建项目(个) ',
sum(r.item45) as '硬底化村道(公里) ',
sum(r.item46) as '安装路灯村道(公里) ',
sum(r.item47) as '二次改水工程(个) ',
sum(r.item48) as '生活污水处理设施(个) ',
sum(r.item49) as '农田水利设施(个) ',
sum(r.item50) as '受益农田(鱼塘)面积(亩) ',
sum(r.item51) as '标准农田(鱼塘)(亩) ',
sum(r.item52) as '村委会(个) ',
sum(r.item53) as '文化室(个) ',
sum(r.item54) as '卫生站(个) ',
sum(r.item55) as '环卫设施(个) ',
sum(r.item56) as '体育设施(个) ',
sum(r.item57) as '其他(个) '
from fp_diqu c
left outer join fp_diqu z on z.id=c.zhen_id
left outer join fp_diqu a on a.id=z.area_id
left outer join fp_report r on r.cun_id=c.id
and r.report_type=1
and r.type='month'
and STR_TO_DATE
(
   CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d'
)
>=STR_TO_DATE('2011-12-01','%Y-%m-%d')
and STR_TO_DATE
(
   CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d'
)
<=STR_TO_DATE('2011-12-01','%Y-%m-%d')
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and z.is_ns='N'
and (c.name = '三村村' or c.name='东坑村') 
group by a.name
;