package com.throne212.auto.dao;

import java.util.List;

import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;


public interface UserDao extends BaseDao{

	public User getUserByLoginName(String loginName);
	
	public List<Sale> getSaleList(int first,int max,String key);
	public long getSaleListCount(String key);
	
}
