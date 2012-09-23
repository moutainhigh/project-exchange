package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.PeopleBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.PeopleSummary;
import com.throne212.fupin.dao.PeopleDao;
import com.throne212.fupin.domain.People;
import com.throne212.fupin.domain.PeopleSetting;

public class PeopleBizImpl extends BaseBizImpl implements PeopleBiz {

	private PeopleDao peopleDao;

	public void setPeopleDao(PeopleDao peopleDao) {
		this.peopleDao = peopleDao;
	}

	public PeopleSetting getSettingByYear(int year) {
		return peopleDao.getEntityByUniqueColumn(PeopleSetting.class, "year", year);
	}
	
	public PageBean<People> getPeoples(Integer year, Integer pageIndex){
		return peopleDao.getPeoples(year, pageIndex);
	}
	
	public long getPeopleSubmitCount(Integer year){
		return peopleDao.getPeopleSubmitCount(year);
	}
	
	public PageBean<PeopleSummary> summary(Integer year,Long areaId, Long zhenId, Long cunId, Integer pageIndex){
		return peopleDao.summary(year, areaId, zhenId, cunId, pageIndex);
	}

}
