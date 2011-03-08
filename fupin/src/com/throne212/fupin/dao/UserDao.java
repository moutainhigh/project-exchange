package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ShiWorkOrg;



public interface UserDao extends BaseDao {
	
	public PageBean<ShiWorkOrg> getShiWorkOrgList(int page);
	

}
