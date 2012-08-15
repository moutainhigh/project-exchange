select sum(t.i13)
from(
select
distinct c.id as 'cun_id',
a.name as '区（县）',
z.name as '镇名称',
c.name as '村名称',
sum(r.item13) as '预计本年脱贫户数(户)sum ',
r.item13 as '预计本年脱贫户数(户) ',
r.item13 as 'i13',
r.item14 as '预计本年脱贫人数(人) '
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
and a.name='从化市'
group by a.name,z.name,c.name
order by r.year desc, r.time desc
) t