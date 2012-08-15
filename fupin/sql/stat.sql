select
'北部山区',
a.name as '区（县）',
(select count(f2.id) from fp_family f2 left outer join fp_diqu c2 on f2.cun_id=c2.id left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '贫困户数',
(select sum(c2.poorPersonNum) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and c2.diqu_type='cun' and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '贫困人数',
(select sum(c2.poorFamilyNum1) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '1低保对象(户) ',
(select sum(c2.poorPersonNum1) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '1低保对象(人) ',
(select sum(c2.poorFamilyNum3) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '1低收入困难家庭(户) ',
(select sum(c2.poorPersonNum3) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '1低收入困难家庭(人) ',
(select sum(c2.poorFamilyNum2) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '2低保对象(户) ',
(select sum(c2.poorPersonNum2) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '2低保对象(人) ',
(select sum(c2.poorFamilyNum4) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '2低收入困难家庭(户) ',
(select sum(c2.poorPersonNum4) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '2低收入困难家庭(人) ',
(select sum(c2.weiHouse) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '危房户(户) ',
sum(r.item12) as '贫困户去世、失踪等情况(户) ',
(select sum(t2.i13) from ( select r2.item13 as 'i13', a2.id as aid from fp_diqu c2 left outer join fp_diqu z2 on z2.id=c2.zhen_id left outer join fp_diqu a2 on a2.id=z2.area_id left outer join fp_report r2 on r2.cun_id=c2.id and r2.report_type=1 and r2.type='month' and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('2012-4-01','%Y-%m-%d') and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('2012-5-01','%Y-%m-%d') where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' group by a2.name,z2.name,c2.name order by r2.year desc, r2.time desc) t2 where t2.aid=a.id) as '预计本年脱贫户数(户) ',  
(select sum(t2.i14) from ( select r2.item14 as 'i14', a2.id as aid from fp_diqu c2 left outer join fp_diqu z2 on z2.id=c2.zhen_id left outer join fp_diqu a2 on a2.id=z2.area_id left outer join fp_report r2 on r2.cun_id=c2.id and r2.report_type=1 and r2.type='month' and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('2012-4-01','%Y-%m-%d') and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('2012-5-01','%Y-%m-%d') where c2.diqu_type='cun' and z2.diqu_type='zhen' and a2.diqu_type='area' and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' group by a2.name,z2.name,c2.name order by r2.year desc, r2.time desc) t2 where t2.aid=a.id) as '预计本年脱贫户数(户) ',
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
(select sum(c2.income) from fp_diqu c2 left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' ) as '上年村级集体经济收入(元) ',
(select sum(r2.item31) from fp_report r2 left outer join fp_diqu c2 on r2.cun_id=c2.id and r2.report_type=1 and r2.type='month' and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')>=STR_TO_DATE('2012-4-01','%Y-%m-%d') and STR_TO_DATE(CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d')<=STR_TO_DATE('2012-5-01','%Y-%m-%d') left outer join fp_diqu z2 on c2.zhen_id=z2.id left outer join fp_diqu a2 on z2.area_id=a2.id where a2.id=a.id and (z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场' ) and c2.name != '塘田村' and c2.name != '安山村' order by r2.time desc) as '预计今年村级集体经济收入(元) ',
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
>=STR_TO_DATE('2012-4-01','%Y-%m-%d')
and STR_TO_DATE
(
   CONCAT(r.year,'-',r.time,'-01'),'%Y-%m-%d'
)
<=STR_TO_DATE('2012-5-01','%Y-%m-%d')
where c.diqu_type='cun'
and z.diqu_type='zhen'
and a.diqu_type='area'
and
(
   z.name = '温泉镇' or z.name = '吕田镇' or z.name = '良口镇' or z.name = '鳌头镇' or z.name = '小楼镇' or z.name = '正果镇' or z.name = '派潭镇' or z.name = '梯面镇' or z.name = '流溪河林场'
)
and c.name != '塘田村'
and c.name != '安山村'
group by a.name
;