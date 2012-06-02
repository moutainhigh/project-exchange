package com.throne212.jianzhi8.action;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.domain.Region;

public class SearchAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// 资源
	@Resource
	private ContentDAO contentDAO;

	// 参数
	private String paramCityId;// bj,haidian
	private String paramPageNum;// page的数字，如：p2
	private String paramKey;// 关键词

	// 数据
	private Integer pageIndex;
	private PageBean bean;
	private Region city;

	public String execute() {
		logger.debug("searching...");
		if(Util.isEmpty(paramCityId)){
			return "404";
		}
		city = Parameter.citymap_py.get(paramCityId);
		// 页码
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1){
			String pageNum = paramPageNum.replaceAll("\\D", "").trim();
			pageIndex = Integer.parseInt(pageNum);
		}else{
			pageIndex = 1;
		}
		bean = contentDAO.searchContent(paramCityId,paramKey,pageIndex,30);
		return "list_search";
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public ContentDAO getContentDAO() {
		return contentDAO;
	}

	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}

	public String getParamCityId() {
		return paramCityId;
	}

	public void setParamCityId(String paramCityId) {
		this.paramCityId = paramCityId;
	}

	public String getParamPageNum() {
		return paramPageNum;
	}

	public void setParamPageNum(String paramPageNum) {
		this.paramPageNum = paramPageNum;
	}

	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public PageBean getBean() {
		return bean;
	}

	public void setBean(PageBean bean) {
		this.bean = bean;
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

}
