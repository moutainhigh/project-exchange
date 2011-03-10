package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;

public interface ManagerDao extends BaseDao {

	public PageBean getAllManager(Integer pageIndex);
	
	public PageBean getAllManager(String name,Integer pageIndex);
	
	public PageBean getAllCun(Integer pageIndex);
	
	public PageBean getAllCun(String name,Integer pageIndex);
	
	//贫困户
	public PageBean getAllFamily(Integer pageIndex);
	
	public PageBean getAllFamily(String name,Integer pageIndex);
}
