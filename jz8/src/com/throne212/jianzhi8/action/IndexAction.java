package com.throne212.jianzhi8.action;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.LinkDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.Link;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.domain.User;

public class IndexAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());
	private ViewBiz viewBiz;
	private TypeDAO typeDAO;
	private UserDAO userDAO;
	private RegionDAO regionDAO;
	private ContentDAO contentDAO;
	private LinkDAO linkDAO;

	@Autowired
	public void setViewBiz(ViewBiz viewBiz) {
		this.viewBiz = viewBiz;
	}

	@Autowired
	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}
	
	@Autowired
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}
	
	@Autowired
	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}
	
	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	@Autowired
	public void setLinkDAO(LinkDAO linkDAO) {
		this.linkDAO = linkDAO;
	}

	// 参数
	private Integer ctNo;
	private Content c;
	private Type t;
	private String ctClass;
	private String ctClassLink;
	private String kind;
	private User user;
	private Region city;
	
	private String typeNames;
	
	private Region province;//省份
	private List<Region> cityList;//本身其他城市
	private List<Link> linkList;//友情链接
	private List<Content> latestList;//最新的兼职招聘信息
	private Object[][] items = new Object[6][2];//6个板块
	
	private List<Content> latestRencaiList;//最新的个人简历
	
	//当前所在城市，和当前信息所在分类的最新10条招聘信息
	private List<Content> moreList;
	
	private Integer navIndex;

	public String index() throws Exception {
		
		String actionName = ActionContext.getContext().getName();
		if(!"".equals(actionName) && !"index".equals(actionName)){
			return "404";
		}
		
		//导航的索引值
		navIndex = 0;
		
		// 获取城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);
		
		// 获取该省份其他城市
		String cityName = city.getCityName();
		if (cityName != null && cityName.contains(",")) {
			String proName = cityName.split(",")[0];
			province = (Region) regionDAO.findByCityName(proName).get(0);
			cityList = regionDAO.getCityListByProvince(province);
		}
		
		//友情链接
		linkList = linkDAO.getLinkInCity(city.getCityCode());
		
		//最新的招聘信息
		latestList = contentDAO.findLatestContent(city.getCityCode(), null, "1", 20, false);
		
		//其他信息列表
		items[0][0] = contentDAO.findLatestContent(city.getCityCode(), "K02", "1", 6, true);
		items[1][0] = contentDAO.findLatestContent(city.getCityCode(), "K01", "1", 6, true);
		items[2][0] = contentDAO.findLatestContent(city.getCityCode(), "K24", "1", 6, true);
		items[3][0] = contentDAO.findLatestContent(city.getCityCode(), "K16", "1", 6, true);
		items[4][0] = contentDAO.findLatestContent(city.getCityCode(), "K04", "1", 6, true);
		items[5][0] = contentDAO.findLatestContent(city.getCityCode(), "K27", "1", 6, true);
		
		items[0][1] = typeDAO.findByTypeIds("K02");
		items[1][1] = typeDAO.findByTypeIds("K01");
		items[2][1] = typeDAO.findByTypeIds("K24");
		items[3][1] = typeDAO.findByTypeIds("K16");
		items[4][1] = typeDAO.findByTypeIds("K04");
		items[5][1] = typeDAO.findByTypeIds("K27");
		
		latestRencaiList = contentDAO.findLatestContent(city.getCityCode(), null, "0", 10, false);
		
		return SUCCESS;
	}

	public Content getC() {
		return c;
	}

	public void setC(Content content) {
		this.c = content;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public Integer getCtNo() {
		return ctNo;
	}

	public void setCtNo(Integer ctNo) {
		this.ctNo = ctNo;
	}

	public ViewBiz getViewBiz() {
		return viewBiz;
	}

	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public Type getT() {
		return t;
	}

	public void setT(Type t) {
		this.t = t;
	}

	public String getCtClass() {
		return ctClass;
	}

	public void setCtClass(String ctClass) {
		this.ctClass = ctClass;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public String getTypeNames() {
		return typeNames;
	}

	public void setTypeNames(String typeNames) {
		this.typeNames = typeNames;
	}

	public List<Content> getMoreList() {
		return moreList;
	}

	public void setMoreList(List<Content> moreList) {
		this.moreList = moreList;
	}

	public ContentDAO getContentDAO() {
		return contentDAO;
	}

	public String getCtClassLink() {
		return ctClassLink;
	}

	public void setCtClassLink(String ctClassLink) {
		this.ctClassLink = ctClassLink;
	}

	public LinkDAO getLinkDAO() {
		return linkDAO;
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

	public List<Link> getLinkList() {
		return linkList;
	}

	public void setLinkList(List<Link> linkList) {
		this.linkList = linkList;
	}

	public List<Content> getLatestList() {
		return latestList;
	}

	public void setLatestList(List<Content> latestList) {
		this.latestList = latestList;
	}

	public Object[][] getItems() {
		return items;
	}

	public void setItems(Object[][] items) {
		this.items = items;
	}

	public Integer getNavIndex() {
		return navIndex;
	}

	public void setNavIndex(Integer navIndex) {
		this.navIndex = navIndex;
	}

	public List<Content> getLatestRencaiList() {
		return latestRencaiList;
	}

	public void setLatestRencaiList(List<Content> latestRencaiList) {
		this.latestRencaiList = latestRencaiList;
	}

}
