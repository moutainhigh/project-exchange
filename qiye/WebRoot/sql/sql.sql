CREATE TABLE table0 (
  ba02 varchar2(100)  ,
  ba00 varchar2(100),
  ba01 varchar2(100),
  ba03 varchar2(100),
  ba13 varchar2(100),
  ba16 varchar2(100),
  fuze varchar2(100),
  filler varchar2(100),
  the_date varchar2(100),
  user_id varchar2(100) ,
  PRIMARY KEY (user_id)
) ;

CREATE TABLE table1 (
  ba06 number(11,0) ,
  ba50 number(11,0) ,
  ba60 number(11,0) ,
  ba07 number(11,0) ,
  ba08 number(11,0) ,
  ba18 number(11,0) ,
  is_gaoxin varchar2(10) ,
  rending_time varchar2(10) ,
  zhengshu varchar2(100) ,
  is_yanfa varchar2(10) ,
  yanfa_type varchar2(100) ,
  yanfa_name varchar2(100) ,
  ba20 number(11,0) ,
  ba21 number(11,0) ,
  ba22 number(11,0) ,
  ba23 number(11,0) ,
  d100 number(11,0) ,
  d110 number(11,0) ,
  d120 number(11,0) ,
  e100 number(11,0) ,
  user_id varchar2(255),
  year number(11,0),
  PRIMARY KEY (user_id,year)
);
CREATE TABLE table1_plan (
  piwen varchar2(100) ,
  zhuanti_name varchar2(100) ,
  bianhao varchar2(100) ,
  pro_name varchar2(100) ,
  pro_money number(10,0) ,
  grade varchar2(100) ,
  user_id varchar2(255),
  year number(11,0)
);
CREATE TABLE table2 (
  pe1010 number(11,0) ,
  pe1011 number(11,0) ,
  pe1012 number(11,0) ,
  pe1013 number(11,0) ,
  pe1020 number(11,0) ,
  pe1021 number(11,0) ,
  pa0 number(11,0) ,
  pa1 number(11,0) ,
  pa2 number(11,0) ,
  pa3 number(11,0) ,
  pa4 number(11,0) ,
  pe01 varchar2(100) ,
  pe02 varchar2(100) ,
  pe04 varchar2(100) ,
  pe05 varchar2(100) ,
  user_id varchar2(255),
  year number(11,0),
  PRIMARY KEY (user_id,year)
);
CREATE TABLE table3 (
  fi300 number(11,0) ,
  fi310 number(11,0) ,
  fi100 number(11,0) ,
  fi110 number(11,0) ,
  fi120 number(11,0) ,
  fi130 number(11,0) ,
  fi140 number(11,0) ,
  fi400 number(11,0) ,
  fi200 number(11,0) ,
  fe100 number(11,0) ,
  fe120 number(11,0) ,
  fe122 number(11,0) ,
  fe130 number(11,0) ,
  fe134 number(11,0) ,
  fe132 number(11,0) ,
  fe139 number(11,0) ,
  fe140 number(11,0) ,
  user_id varchar2(255),
  year number(11,0),
  PRIMARY KEY (user_id,year)
);
CREATE TABLE table4 (
  p1 varchar2(255) ,
  p2 number(11,0) ,
  p3 number(11,0) ,
  p4 number(11,0) ,
  p5 number(11,0) ,
  p6 number(11,0) ,
  p7 number(11,0) ,
  p8 number(11,0) ,
  p9 number(11,0) ,
  is_high varchar2(10) ,
  gong_zengjia varchar2(100) ,
  type_no varchar2(100) ,
  lingyu varchar2(100) ,
  user_id varchar2(255),
  year number(11,0)
);










