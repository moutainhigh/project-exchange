package com.throne212.fupin.biz.impl;


import java.util.ArrayList;
import java.util.List;

import com.throne212.fupin.biz.ZhenBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ZhenDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;


public class ZhenBFBizImpl extends BaseBizImpl implements ZhenBFBiz {
	
	private ZhenDao zhenDao;
	
	public ZhenDao getZhenDao() {
		return zhenDao;
	}

	public void setZhenDao(ZhenDao zhenDao) {
		this.zhenDao = zhenDao;
	}

	public List getShiAndAreaAccounts(){
		List list = new ArrayList();
		list.addAll(zhenDao.getAll(ShiWorkOrg.class));
		list.addAll(zhenDao.getAll(AreaWorkOrg.class));
		return list;
	}
	public List getShiAndArea(){
		List list = new ArrayList();
		list.addAll(zhenDao.getAll(Shi.class));
		list.addAll(zhenDao.getAll(Area.class));
		return list;
	}
	public List getAllArea(){
		return zhenDao.getAll(Area.class);
	}
	public PageBean<Zhen> getAllZhen(Long areaId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		Area area = null;
		if(areaId != null)
			area = zhenDao.getEntityById(Area.class, areaId);
		return zhenDao.getAllZhen(area,pageIndex);
	}
	
}
