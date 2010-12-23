package com.throne212.info168.web.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.CommonBiz;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.Util;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Category;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.KeyWordSetting;

public class InfoAction extends BaseAction {

	private String cityPinyin;
	private String catePinyin;

	// 列表和搜索页面
	private String keywords;// 关键字
	private Integer page;// 页码
	private PageBean<Info> pageBean;// 分页bean

	// 页面详情
	private Long infoId;//
	private Info info;// 信息

	private Category cate;// 栏目
	private CommonBiz commonBiz;
	private InfoBiz infoBiz;

	public String execute() {
		if (!Util.isEmpty(cityPinyin) && Util.isEmpty(catePinyin)) {// 访问城市首页
			if (!"all".equals(cityPinyin)) {
				Area city = commonBiz.getEntityByUnique(Area.class, "pinyin", cityPinyin);
				ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
			}else{
				ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, null);
			}
			return "index";
		} else if (!Util.isEmpty(cityPinyin) && !Util.isEmpty(catePinyin)) {// 访问栏目列表页
			Area city = null;
			if (!"all".equals(cityPinyin)) {
				city = commonBiz.getEntityByUnique(Area.class, "pinyin", cityPinyin);
				if (city != null && city.getParent() != null && city.getParent().getParent() == null)
					ActionContext.getContext().getSession().put(WebConstants.SESS_CITY, city);
			}
			cate = commonBiz.getEntityByUnique(Category.class, "pinyin", catePinyin);
			if (infoId == null) {// 列表页面
				return list(city);
			} else {// 详细页面
				return page();
			}
		}
		return "success";
	}

	//城市的区域
	private List<Area> areaInCity;
	
	//置顶信息
	private List<Info> topInfoList;

	public String list(Area city) {
		if (page == null || page < 1)
			page = 1;
		pageBean = infoBiz.getInfoByCateArea(cate.getId(), page, city);
		topInfoList = infoBiz.getTopInfos(cate);
		if(city == null)
			city = (Area) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		if (city != null) {//某个城市的区县
			areaInCity = commonBiz.get2ndArea(city.getId());
		}else{//全国
			areaInCity = commonBiz.get2ndArea(-1L);
		}
		return "list";
	}

	private List<Info> relateInfos;

	public String page() {
		info = infoBiz.getEntityById(Info.class, infoId);
		replaceKeywords();
		relateInfos = infoBiz.getRelateInfos(info);
		return "page";
	}
	
	private void replaceKeywords(){
		String appPath = (String) ActionContext.getContext().getApplication().get(WebConstants.APP_PATH);
		String content = info.getContent();
		List<KeyWordSetting> keywords = (List<KeyWordSetting>) ActionContext.getContext().getApplication().get(WebConstants.KEY_WORD_LIST);
		for (KeyWordSetting key : keywords) {
			content = content.replaceAll(key.getName(), "<a target='_blank' href='" + appPath + "/search/" + key.getName() + "/'>" + key.getName() + "</a>");
		}
		info.setContent(content);
	}

	// setter and getter

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

	public static void main(String[] args) {
		String str = "aewf/wef";
		System.out.println(str.split("/")[1]);
	}

	public String getCityPinyin() {
		return cityPinyin;
	}

	public void setCityPinyin(String cityPinyin) {
		this.cityPinyin = cityPinyin;
	}

	public String getCatePinyin() {
		return catePinyin;
	}

	public void setCatePinyin(String catePinyin) {
		this.catePinyin = catePinyin;
	}

	public List<Info> getRelateInfos() {
		return relateInfos;
	}

	public void setRelateInfos(List<Info> relateInfos) {
		this.relateInfos = relateInfos;
	}

	public List<Area> getAreaInCity() {
		return areaInCity;
	}

	public void setAreaInCity(List<Area> areaInCity) {
		this.areaInCity = areaInCity;
	}

	public List<Info> getTopInfoList() {
		return topInfoList;
	}

	public void setTopInfoList(List<Info> topInfoList) {
		this.topInfoList = topInfoList;
	}

}
