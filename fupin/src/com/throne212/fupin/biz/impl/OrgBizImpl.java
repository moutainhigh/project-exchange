package com.throne212.fupin.biz.impl;


import java.util.Date;
import java.util.List;

import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.dao.ManagerDao;
import com.throne212.fupin.domain.Org;


public class OrgBizImpl extends BaseBizImpl implements OrgBiz {
	
	private ManagerDao managerDao;
	

	public ManagerDao getManagerDao() {
		return managerDao;
	}

	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}

	public Org saveOrUpdateOrg(Org org){
		
		if (org.getId() == null) {
			org.setCreateDate(new Date());
			baseDao.saveOrUpdate(org);
			logger.info("添加扶贫单位【" + org.getOrgName() + "】成功");
		} else {
			Org orgInDB = baseDao.getEntityById(Org.class, org.getId());
			org.setCreateDate(orgInDB.getCreateDate());
			baseDao.saveOrUpdate(org);
			logger.info("更新扶贫单位【" + org.getOrgName()+ "】成功");
		}
		return org;
		
		
	}
	
	public PageBean getAllOrg(String name,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(Util.isEmpty(name))
			return managerDao.getAllManager(pageIndex);
		else
			return managerDao.getAllManager(name, pageIndex);
	}
	
	public PageBean getAllCun(String name,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(Util.isEmpty(name))
			return managerDao.getAllCun(pageIndex);
		else
			return managerDao.getAllCun(name, pageIndex);
	}
	
	public List getAllOrg(){
		return managerDao.getAll(Org.class);
	}
	
	public PageBean getAllFamily(String name,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(Util.isEmpty(name))
			return managerDao.getAllFamily(pageIndex);
		else
			return managerDao.getAllFamily(name, pageIndex);
	}
	
	public PageBean getAllLeader(Org org,String name,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		if(Util.isEmpty(name))
			return managerDao.getAllLeader(org.getId(),pageIndex);
		else
			return managerDao.getAllLeader(org.getId(), name, pageIndex);
	}

}
