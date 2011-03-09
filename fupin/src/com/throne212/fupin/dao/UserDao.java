package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.ZhenWorkOrg;



public interface UserDao extends BaseDao {
	//市级账号管理
	public PageBean<ShiWorkOrg> getShiWorkOrgList(int page);
	
	//区县级账号管理
	public PageBean<AreaWorkOrg> getAreaWorkOrgList(int page,Long shiWorkOrgId);
	public PageBean<AreaWorkOrg> getAreaWorkOrgList(int page);
	
	//镇级账号管理
	public PageBean<ZhenWorkOrg> getZhenWorkOrgList(int page,Long areaWorkOrgId);
	public PageBean<ZhenWorkOrg> getZhenWorkOrgList(int page);
}
