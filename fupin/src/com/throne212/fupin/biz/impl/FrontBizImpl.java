package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.FrontDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;

public class FrontBizImpl extends BaseBizImpl implements FrontBiz {
	private FrontDao frontDao;

	
	
	public PageBean<Family> getAllFamilyByCunId(Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllFamilyByCunId(cunId,pageIndex);
	}
	
	public PageBean<Cun> getAllCunUnderArea(Long areaId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderArea(areaId,pageIndex);
	}

	public PageBean<Cun> getAllCunUnderShi(Long shiId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderShi(shiId,pageIndex);
	}

	public PageBean<Cun> getAllCunUnderZhen(Long zhenId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderZhen(zhenId,pageIndex);
	}

	public FrontDao getFrontDao() {
		return frontDao;
	}

	public void setFrontDao(FrontDao frontDao) {
		this.frontDao = frontDao;
	}
	
	

}
