SELECT
a2.NAME,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21>=200000 AND q1.item21<=300000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i23,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21>300000 AND q1.item21<=400000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i34,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21>400000 AND q1.item21<=500000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i45,
(SELECT COUNT(cun_id) FROM fp_question1 q1 
LEFT OUTER JOIN fp_diqu c ON c.id=q1.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE q1.YEAR=2012 AND q1.item21>500000 AND a.id=a2.id AND q1.STATUS=1 AND z.is_ns='N') AS i50
FROM fp_question1 q
LEFT OUTER JOIN fp_diqu c2 ON c2.id=q.cun_id AND c2.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z2 ON z2.id=c2.zhen_id AND z2.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a2 ON a2.id=z2.area_id AND a2.diqu_type='area'
WHERE a2.NAME IN ('增城市','从化市')
GROUP BY a2.NAME

SELECT COUNT(q.cun_id),a.NAME
FROM fp_question1 q
LEFT OUTER JOIN fp_diqu c ON c.id=q.cun_id AND c.diqu_type='cun'
LEFT OUTER JOIN fp_diqu z ON z.id=c.zhen_id AND z.diqu_type='zhen'
LEFT OUTER JOIN fp_diqu a ON a.id=z.area_id AND a.diqu_type='area'
WHERE item21>500000 AND
	YEAR=2012 AND 
	STATUS=1 AND 
	z.is_ns='N'
GROUP BY a.NAME
	