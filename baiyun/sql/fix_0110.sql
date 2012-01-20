delete from fp_user
where zhenWorkOrg_id = 612

update fp_project_stat
set money=0
where money is not null and money<>'' and money NOT REGEXP '[0-9]'