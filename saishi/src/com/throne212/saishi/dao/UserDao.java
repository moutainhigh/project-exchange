package com.throne212.saishi.dao;

import java.util.Date;
import java.util.List;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.User;




public interface UserDao extends BaseDao {
	
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,int page,String role,String orderBy,String orderType,int pageSize);

}
