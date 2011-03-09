package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.ShiWorkOrg;

public class AdminBizImpl extends BaseBizImpl implements AdminBiz {
	private UserDao userDao;

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
			baseDao.saveOrUpdate(shiWorkOrg);
			logger.info("添加成功");
		} else {
			ShiWorkOrg objInDB = userDao.getEntityById(ShiWorkOrg.class, shiWorkOrg.getId());
			objInDB.setShi(shiWorkOrg.getShi());
			objInDB.setPassword(shiWorkOrg.getPassword());
			objInDB.setRemark(shiWorkOrg.getRemark());
			baseDao.saveOrUpdate(objInDB);
			logger.info("更新成功");
		}
		return shiWorkOrg;

	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
