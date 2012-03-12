package com.throne212.jianzhi8.action;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.service.HtmlBuildService;

@ParentPackage("basePackage")
public class IndexAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private RegionDAO regionDAO;
	
	@Resource
	private HtmlBuildService htmlBuildService;
	
	//bean参数
	private Region city;

	public String execute(){
		// 获取城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		String htmlFile = HtmlBuildService.getTemplatePath() + "html/"  + cityId + "_index.html";
		if(!new File(htmlFile).exists()){
			logger.warn("index file not extist: " + htmlFile);
			city = regionDAO.findById(cityId);
			htmlBuildService.indexBuildHtml(city);
		}
		return "html/" + cityId + "_index";
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}
	
}
