package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.ZijinBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ZijinDao;
import com.throne212.fupin.domain.Zijin;

public class ZijinBizImpl extends BaseBizImpl implements ZijinBiz {
	
	private ZijinDao zijinDao;
	
	public ZijinDao getZijinDao() {
		return zijinDao;
	}

	public void setZijinDao(ZijinDao zijinDao) {
		this.zijinDao = zijinDao;
	}

	public PageBean<Zijin> listZijin(Long areaId, Long zhenId, Long cunId, Integer pageIndex, int type, int year, int month) {
		return zijinDao.listZijin(areaId, zhenId, cunId, pageIndex, type, year, month);
	}

}
