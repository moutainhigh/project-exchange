package com.throne212.jianzhi8.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Region;

public class DefaultAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	//资源
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	
	//参数
	private String parentCityCode;
	
	//数据
	private List<Region> hotCityList;
	private List<Region> provinceList;
	private Region province;
	private List<Region> childCityList;

	public String execute(){
		if(!Util.isEmpty(parentCityCode)){//某个省份
			List<Region> cList = regionDAO.findByCityCode(parentCityCode);
			if(cList != null && cList.size() > 0){
				province = cList.get(0);
				childCityList = regionDAO.getCityListByProvince(province);
			}
		}
		hotCityList = regionDAOJDBC.getHotCities();
		provinceList = regionDAOJDBC.getProCityList();
		return "select_city";
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	public RegionDAOJDBC getRegionDAOJDBC() {
		return regionDAOJDBC;
	}

	public void setRegionDAOJDBC(RegionDAOJDBC regionDAOJDBC) {
		this.regionDAOJDBC = regionDAOJDBC;
	}

	public String getParentCityCode() {
		return parentCityCode;
	}

	public void setParentCityCode(String parentCityCode) {
		this.parentCityCode = parentCityCode;
	}

	public List<Region> getHotCityList() {
		return hotCityList;
	}

	public void setHotCityList(List<Region> hotCityList) {
		this.hotCityList = hotCityList;
	}

	public List<Region> getProvinceList() {
		return provinceList;
	}

	public void setProvinceList(List<Region> provinceList) {
		this.provinceList = provinceList;
	}

	public Region getProvince() {
		return province;
	}

	public void setProvince(Region province) {
		this.province = province;
	}

	public List<Region> getChildCityList() {
		return childCityList;
	}

	public void setChildCityList(List<Region> childCityList) {
		this.childCityList = childCityList;
	}

}
