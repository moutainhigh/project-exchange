package com.throne212.info168.web.biz;

import java.util.List;

import com.throne212.info168.web.domain.Area;

public interface CommonBiz extends BaseBiz{

	public List<Area> getTopArea();
	public List<Area> get2ndArea(Long parentId);
	
}
