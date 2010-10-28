package com.throne212.info168.web.action;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;

//所有Action的基础类
public class BaseAction {
	protected Logger logger = Logger.getLogger(this.getClass());
	protected String msg;// 错误提示信息

	private CommonBiz commonBiz;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	// 执行方法
	private String pageName;

	public String execute() {
		//城市拼音数据缓存
		Map map = (Map) ActionContext.getContext().getApplication().get(WebConstants.CITY_BY_PINYIN);
		if (map == null) {
			map = commonBiz.getAllCitiesByPinyin();
			ActionContext.getContext().getApplication().put(WebConstants.CITY_BY_PINYIN, map);
		}
		//栏目数据缓存
		List allCates = (List) ActionContext.getContext().getApplication().get(WebConstants.ALL_CATES);
		if (allCates == null) {
			allCates = commonBiz.getCates();
			ActionContext.getContext().getApplication().put(WebConstants.ALL_CATES, allCates);
		}
		//选取城市
		if(!Util.isEmpty(pageName) && pageName.matches("city_\\D+_\\d+")){
			String[] arr = pageName.split("_");
			String pinyin = arr[1];
			String idStr = arr[2];
			Area area = commonBiz.getEntityById(Area.class, Long.parseLong(idStr));
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, area);
			return "index";
		}
		return "success";
	}

	
	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

}
