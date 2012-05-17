package com.throne212.jianzhi8.action;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.impl.jdbc.ViewBizImpl;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;

@ParentPackage("basePackage")
public class ComListAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// 资源
	@Resource
	private ViewBizImpl viewBiz;
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private TypeDAO typeDAO;
	@Resource
	private JobTypeDAO jobTypeDAO;

	// 页面所要的列表
	private List<Region> fillCityList;// 城市或者地区列表
	private List<Type> fillTypeList;// 兼职类型列表
	private List<JobType> fillJobTypeList;// 兼职类型列表

	// 传递过来的参数
	private String paramTypeId;// xuesheng,wangluojianzhi
	private String paramJobTypeId;// xiaoshouyewu
	private String paramUnitype;// t1,t2,t3,企业，中介，验证
	private String paramCityId;// bj,haidian
	private String paramPageNum;// page的数字，如：p2
	private String paramClass;//c0,c1

	// 当前被勾选的项
	private String currTypeId;// 当前选中的typeid,xuesheng,wangluojianzhi
	private String currTypeName;// 当前选中的类型的名字
	private String currParentTypeId;// 当前选中的type的父id,xuesheng,wangluojianzhi
	private String currParentTypeName;// 当前选中的类型的的父名字
	private String currJobTypeId;// 当前选中的jobtypeid,xuesheng,wangluojianzhi
	private String currJobTypeName;// 当前选中的job类型的名字
	private String currParentJobTypeId;// 当前选中的jobtype的父id,xuesheng,wangluojianzhi
	private String currParentJobTypeName;// 当前选中的job类型的的父名字
	private String currCityId;// 当前选中的cityid,bj,haidian
	private String currCityName;// 当前选中的城市的名字
	private String currParentCityId;// 当前选中的城市的父id,cityid,bj,haidian
	private String currParentCityName;// 当前选中的城市的的父名字
	private String currUnitype;// 信息类型
	private String currClass;//c0,c1
	
	//用于查询用的filed
	private String queryCityCode;//city的code，例如1201
	private String queryTypeCode;//type的code，例如k01
	private String queryJobTypeCode;//jobtype的code，例如q01
	private String queryUnitype;//中介，直聘
	private String queryClass;//0,1

	// 数据
	private Integer pageIndex;
	private PageBean bean;

	public String execute() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String path = request.getServletPath();
			logger.debug("request path=" + path);
			if (path != null) {
				if (path.contains("/")) {
					path = path.replaceAll("//", "/");
					if (!path.endsWith("/"))
						path = path + "/";
					String[] strpath = path.split("/");
					String[] str = new String[3];
					if (strpath.length == 2) { // 一级目录的时候
						str[0] = strpath[1];
					} else if (strpath.length == 3) {// 二级目录的时候
						str[0] = strpath[1];
						str[1] = strpath[2];
					} else if (strpath.length == 4) {// 三级目录的时候
						str[0] = strpath[1];
						str[1] = strpath[2];
						str[2] = strpath[3];
					} else{
						return "404";
					}
					//分解参数
					for(String s : str){
						if(s == null)
							break;
						if(s.startsWith("rc") || s.startsWith("zp"))
							s = s.substring(2);
						parseType(s);
						parseJobType(s);
						parseCityId(s);
						parseOther(s);
					}
					//根据标识调用不同的列表方法
					if(str[0].startsWith("zp")){//全职
						return job();
					}else if(str[0].startsWith("rc")){//求职
						return rencai();
					}else{//兼职
						return jianzhi();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "404";
	}
	
	// 分解参数
	private boolean parseType(String str){//获取兼职类型
		Type t = Parameter.typemap_py.get(str);
		if(t != null){
			paramTypeId = t.getTypeId();
			return true;
		}
		return false;
	}
	private boolean parseJobType(String str){//获取全职类型
		JobType t = Parameter.jobtypemap_py.get(str);
		if(t != null){
			paramJobTypeId = t.getTypeId();
			return true;
		}
		return false;
	}
	private boolean parseCityId(String str){//获取城市id
		Region c = Parameter.citymap_py.get(str);
		if(c != null){
			paramCityId = c.getCityId();
			return true;
		}
		return false;
	}
	private boolean parseOther(String str){
		boolean succ = false;
		//找出t参数
		Pattern p = Pattern.compile("t\\d");
		Matcher m = p.matcher(str);
		if(m.find()){
			paramUnitype = m.group();
			succ = true;
		}
		//找出p参数
		p = Pattern.compile("p\\d+");
		m = p.matcher(str);
		if(m.find()){
			paramPageNum = m.group();
			succ = true;
		}
		//找出c参数
		p = Pattern.compile("c\\d");
		m = p.matcher(str);
		if(m.find()){
			paramClass = m.group();
			succ = true;
		}
		return succ;
	}
	
	//测试代码
	public static void main(String[] args) {
		String str = "t1p2";
		Pattern p = Pattern.compile("p\\d");
		Matcher m = p.matcher(str);
		System.out.println(m.find());
		String s = m.group();
		System.out.println(s);
	}

	// 参数的处理
	private void getParams() {
		// 页码
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1){
			String pageNum = paramPageNum.replaceAll("\\D", "").trim();
			pageIndex = Integer.parseInt(pageNum);
		}else{
			pageIndex = 1;
		}
		//获取城市的code和处理curr
		if(!Util.isEmpty(paramCityId)){
			Region r = regionDAO.findById(paramCityId);
			if(r != null){
				queryCityCode = r.getCityCode();
				currCityId = r.getCityId();
				currCityName = r.getSimpleName();
				if(r.getGrade() == 0){//城市
					currParentCityId = r.getCityId();
					currParentCityName = r.getSimpleName();
				}else{//区县
					List<Region> prList = regionDAO.findByProperty("cityCode", r.getParentCode());
					if(prList != null && prList.size() > 0){
						Region pr = prList.get(0);
						currParentCityId = pr.getCityId();
						currParentCityName = pr.getSimpleName();
					}
				}
			}
		}
		//获取type的code和处理curr
		if(!Util.isEmpty(paramTypeId)){
			List<Type> tList = typeDAO.findByProperty("typeId", paramTypeId);
			if(tList != null && tList.size() > 0){
				Type t = tList.get(0);
				queryTypeCode = t.getTypeCode();
				currTypeId = t.getTypeId();
				currTypeName = t.getTypeName();
				if(!Util.isEmpty(t.getParentTypeCode())){
					Type pt = typeDAO.findById(t.getParentTypeCode());
					currParentTypeId = pt.getTypeId();
					currParentTypeName = pt.getTypeName();
				}else{
					currParentTypeId = t.getTypeId();
					currParentTypeName = t.getTypeName();
				}
			}
		}
		//获取jobtype的code和处理curr
		if(!Util.isEmpty(paramJobTypeId)){
			List<JobType> tList = jobTypeDAO.findByProperty("typeId", paramJobTypeId);
			if(tList != null && tList.size() > 0){
				JobType t = tList.get(0);
				queryJobTypeCode = t.getTypeCode();
				currJobTypeId = t.getTypeId();
				currJobTypeName = t.getTypeName();
				if(!Util.isEmpty(t.getParentTypeCode())){
					JobType pt = jobTypeDAO.findById(t.getParentTypeCode());
					currParentJobTypeId = pt.getTypeId();
					currParentJobTypeName = pt.getTypeName();
				}else{
					currParentJobTypeId = t.getTypeId();
					currParentJobTypeName = t.getTypeName();
				}
			}
		}
		//获取unitype的实际值
		currUnitype = paramUnitype;
		if("t1".equals(paramUnitype)){
			queryUnitype = "直聘";
		}else if("t2".equals(paramUnitype)){
			queryUnitype = "中介";
		}
		//兼职/全职
		currClass = paramClass;
		if(currClass != null && currClass.length() > 1){
			queryClass = currClass.substring(1);
		}
	}
	

	// 招聘兼职职位列表
	public String jianzhi() {
		// 处理参数
		getParams();
		// 获取数据
		if("t3".equals(paramUnitype)){
			bean = viewBiz.listJianzhi(queryCityCode, queryTypeCode, queryUnitype, true, pageIndex);
		}else{
			bean = viewBiz.listJianzhi(queryCityCode, queryTypeCode, queryUnitype, false, pageIndex);
		}
		// 填充选项
		if(!Util.isEmpty(currParentCityId)){
			Region city = regionDAO.findById(currParentCityId);
			fillCityList = regionDAO.getSubCityList(city.getCityCode());
		}else
			fillCityList = regionDAOJDBC.getAllCities();
		if(!Util.isEmpty(currParentTypeId)){
			List<Type> tList = typeDAO.findByProperty("typeId", currParentTypeId);
			if(tList != null && tList.size() > 0)
				fillTypeList = typeDAO.getTopAll(tList.get(0).getTypeCode());
		}else
			fillTypeList = typeDAO.getTopAll();
		// 处理已经选中的项目
		if(Util.isEmpty(currCityName))
			currCityName = "全国";
		if(Util.isEmpty(currTypeName))
			currTypeName = "全部";
		return "list_jianzhi";
	}
	
	// 招聘全职职位列表
	public String job() {
		// 处理参数
		getParams();
		// 获取数据
		if("t3".equals(paramUnitype)){
			bean = viewBiz.listJob(queryCityCode, queryJobTypeCode, queryUnitype, true, pageIndex);
		}else{
			bean = viewBiz.listJob(queryCityCode, queryJobTypeCode, queryUnitype, false, pageIndex);
		}
		// 填充选项
		if(!Util.isEmpty(currParentCityId)){
			Region city = regionDAO.findById(currParentCityId);
			fillCityList = regionDAO.getSubCityList(city.getCityCode());
		}else
			fillCityList = regionDAOJDBC.getAllCities();
		if(!Util.isEmpty(currParentJobTypeId)){
			List<JobType> tList = jobTypeDAO.findByProperty("typeId", currParentJobTypeId);
			if(tList != null && tList.size() > 0)
				fillJobTypeList = jobTypeDAO.getTopAll(tList.get(0).getTypeCode());
		}else
			fillJobTypeList = jobTypeDAO.getTopAll();
		// 处理已经选中的项目
		if(Util.isEmpty(currCityName))
			currCityName = "全国";
		if(Util.isEmpty(currTypeName))
			currTypeName = "全部";
		return "list_job";
	}
	
	// 求职列表
	public String rencai() {
		// 处理参数
		getParams();
		// 获取数据
		bean = viewBiz.listRencai(queryCityCode, queryTypeCode, queryClass, pageIndex);
		// 填充选项
		if(!Util.isEmpty(currParentCityId)){
			Region city = regionDAO.findById(currParentCityId);
			fillCityList = regionDAO.getSubCityList(city.getCityCode());
		}else
			fillCityList = regionDAOJDBC.getAllCities();
		if(!Util.isEmpty(currParentTypeId)){
			List<Type> tList = typeDAO.findByProperty("typeId", currParentTypeId);
			if(tList != null && tList.size() > 0)
				fillTypeList = typeDAO.getTopAll(tList.get(0).getTypeCode());
		}else
			fillTypeList = typeDAO.getTopAll();
		// 处理已经选中的项目
		if(Util.isEmpty(currCityName))
			currCityName = "全国";
		if(Util.isEmpty(currTypeName))
			currTypeName = "全部";
		return "list_rencai";
	}
	
	// 简历列表
	public String resume() {
		getParams();
		bean = viewBiz.listResume(pageIndex);
		return "list_resume";
	}

	// getter and setter

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public ViewBizImpl getViewBiz() {
		return viewBiz;
	}

	public void setViewBiz(ViewBizImpl viewBiz) {
		this.viewBiz = viewBiz;
	}

	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}

	public RegionDAOJDBC getRegionDAOJDBC() {
		return regionDAOJDBC;
	}

	public void setRegionDAOJDBC(RegionDAOJDBC regionDAOJDBC) {
		this.regionDAOJDBC = regionDAOJDBC;
	}

	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}

	public JobTypeDAO getJobTypeDAO() {
		return jobTypeDAO;
	}

	public void setJobTypeDAO(JobTypeDAO jobTypeDAO) {
		this.jobTypeDAO = jobTypeDAO;
	}

	public List<Region> getFillCityList() {
		return fillCityList;
	}

	public void setFillCityList(List<Region> fillCityList) {
		this.fillCityList = fillCityList;
	}

	public List<Type> getFillTypeList() {
		return fillTypeList;
	}

	public void setFillTypeList(List<Type> fillTypeList) {
		this.fillTypeList = fillTypeList;
	}

	public String getParamTypeId() {
		return paramTypeId;
	}

	public void setParamTypeId(String paramTypeId) {
		this.paramTypeId = paramTypeId;
	}

	public String getParamUnitype() {
		return paramUnitype;
	}

	public void setParamUnitype(String paramUnitype) {
		this.paramUnitype = paramUnitype;
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

	public String getCurrTypeId() {
		return currTypeId;
	}

	public void setCurrTypeId(String currTypeId) {
		this.currTypeId = currTypeId;
	}

	public String getCurrCityId() {
		return currCityId;
	}

	public void setCurrCityId(String currCityId) {
		this.currCityId = currCityId;
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

	public String getCurrTypeName() {
		return currTypeName;
	}

	public void setCurrTypeName(String currTypeName) {
		this.currTypeName = currTypeName;
	}

	public String getCurrCityName() {
		return currCityName;
	}

	public void setCurrCityName(String currCityName) {
		this.currCityName = currCityName;
	}

	public String getCurrParentTypeId() {
		return currParentTypeId;
	}

	public void setCurrParentTypeId(String currParentTypeId) {
		this.currParentTypeId = currParentTypeId;
	}

	public String getCurrParentTypeName() {
		return currParentTypeName;
	}

	public void setCurrParentTypeName(String currParentTypeName) {
		this.currParentTypeName = currParentTypeName;
	}

	public String getCurrParentCityId() {
		return currParentCityId;
	}

	public void setCurrParentCityId(String currParentCityId) {
		this.currParentCityId = currParentCityId;
	}

	public String getCurrParentCityName() {
		return currParentCityName;
	}

	public void setCurrParentCityName(String currParentCityName) {
		this.currParentCityName = currParentCityName;
	}

	public String getCurrUnitype() {
		return currUnitype;
	}

	public void setCurrUnitype(String currUnitype) {
		this.currUnitype = currUnitype;
	}

	public String getParamJobTypeId() {
		return paramJobTypeId;
	}

	public void setParamJobTypeId(String paramJobTypeId) {
		this.paramJobTypeId = paramJobTypeId;
	}

	public String getParamClass() {
		return paramClass;
	}

	public void setParamClass(String paramClass) {
		this.paramClass = paramClass;
	}

	public String getCurrJobTypeId() {
		return currJobTypeId;
	}

	public void setCurrJobTypeId(String currJobTypeId) {
		this.currJobTypeId = currJobTypeId;
	}

	public String getCurrJobTypeName() {
		return currJobTypeName;
	}

	public void setCurrJobTypeName(String currJobTypeName) {
		this.currJobTypeName = currJobTypeName;
	}

	public String getCurrParentJobTypeId() {
		return currParentJobTypeId;
	}

	public void setCurrParentJobTypeId(String currParentJobTypeId) {
		this.currParentJobTypeId = currParentJobTypeId;
	}

	public String getCurrParentJobTypeName() {
		return currParentJobTypeName;
	}

	public void setCurrParentJobTypeName(String currParentJobTypeName) {
		this.currParentJobTypeName = currParentJobTypeName;
	}

	public String getCurrClass() {
		return currClass;
	}

	public void setCurrClass(String currClass) {
		this.currClass = currClass;
	}

	public String getQueryCityCode() {
		return queryCityCode;
	}

	public void setQueryCityCode(String queryCityCode) {
		this.queryCityCode = queryCityCode;
	}

	public String getQueryTypeCode() {
		return queryTypeCode;
	}

	public void setQueryTypeCode(String queryTypeCode) {
		this.queryTypeCode = queryTypeCode;
	}

	public String getQueryJobTypeCode() {
		return queryJobTypeCode;
	}

	public void setQueryJobTypeCode(String queryJobTypeCode) {
		this.queryJobTypeCode = queryJobTypeCode;
	}

	public String getQueryUnitype() {
		return queryUnitype;
	}

	public void setQueryUnitype(String queryUnitype) {
		this.queryUnitype = queryUnitype;
	}

	public String getQueryClass() {
		return queryClass;
	}

	public void setQueryClass(String queryClass) {
		this.queryClass = queryClass;
	}

	public List<JobType> getFillJobTypeList() {
		return fillJobTypeList;
	}

	public void setFillJobTypeList(List<JobType> fillJobTypeList) {
		this.fillJobTypeList = fillJobTypeList;
	}

}
