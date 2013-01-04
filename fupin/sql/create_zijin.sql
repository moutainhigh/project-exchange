create table fp_zijin
(
`id` bigint primary key,
`cun_id` bigint references fp_diqu.id,
`type` int,
`year` int,
`month` int,
`status` int
);

create table fp_zijin_item
(
`id` bigint primary key,
`file` varchar(100),
`content` varchar(1000),
`zijin_id` bigint references fp_zijin.id,
`the_index` int,
item1 decimal(10,2),
item2 decimal(10,2),
item3 decimal(10,2),
item4 decimal(10,2),
item5 decimal(10,2),
item6 decimal(10,2),
item7 decimal(10,2),
item8 decimal(10,2),
item9 decimal(10,2),
item10 decimal(10,2),
item11 decimal(10,2),
item12 decimal(10,2),
item13 decimal(10,2),
item14 decimal(10,2),
item15 decimal(10,2),
item16 decimal(10,2),
item17 decimal(10,2),
item18 decimal(10,2),
item19 decimal(10,2),
item20 decimal(10,2),
item21 decimal(10,2),
item22 decimal(10,2),
item23 decimal(10,2),
item24 decimal(10,2),
item25 decimal(10,2),
item26 decimal(10,2),
item27 decimal(10,2),
item28 decimal(10,2),
item29 decimal(10,2),
item30 decimal(10,2)
)
    
