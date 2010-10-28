package com.throne212.info168.web.action;

import com.throne212.info168.web.biz.CommonBiz;

public class InfoAction extends BaseAction {

	private Long cateId;// 栏目id
	private Long areaId;// 地区id
	private String keywords;// 关键字

	private CommonBiz commonBiz;

	public String list() {
		return "list";
	}

	public Long getCateId() {
		return cateId;
	}

	public void setCateId(Long cateId) {
		this.cateId = cateId;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

}
