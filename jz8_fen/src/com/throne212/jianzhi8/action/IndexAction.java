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
	
	private String cid;

	public String execute(){
		// 获取城市
		cid = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		String htmlFile = HtmlBuildService.getTemplatePath() + "html/"  + cid + "_index.html";
		if(!new File(htmlFile).exists()){
			logger.warn("index file not extist: " + htmlFile);
			city = regionDAO.findById(cid);
			htmlBuildService.indexBuildHtml(city);
		}
		return "html";
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}
	
}
