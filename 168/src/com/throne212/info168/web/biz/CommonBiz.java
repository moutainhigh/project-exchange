package com.throne212.info168.web.biz;

import java.util.List;
import java.util.Map;

import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;

public interface CommonBiz extends BaseBiz{

	public List<Area> getTopArea();
	public List<Area> get2ndArea(Long parentId);
	public Map<String,List<Area>> getAreaMap();
	
	public List<Category> getCate1();
	public List<Category> getCate2(Long parentId);
	
	public Map<String,List<Object[]>> getAllCitiesByPinyin();
	
}
