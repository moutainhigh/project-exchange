package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.DiquBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.DiquDao;
import com.throne212.fupin.domain.Diqu;


public class DiquBizImpl extends BaseBizImpl implements DiquBiz {
	
	private DiquDao diquDao;

	public DiquDao getDiquDao() {
		return diquDao;
	}

	public void setDiquDao(DiquDao diquDao) {
		this.diquDao = diquDao;
	}

	public PageBean getAllDiqu(Integer pageIndex) {
		// TODO Auto-generated method stub
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return diquDao.getAllDiqu(pageIndex);
	}

	public PageBean getAllDiqu(String type, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return diquDao.getAllDiqu(type, pageIndex);
	}

	public PageBean getAllDiquByName(String name, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return diquDao.getAllDiquByName(name,pageIndex);
	}
	
	public Diqu saveDiqu(Diqu diqu){
		if (diqu.getId() == null) {
			diqu.setCreateDate(new Date());
			baseDao.saveOrUpdate(diqu);
			logger.info("添加地区【" + diqu.getName() + "】成功");
		} else {
			Diqu diquInDB = baseDao.getEntityById(Diqu.class, diqu.getId());
			diquInDB.setName(diqu.getName());
			baseDao.saveOrUpdate(diquInDB);
			logger.info("更新地区【" + diqu.getName()+ "】成功");
		}
		return diqu;
	}
	
}
