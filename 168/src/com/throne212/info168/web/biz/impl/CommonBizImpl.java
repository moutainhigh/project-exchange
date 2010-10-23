package com.throne212.info168.web.biz.impl;

import java.util.List;

import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.dao.AreaDao;
import com.throne212.info168.web.domain.Area;

public class CommonBizImpl extends BaseBizImpl implements CommonBiz {
	
	private AreaDao areaDao;

	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}

	public List<Area> getTopArea() {
		return areaDao.getTopAreas();
	}
	
	public List<Area> get2ndArea(Long parentId){
		Area parent = areaDao.getEntityById(Area.class, parentId);
		if(parent != null){
			return areaDao.get2ndAreas(parent);
		}
		return null;
	}

}
