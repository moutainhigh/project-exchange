package com.throne212.tg.web.action;

import java.lang.reflect.Method;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tg.web.biz.CommonBiz;
import com.throne212.tg.web.common.Util;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.domain.City;
import com.throne212.tg.web.domain.Site;

public class FrontAction extends BaseAction {

	private CommonBiz commonBiz;

	private City city;

	private String method;// 页面参数

	public String execute() {
		if (!Util.isEmpty(method)) {
			Class clazz = this.getClass();
			try {
				Method m = null;
				try {
					m = clazz.getMethod(method);
				} catch (Exception e) {
					//ignore
				}
				if (m != null)
					return (String) m.invoke(this);
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return "success";
	}

	public String selectCity() {
		if (city != null && city.getId() != null) {
			city = commonBiz.getEntityById(City.class, city.getId());
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
		} else {
			ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, null);
		}
		return "index";
	}
	
	private List<Site> siteList;
	public String index() {
		city = (City) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		//获得特定城市的团购网站名称和链接
		siteList = commonBiz.getSiteByCity(city);
		return "success";
	}

	public City getCity() {
		return city;
	}

	public void setCity(City city) {
		this.city = city;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public List<Site> getSiteList() {
		return siteList;
	}

	public void setSiteList(List<Site> siteList) {
		this.siteList = siteList;
	}
}
