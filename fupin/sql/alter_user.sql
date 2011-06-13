ALTER TABLE fp_user
    ADD COLUMN team_bf_zhen_id bigint,
    ADD COLUMN team_from_area_id bigint,
    ADD COLUMN loginName2 varchar(255),
    ADD COLUMN password2 varchar(255),
    ADD COLUMN isWorkGroup varchar(255),
    ADD COLUMN isDiv varchar(255)
    
ALTER TABLE fp_diqu
	ADD COLUMN team_id bigint
	
UPDATE fp_user
SET isDiv='Y'
WHERE area_id=7

--SELECT id,name
--FROM fp_diqu d 
--WHERE name like '%白云区%'
--
--SELECT id,loginName
--FROM fp_user u
--WHERE u.area_id=7