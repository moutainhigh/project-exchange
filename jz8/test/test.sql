select ct_no,ct_title,left(ct_content,45),ct_update,ct_type_id,ct_type_name
from content_tab
where ct_ischeck <> '0' and ct_city_id=0100
order by ct_update desc
limit 0,30

select ct_no,ct_title,left(ct_content,45) as sim_con,ct_update,ct_type_name,ct_type_id,ct_ispay,ct_isyz
 from content_tab
 where ct_ischeck <> '0' and ct_city_id=1201 and ct_kind=1
 order by ct_ispay desc, ct_isyz desc, ct_update desc