package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.PeopleSummary;
import com.throne212.fupin.domain.People;
import com.throne212.fupin.domain.PeopleSetting;

public interface PeopleBiz extends BaseBiz {

	public PeopleSetting getSettingByYear(int year);
	
	public PageBean<People> getPeoples(Integer year, Integer pageIndex);
	
	public long getPeopleSubmitCount(Integer year);
	
	public PageBean<PeopleSummary> summary(Integer year,Long areaId, Long zhenId, Long cunId, Integer pageIndex);
	
	public PageBean<People> getLockPeoples(Integer year, Integer pageIndex);
	
}