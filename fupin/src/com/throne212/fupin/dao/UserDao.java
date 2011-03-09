package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;



public interface UserDao extends BaseDao {
	//市级账号管理
	public PageBean<ShiWorkOrg> getShiWorkOrgList(int page);
	
	//区县级账号管理
	public PageBean<AreaWorkOrg> getAreaWorkOrgList(int page,Long shiWorkOrgId);

}
