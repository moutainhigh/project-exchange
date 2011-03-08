package com.throne212.fupin.dao;

import java.util.Date;
import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.User;



public interface UserDao extends BaseDao {
	
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,int page,String role);
	public List<User> getUserList(User condition,Date fromDate,Date toDate,String role);


}
