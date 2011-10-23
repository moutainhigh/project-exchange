package com.throne212.jianzhi8.action;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Keywords;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.domain.Region;

//列表页的展示action
public class SearchAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());
	private ViewBiz viewBiz;
	private RegionDAO regionDAO;
	private TypeDAO typeDAO;

	@Autowired
	public void setViewBiz(ViewBiz viewBiz) {
		this.viewBiz = viewBiz;
	}

	@Autowired
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	@Autowired
	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}

	private String kind;

	private String key;

	private Region city;

	private PageBean bean;
	
	private String[] words;

	public String s() {

		// 获取城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);

		int pageIndex = 1;
		if(key != null && key.contains("-")){//页码
			String[] arr = key.split("-");
			key = arr[0];
			pageIndex = Integer.parseInt(arr[1]);
		}
		
		//提出地区和兼职信息
		if(key != null){
			key = key.replaceAll(city.getSimpleName(), "");
			key = key.replaceAll("兼职", "");
		}

		// 全局搜索
		if (kind == null || kind.equals("")) {
			bean = viewBiz.searchContent(key, city.getCityCode(), pageIndex, null);
		}
		// 兼职/全职搜索
		else {
			bean = viewBiz.searchContent(key, city.getCityCode(), pageIndex, kind);
		}
		
		ServletActionContext.getRequest().setAttribute("key", key);
		
		// 获取该省份其他城市
		String cityName = city.getCityName();
		if (cityName != null && cityName.contains(",")) {
			String proName = cityName.split(",")[0];
			province = (Region) regionDAO.findByCityName(proName).get(0);
			cityList = regionDAO.getCityListByProvince(province);
		}
		
		//关键字
		String keywords = Keywords.strkeywords;
		words = keywords.split(",");
		
		return "search";
	}

	private Region province;
	private List<Region> cityList;

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public PageBean getBean() {
		return bean;
	}

	public void setBean(PageBean bean) {
		this.bean = bean;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public ViewBiz getViewBiz() {
		return viewBiz;
	}

	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public Region getProvince() {
		return province;
	}

	public void setProvince(Region province) {
		this.province = province;
	}

	public List<Region> getCityList() {
		return cityList;
	}

	public void setCityList(List<Region> cityList) {
		this.cityList = cityList;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String[] getWords() {
		return words;
	}

	public void setWords(String[] words) {
		this.words = words;
	}

}
