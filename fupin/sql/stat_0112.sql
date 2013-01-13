SELECT 
item1 AS f_type,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=5000 AND q2.item4<6000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i56,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=6000 AND q2.item4<7000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i67,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=7000 AND q2.item4<8000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i78,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=8000 AND q2.item4<9000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i89,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=9000 AND q2.item4<10000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i90,
(SELECT COUNT(*) FROM fp_question2 q2 
LEFT OUTER JOIN fp_family f ON f.id=q2.family_id
LEFT OUTER JOIN fp_diqu c ON c.id=f.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
WHERE q2.YEAR=2012 AND q2.item4>=10000 AND q2.item1=q.item1 AND STATUS=1 AND z.is_ns='N') AS i10
FROM fp_question2 q
WHERE q.item1 IN (1,2,3,4)
GROUP BY q.item1
ORDER BY q.item1