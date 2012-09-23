package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.PeopleSummary;
import com.throne212.fupin.domain.People;


public interface PeopleDao extends BaseDao {

	public PageBean<People> getPeoples(Integer year, Integer pageIndex);
	
	public long getPeopleSubmitCount(Integer year);
	
	public PageBean<PeopleSummary> summary(Integer year,Long areaId, Long zhenId, Long cunId, Integer pageIndex);
	
}
