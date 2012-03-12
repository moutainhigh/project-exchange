package com.throne212.jianzhi8.action;

import java.sql.Connection;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Keywords;
import com.throne212.jianzhi8.common.MasterDBUtil;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.common.WordToSpell;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Region;

@ParentPackage("basePackage")
public class ListAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	//资源
	@Resource
	private ViewBiz viewBiz;
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private TypeDAO typeDAO;
	@Resource
	private JobTypeDAO jobTypeDAO;
	
	//参数
	private String typeId;	//K01
	private String pageNum;	//p2,p12
	private String ctClass;	//c0,c1
	private String areaId;	//chaoyang,xihe
	private String jobdate;	//d1,d2
	private String unitype;	//t1,t2,t3,企业，中介，验证
	private String key;		//key
	
	private Integer pageIndex;
	
	//bean数据
	private Region city;
	private PageBean bean;
	private String queryTypeId;
	private String queryCityId;
	private String[] words;
	private List<Region> cityList;
	private List<Region> subCityList;
	private List childTypeList;
	private List typeList;
	private String areaName;
	private List<Region> brotherCityList;
	
	private void testLog(){
		logger.debug("typeId=[" + typeId + "]");
		logger.debug("pageNum=[" + pageNum + "]");
		logger.debug("ctClass=[" + ctClass + "]");
		logger.debug("areaId=[" + areaId + "]");
	}
	
	//参数的处理
	private void getParams(){
		//类型,typeId是大类
		if(!Util.isEmpty(typeId) && typeId.length()>1 && (typeId.startsWith("K") || typeId.startsWith("Q"))){
			queryTypeId = typeId;
			if(typeId.length() == 5)
				typeId = typeId.trim().substring(0,3);
		}
		if(!Util.isEmpty(pageNum) && pageNum.startsWith("p") && pageNum.length()>1){
			pageIndex = Integer.valueOf(pageNum.trim().substring(1));
		}else{
			pageIndex = 1;
		}
		if(!Util.isEmpty(ctClass) && ctClass.startsWith("c") && ctClass.length()>1){
			ctClass = ctClass.trim().substring(1);
		}
		// 获取城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);
		if(!Util.isEmpty(areaId) && areaId.startsWith("a") && areaId.length()>1){
			areaId = areaId.trim().substring(1);
			queryCityId = areaId;
			List<Region> areaList = regionDAO.findByCityCode(areaId);
			if(areaList != null && areaList.size() > 0)
				areaName = areaList.get(0).getSimpleName();
		}else{
			queryCityId = city.getCityCode();
		}
		//周边城市列表
		if(city.getCityCode().equals("0100") || city.getCityCode().equals("0200") || city.getCityCode().equals("0300") || city.getCityCode().equals("0400")){
			brotherCityList = regionDAOJDBC.getHotCities();
		}else{
			brotherCityList = regionDAO.getCityListByBrother(city);
		}
		//jobdate
		if(!Util.isEmpty(jobdate) && jobdate.startsWith("d") && jobdate.length()>1){
			jobdate = jobdate.trim().substring(1);
		}
		//unit type
		if(!Util.isEmpty(unitype) && unitype.startsWith("t") && unitype.length()>1){
			if("t1".equals(unitype.trim()))
				unitype = "直聘";
			else if("t2".equals(unitype.trim()))
				unitype = "中介";
		}
		// 获取关键词
		if(!Util.isEmpty(key) && key.startsWith("s") && key.length()>1){
			key = key.trim().substring(1);
			saveJzWords(key);
		}else{
			key = "";
		}
	}
	
	//保存搜索关键词
	private void saveJzWords(String key){
		Connection conn = null;
		String pin;
		try {
			//获取拼音首字母
			pin = WordToSpell.getFirstLetter(key.charAt(0) + "").toUpperCase();
			conn = MasterDBUtil.getConn();
			String sql = "replace into jzwords_tab(key_type,key_name,key_ischeck) values(?,?,0);";
			int rst = MasterDBUtil.exeUpdate(conn, sql, pin, key);
			logger.info("update new words : " + key + ", succ len=" + rst);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MasterDBUtil.closeConn(conn);
		}
	}
	
	//获取页面公共数据
	private void commonData(){
		//关键字
		String keywords = Keywords.strkeywords;
		if(typeId != null && !"".equals(typeId)){
			keywords = (String) Keywords.keywords.get(typeId);
		}		
		if(!Util.isEmpty(keywords)){
			words = keywords.split(",");
			int maxLen = 10;
			if(words.length < 10)
				maxLen = words.length;
			String[] newWords = new String[maxLen];
			System.arraycopy(words,0,newWords,0,maxLen);
			words = newWords;
		}
		// 获取该省份其他城市，或其他区县
		//if (city != null) {
		//	cityList = regionDAO.getCityListByBrother(city);
		//}		
		// 获取该市的区县
		if (city != null) {
			subCityList = regionDAO.getSubCityList(city);
		}
		// 类表列表
		typeList = typeDAO.getTopAll();
	}

	//招聘兼职职位列表
	public String jianzhi(){
		//testLog();
		//处理参数
		getParams();
		//获取数据
		bean = viewBiz.listContent("1", "0", queryCityId, queryTypeId, jobdate, unitype, "t3".equals(unitype),key, pageIndex);
		commonData();
		// 获取根类型或子类型
		if(typeId != null && !"".equals(typeId)){
			childTypeList = typeDAO.getTopAll(typeId);
		}else{
			childTypeList = typeDAO.getTopAll();
		}
		return "list_jianzhi";
	}
	
	//招聘全职职位列表
	public String job(){
		//处理参数
		getParams();
		//获取数据
		bean = viewBiz.listContent("1", "1", queryCityId, queryTypeId, jobdate, unitype, "t3".equals(unitype),key, pageIndex);
		commonData();
		// 获取根类型或子类型
		if(typeId != null && !"".equals(typeId)){
			childTypeList = jobTypeDAO.getTopAll(typeId);
		}else{
			childTypeList = jobTypeDAO.getTopAll();
		}
		//类别列表
		typeList = jobTypeDAO.getTopAll();
		return "list_job";
	}
	
	public String rencai(){
		//处理参数
		getParams();
		//获取数据
		bean = viewBiz.listContent("0", ctClass, queryCityId, queryTypeId, jobdate, null, false,key, pageIndex);
		commonData();
		// 获取根类型或子类型
		if(typeId != null && !"".equals(typeId)){
			childTypeList = typeDAO.getTopAll(typeId);
		}else{
			childTypeList = typeDAO.getTopAll();
		}
		return "list_rencai";
	}
	
	public String yanzheng(){
		//处理参数
		getParams();
		//获取数据
		bean = viewBiz.listContent("1", null, queryCityId, null, null, null, true, key,pageIndex);
		commonData();
		return "list_yanzheng";
	}
	
	public String resume(){
		//处理参数
		getParams();
		//获取数据
		bean = viewBiz.listResume(queryCityId, queryTypeId, null,key, pageIndex);
		commonData();
		// 获取根类型或子类型
		if(typeId != null && !"".equals(typeId)){
			childTypeList = typeDAO.getTopAll(typeId);
		}else{
			childTypeList = typeDAO.getTopAll();
		}
		return "list_resume";
	}
	
	//综合搜索
	public String search(){
		//获取参数
		getParams();
		//获取数据
		bean = viewBiz.search(city.getCityCode(), key, pageIndex);
		commonData();
		return "list_search";
	}
	
	//setters and getters;
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getCtClass() {
		return ctClass;
	}

	public void setCtClass(String ctClass) {
		this.ctClass = ctClass;
	}

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
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

	public String getQueryTypeId() {
		return queryTypeId;
	}

	public void setQueryTypeId(String queryTypeId) {
		this.queryTypeId = queryTypeId;
	}

	public String getQueryCityId() {
		return queryCityId;
	}

	public void setQueryCityId(String queryCityId) {
		this.queryCityId = queryCityId;
	}

	public String[] getWords() {
		return words;
	}

	public void setWords(String[] words) {
		this.words = words;
	}

	public List<Region> getCityList() {
		return cityList;
	}

	public void setCityList(List<Region> cityList) {
		this.cityList = cityList;
	}

	public List<Region> getSubCityList() {
		return subCityList;
	}

	public void setSubCityList(List<Region> subCityList) {
		this.subCityList = subCityList;
	}

	public List getChildTypeList() {
		return childTypeList;
	}

	public void setChildTypeList(List childTypeList) {
		this.childTypeList = childTypeList;
	}

	public String getJobdate() {
		return jobdate;
	}

	public void setJobdate(String jobdate) {
		this.jobdate = jobdate;
	}

	public String getUnitype() {
		return unitype;
	}

	public void setUnitype(String unitype) {
		this.unitype = unitype;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public List<Region> getBrotherCityList() {
		return brotherCityList;
	}

	public void setBrotherCityList(List<Region> brotherCityList) {
		this.brotherCityList = brotherCityList;
	}

	public List getTypeList() {
		return typeList;
	}

	public void setTypeList(List typeList) {
		this.typeList = typeList;
	}

}
