select
sum(the_item13)
from
(
   select
   r2.item13 the_item13, c2.name,r2.time
   from fp_diqu c2
   left outer join fp_report r2 on r2.cun_id=c2.id
   and r2.report_type=1
   and r2.type='month'
   and STR_TO_DATE
   (
      CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d'
   )
   >=STR_TO_DATE('2012-4-01','%Y-%m-%d')
   and STR_TO_DATE
   (
      CONCAT(r2.year,'-',r2.time,'-01'),'%Y-%m-%d'
   )
   <=STR_TO_DATE('2012-5-01','%Y-%m-%d')
   left outer join fp_diqu z2 on c2.zhen_id=z2.id
   left outer join fp_diqu a2 on z2.area_id=a2.id
   where 
   (
      z2.name = '温泉镇' or z2.name = '吕田镇' or z2.name = '良口镇' or z2.name = '鳌头镇' or z2.name = '小楼镇' or z2.name = '正果镇' or z2.name = '派潭镇' or z2.name = '梯面镇' or z2.name = '流溪河林场'
   )
   and c2.name != '塘田村'
   and c2.name != '安山村'
   and a2.id=40 
   order by r2.year desc,r2.time desc
) as the_sum
where 1=1