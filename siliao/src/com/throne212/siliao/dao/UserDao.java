package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.User;



public interface UserDao extends BaseDao {
	
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,int page,String role);
	public List<User> getUserList(User condition,Date fromDate,Date toDate,String role);

}
