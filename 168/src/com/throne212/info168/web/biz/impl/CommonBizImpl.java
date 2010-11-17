package com.throne212.info168.web.biz.impl;

import java.text.Collator;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TreeMap;

import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.dao.AreaDao;
import com.throne212.info168.web.dao.CateDao;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Setting;

public class CommonBizImpl extends BaseBizImpl implements CommonBiz {

	private AreaDao areaDao;
	private CateDao cateDao;

	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}

	public void setCateDao(CateDao cateDao) {
		this.cateDao = cateDao;
	}

	public List<Area> getTopArea() {
		return areaDao.getTopAreas();
	}
	
	public List<Area> get2ndArea(Long parentId) {
		Area parent = areaDao.getEntityById(Area.class, parentId);
		if (parent != null) {
			return areaDao.get2ndAreas(parent);
		}
		return null;
	}

	public Map<String, List<Area>> getAreaMap() {
		Map<String, List<Area>> map = new TreeMap<String, List<Area>>(new Comparator<String>() {
			public int compare(String a1, String a2) {
				return Collator.getInstance(Locale.CHINESE).compare(a1, a2);
			}
		});
		List<Area> topAreaList = this.getTopArea();
		for (Area a : topAreaList) {
			List<Area> children = this.get2ndArea(a.getId());
			map.put(a.getName(), children);
		}
		return map;
	}

	public List<Category> getCate1() {
		return cateDao.getTopCates();
	}

	public List<Category> getCate2(Long parentId) {
		Category parent = cateDao.getEntityById(Category.class, parentId);
		if (parent != null) {
			return cateDao.get2ndCates(parent);
		}
		return null;
	}

	public Map<String, List<Object[]>> getAllCitiesByPinyin() {
		Map<String, List<Object[]>> map = new TreeMap<String, List<Object[]>>(new Comparator<String>() {
			public int compare(String o1, String o2) {
				return Collator.getInstance(Locale.CHINESE).compare(o1, o2);
			}
		});
		List<Area> cityList = areaDao.getAllCities();
		for (Area c : cityList) {
			if (c.getPinyin() == null || c.getPinyin().length() == 0)
				continue;
			Object[] arr = new Object[] { c.getId(), c.getName(), c.getPinyin() };
			String p = (c.getPinyin().charAt(0) + "").toUpperCase();
			if (map.get(p) == null) {
				map.put(p, new ArrayList<Object[]>());
			}
			map.get(p).add(arr);
		}
		return map;
	}
	public List getSetting(Class clazz){
		return baseDao.getAll(clazz, "listorder", "asc");
	}

	// 获取栏目数据
	public List<Category> getCates() {
		return cateDao.getAllCates();
	}
	
	public List<Area> getSuggCities(String name){
		return areaDao.getSuggCities(name);
	}

}
