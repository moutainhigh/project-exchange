SELECT 
item1 AS f_type,SUM(item5+item6+item10+item17-item24) / SUM(item2)
FROM fp_question2 q
LEFT OUTER JOIN fp_family f ON f.id=q.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q.item1 IN (1,2,3,4) AND z.is_ns='N' AND q.YEAR=2012 AND STATUS=1
GROUP BY q.item1
ORDER BY q.item1


SELECT
a2.NAME,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21>=280000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i28_shang,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21<280000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i28_xia
FROM fp_question1 q
LEFT OUTER JOIN fp_diqu c2 ON c2.id=q.cun_id AND c2.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z2 ON z2.id=c2.zhen_id AND z2.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a2 ON a2.id=z2.area_id AND a2.diqu_type='area'
WHERE a2.NAME IN ('增城市','从化市') AND q.STATUS=1
GROUP BY a2.NAME
