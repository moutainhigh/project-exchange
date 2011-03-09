package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.AreaWorkOrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.UserDao;
import com.throne212.fupin.domain.AreaWorkOrg;

public class AreaWorkOrgBizImpl extends BaseBizImpl implements AreaWorkOrgBiz {
	private UserDao userDao;

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
			baseDao.saveOrUpdate(areaWorkOrg);
			logger.info("添加成功");
		} else {

			baseDao.saveOrUpdate(areaWorkOrg);
			logger.info("更新成功");
		}

		return areaWorkOrg;

	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
