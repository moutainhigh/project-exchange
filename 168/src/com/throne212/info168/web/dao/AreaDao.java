package com.throne212.info168.web.dao;

import java.util.List;

import com.throne212.info168.web.domain.Area;

public interface AreaDao extends BaseDao{
	public List<Area> getTopAreas();
	public List<Area> get2ndAreas(Area parent);
	public List<Area> getAllCities();
}
