package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class AdminBizImpl extends BaseBizImpl implements AdminBiz {
	private UserDao userDao;
		//市级
	public PageBean<ShiWorkOrg> getShiWorkOrgBean(Integer page) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getShiWorkOrgList(pageIndex);
	}

	public ShiWorkOrg saveOrUpdateShiWorkOrg(ShiWorkOrg shiWorkOrg) {
		if (shiWorkOrg.getId() == null) {
			shiWorkOrg.setCreateDate(new Date());
			userDao.saveOrUpdate(shiWorkOrg);
			logger.info("添加成功");
		} else {
			ShiWorkOrg objInDB = userDao.getEntityById(ShiWorkOrg.class, shiWorkOrg.getId());
			objInDB.setShi(shiWorkOrg.getShi());
			objInDB.setPassword(shiWorkOrg.getPassword());
			objInDB.setRemark(shiWorkOrg.getRemark());
			userDao.saveOrUpdate(objInDB);
			logger.info("更新成功");
		}
		return shiWorkOrg;
	}
	//区级
	public PageBean<AreaWorkOrg> getAreaWorkOrgBean(Integer page, Long shiWorkOrgId) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getAreaWorkOrgList(pageIndex, shiWorkOrgId);
	}

	public AreaWorkOrg saveOrUpdateAreaWorkOrg(AreaWorkOrg areaWorkOrg) {

		if (areaWorkOrg.getId() == null) {
			areaWorkOrg.setCreateDate(new Date());
			userDao.saveOrUpdate(areaWorkOrg);
			logger.info("添加成功");
		} else {
			userDao.saveOrUpdate(areaWorkOrg);
			logger.info("更新成功");
		}
		return areaWorkOrg;
	}
	
	public PageBean<AreaWorkOrg> getAreaWorkOrgBean(Integer page){
		
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getAreaWorkOrgList(pageIndex);
		
	}
	
	
	//镇级
	public PageBean<ZhenWorkOrg> getZhenWorkOrgBean(Integer page,Long areaWorkOrgId){
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getZhenWorkOrgList(pageIndex, areaWorkOrgId);
		
		
	}
	public ZhenWorkOrg saveOrUpdateZhenWorkOrg(ZhenWorkOrg zhenWorkOrg){

		if (zhenWorkOrg.getId() == null) {
			zhenWorkOrg.setCreateDate(new Date());
			userDao.saveOrUpdate(zhenWorkOrg);
			logger.info("添加成功");
		} else {
			userDao.saveOrUpdate(zhenWorkOrg);
			logger.info("更新成功");
		}
		return zhenWorkOrg;
		
	}
	
	public PageBean<ZhenWorkOrg> getZhenWorkOrgBean(Integer page){
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getZhenWorkOrgList(pageIndex);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
