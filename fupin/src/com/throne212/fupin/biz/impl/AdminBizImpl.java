package com.throne212.fupin.biz.impl;

import java.util.Date;
import java.util.List;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.WorkTeam;
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
			objInDB.setSegment1(shiWorkOrg.getSegment1());
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
	
	public List<ZhenWorkOrg> getZhenWorkOrgList(Long areaWorkOrgId){
		return userDao.getZhenWorkOrgList(areaWorkOrgId);
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
	
	public List<Cun> getCunListByLike(String pinyin){
		return baseDao.getAllLike(Cun.class, "pinyin", pinyin);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public void deleteTeam(Long teamId){
		List<Cun> cunList = userDao.getEntitiesByColumn(Cun.class, "team.id", teamId);
		if(cunList != null && cunList.size()>0 ){
			for(Cun cun : cunList){
				cun.setTeam(null);
				userDao.saveOrUpdate(cun);
			}
		}
		userDao.deleteById(WorkTeam.class, teamId);
	}

}
