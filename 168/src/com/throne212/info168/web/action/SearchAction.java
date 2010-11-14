package com.throne212.info168.web.action;

import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Info;

public class SearchAction extends BaseAction {

	// 列表和搜索页面
	private String catePinyin;// 栏目
	private String keywords;// 关键字
	private Integer page;// 页码
	private PageBean<Info> pageBean;// 分页bean

	private InfoBiz infoBiz;
	private CommonBiz commonBiz;

	public String execute() {
		logger.info("搜索关键字：" + keywords);
		if (!Util.isEmpty(keywords)) {
			if (page == null || page < 1)
				page = 1;
			if (Util.isEmpty(catePinyin))
				pageBean = infoBiz.getInfoByKey(keywords, page);
			else {
				Category cate = commonBiz.getEntityByUnique(Category.class, "pinyin", catePinyin);
				pageBean = infoBiz.getInfoByCateKeywords(cate.getId(), keywords, page);
			}
			return "success";
		} else {
			logger.info("搜索关键字为空");
			return "index";
		}
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public PageBean<Info> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Info> pageBean) {
		this.pageBean = pageBean;
	}

	public InfoBiz getInfoBiz() {
		return infoBiz;
	}

	public void setInfoBiz(InfoBiz infoBiz) {
		this.infoBiz = infoBiz;
	}

	public String getCatePinyin() {
		return catePinyin;
	}

	public void setCatePinyin(String catePinyin) {
		this.catePinyin = catePinyin;
	}

	public CommonBiz getCommonBiz() {
		return commonBiz;
	}

	public void setCommonBiz(CommonBiz commonBiz) {
		this.commonBiz = commonBiz;
	}

}
