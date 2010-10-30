package com.throne212.info168.web.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Info;

public class InfoAction extends BaseAction {
	
	//单独页面，如注册、登录等
	private String pageName;
	
	//列表和搜索页面
	private Long cateId;// 栏目id
	private Long areaId;// 地区id
	private String keywords;// 关键字
	private Integer page;// 页码
	private PageBean<Info> pageBean;//分页bean
	
	private Category cate;// 栏目
	
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

	private CommonBiz commonBiz;
	private InfoBiz infoBiz;

	public String list() {
		if (cateId != null)
			cate = commonBiz.getEntityById(Category.class, cateId);
		if (page == null || page < 1)
			page = 1;
		if (!Util.isEmpty(keywords))
			pageBean = infoBiz.getInfoByCateKeywords(cateId, keywords, page);
		else
			pageBean = infoBiz.getInfoByCate(cateId, page);
		return "list";
	}

	// 页面详情
	private Long infoId;//
	private Info info;// 信息

	public String page() {
		info = infoBiz.getEntityById(Info.class, infoId);
		return "page";
	}

	// setter and getter

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

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
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

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Long getInfoId() {
		return infoId;
	}

	public void setInfoId(Long infoId) {
		this.infoId = infoId;
	}

	public Info getInfo() {
		return info;
	}

	public void setInfo(Info info) {
		this.info = info;
	}

}
