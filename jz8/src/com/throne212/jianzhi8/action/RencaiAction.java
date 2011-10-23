package com.throne212.jianzhi8.action;

import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.domain.Region;

//列表页的展示action
public class RencaiAction extends ActionSupport {

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

	private String listType;

	private String typeId;

	private String ctClass;

	private Region city;

	private PageBean bean;

	private Integer navIndex;

	public String rencai() {
		
		String actionName = ActionContext.getContext().getName();
		if(!"".equals(actionName) && actionName.contains("/") && !"rencai".equals(actionName)){
			return "404";
		}

		navIndex = 4;

		// 获取城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);

		int pageIndex = 1;

		// 全部
		if (listType == null || "".equals(listType) 
				|| listType.contains("cp") 
				|| (listType.contains("K") && !listType.contains("c0") && !listType.contains("c1"))) {
			if (listType != null && listType.contains("p")) {// 分页
				pageIndex = Integer.parseInt(listType.substring(listType.indexOf("p") + 1));
			}
			if (listType != null && listType.contains("K")) {// 包含了分类
				typeId = listType.substring(0, 3);
				ServletActionContext.getRequest().setAttribute("typeId", typeId);
			}
			bean = viewBiz.listContent("0", null, city.getCityCode(), typeId, pageIndex);
		}
		// 兼职
		if (listType != null && listType.contains("c0")) {
			if (listType.contains("p")) {// 分页
				pageIndex = Integer.parseInt(listType.substring(listType.indexOf("p") + 1));
			}
			if (listType.contains("K")) {// 包含了分类
				typeId = listType.substring(0, 3);
				ServletActionContext.getRequest().setAttribute("typeId", typeId);
			}
			bean = viewBiz.listContent("0", "0", city.getCityCode(), typeId, pageIndex);
			ctClass = "0";
		}
		// 全职
		if (listType != null && listType.contains("c1")) {
			if (listType.contains("p")) {// 分页
				pageIndex = Integer.parseInt(listType.substring(listType.indexOf("p") + 1));
			}
			if (listType.contains("K")) {// 包含了分类
				typeId = listType.substring(0, 3);
				ServletActionContext.getRequest().setAttribute("typeId", typeId);
			}
			bean = viewBiz.listContent("0", "1", city.getCityCode(), typeId, pageIndex);
			ctClass = "1";
		}
		ServletActionContext.getRequest().setAttribute("ctClass", ctClass);

		// 获取该省份其他城市
		String cityName = city.getCityName();
		if (cityName != null && cityName.contains(",")) {
			String proName = cityName.split(",")[0];
			province = (Region) regionDAO.findByCityName(proName).get(0);
			cityList = regionDAO.getCityListByProvince(province);
		}

		return "list_rencai";
	}

	private Region province;
	private List<Region> cityList;

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
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

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
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

	public String getCtClass() {
		return ctClass;
	}

	public void setCtClass(String ctClass) {
		this.ctClass = ctClass;
	}

	public Integer getNavIndex() {
		return navIndex;
	}

	public void setNavIndex(Integer navIndex) {
		this.navIndex = navIndex;
	}

}
