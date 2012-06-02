package com.throne212.jianzhi8.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.impl.jdbc.ViewBizImpl;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.domain.TypeIntf;
import com.throne212.jianzhi8.domain.User;

@ParentPackage("basePackage")
public class ViewAction extends ActionSupport {
	
	@Resource
	private ContentDAO contentDAO;
	
	@Resource
	private UserDAO userDAO;
	
	@Resource
	private TypeDAO typeDAO;
	
	@Resource
	private JobTypeDAO jobTypeDAO;
	
	@Resource
	private RegionDAO regionDAO;
	
	@Resource
	private ViewBizImpl viewBiz;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	//bean参数
	private String paramCityId;
	private Integer ctNo;
	private Content c;
	private User user;
	private TypeIntf t;
	private Region city;
	private List<Region> subCityList;
	private List<Region> brotherCityList;
	private List moreList;
	private List<Type> typeList;
	private List<JobType> jobTypeList;
	private Region area;

	private String typeNames;
	private String typeName;
	private String ctClass;
	private String ctClassLink;
	private String typeId;
	//招聘（全职+兼职）求职
	public String a(){
		if(ctNo == null || (c=contentDAO.findById(ctNo)) == null){
			return "404";
		}
		// 用户
		List<User> userList = userDAO.findByUserId(c.getCtUserId());
		if (userList != null && userList.size() > 0){
			user = userList.get(0);
			if("admin".equals(user.getUserId()))
				user.setUserCompanyName("");
			}
		if(user == null)
			return "404";
		String cityidtemp=c.getCtCityId();
		//周边城市
		List<Region> cList = regionDAO.findByCityCode(c.getCtCityId());
		if(cList != null && cList.size() > 0)
			city = cList.get(0);
		if(city == null && (city = Parameter.citymap_py.get(paramCityId))==null)
			return "404";
		if (city != null) {
			subCityList = regionDAO.getSubCityList(city);
		}
		if (subCityList==null||subCityList.isEmpty())
		{
			brotherCityList = regionDAO.getCityListByBrother(city);
		}
		String temp2=c.getCtTypeId();
		c.setCtTypeId(temp2.toLowerCase());
		//地区
		if(!Util.isEmpty(c.getCtCityId())){
			List<Region> regionList = regionDAO.findByCityCode(c.getCtCityId());
			if(regionList != null && regionList.size() > 0){
				Region region = regionList.get(0);
				if(region.getCityCode().length() == 6 
						|| "0100".equals(region.getParentCode()) 
						|| "0200".equals(region.getParentCode()) 
						|| "0300".equals(region.getParentCode()) 
						|| "0400".equals(region.getParentCode())){
					area = region;
				}
			}
		}
		String ct_content =c.getCtContent().trim();  // eagle edit
		ct_content = ct_content.replaceAll("\r\n", "<br>");
		if(ct_content.startsWith("<br>")){
			ct_content=ct_content.substring(4);
		}
		   ct_content = ct_content.replaceFirst("兼职", "<a style='color:#000' href='http://www.jianzhi8.com/' target=_blank>兼职</a>");
		   //ct_content=com.wordfilter.WordFilterUtil.simpleFilterwww("http://"+city.getCityId()+".jianzhi8.com/s/",ct_content);
		   c.setCtContent(ct_content);
		 String ct_title=c.getCtTitle();
		 ct_title = ct_title.replaceAll(city.getSimpleName(), "");
		
			String temp=c.getCtContact();
			if("1".equals(c.getCtIsclose())){
				temp="<font color=red>本条信息已经过期 </font>";
			}
			else if(c.getTodate()){ //过期返回ture
				temp="<font color=red>本条信息已经过期 </font>";
			}
			 if(temp!=null&&temp.trim().length()>0){
				 temp = temp.replaceAll("\r\n", "<br>");
			 c.setCtContact(temp);
			 }
			 else{
				 c.setCtContact("");
				 temp=c.getCtPhone();
				 if(temp!=null&&temp.trim().length()>5){
				 temp=com.throne212.jianzhi8.common.DESUtil.encrypttoStr(temp,"my.jianzhi8.com.eagle.mobile");
				 c.setCtPhone(temp);
				 }
				 else c.setCtPhone("");
				 
				 temp=c.getCtMobile();
				 if(temp!=null&&temp.trim().length()>5){
				 temp=com.throne212.jianzhi8.common.DESUtil.encrypttoStr(temp,"my.jianzhi8.com.eagle.mobile");
				 c.setCtMobile(temp);
				 }
				 else c.setCtMobile("");
				 
				 temp=c.getCtEmail();
				 if(temp!=null&&temp.trim().length()>5){
				 temp=com.throne212.jianzhi8.common.DESUtil.encrypttoStr(temp,"my.jianzhi8.com.eagle.email");
				 c.setCtEmail(temp);
				 }
				 else  c.setCtEmail("");
			 }
			//添加查看次数
		//viewBiz.addLoonum(c.getCtNo());
				
		if("1".equals(c.getCtKind())){//招聘
			//相关信息
			moreList = contentDAO.findLatestContent(cityidtemp, c.getCtTypeId(), "1","0" ,6);	
			
			  typeName=c.getCtTypeName(); //用于导航
				// 兼职\全职
				if ("0".equals(c.getCtClass())) {  //兼职招聘
					ctClass = "兼职";
					ctClassLink = "";
					Type type=typeDAO.findById(c.getCtTypeId());
					typeName=type.getTypeName();
					typeName=typeName.replaceAll("兼职", "");
					 if(!ct_title.contains("兼职")){
						 if(ct_title.contains("聘")){
							 ct_title=ct_title.replaceFirst("聘", "聘兼职"); 
						 }
						 else ct_title=ct_title+"兼职";
					 }
				} else if ("1".equals(c.getCtClass())) {//全职招聘
					ctClass = "招聘";
					ctClassLink = "zp";
					JobType jobType=jobTypeDAO.findByTypeIds(c.getCtTypeId().toLowerCase());
					if(jobType!=null)
						typeName=jobType.getTypeName();
					
					 if(!ct_title.contains("聘")&&!ct_title.contains("兼职")){
						 ct_title=ct_title+"招聘";
					 }
					typeName=typeName.replaceAll("招聘", "");
					
				}
				if(c.getCtTypeId().length()==5){
					typeId=c.getCtTypeId().substring(0,3);
				}
				else typeId=c.getCtTypeId();
				 ct_title= ct_title.replaceAll("[^\u4E00-\u9FA50-9a-zA-Z]", "");
				 c.setCtTitle(ct_title);
			return "info";
			
		}else if("0".equals(c.getCtKind())){//求职
			//获取求职的类别列表
			typeNames = c.getCtTypeName();
			String typeCol = c.getCtTypeId();
			 if ("0".equals(c.getCtClass())) {  //兼职招聘	 
					if (typeCol != null){
						String[] types = typeCol.split("-");
						if (types != null && types.length > 0)
							c.setCtTypeId( types[0].toLowerCase());	
						typeList = new ArrayList<Type>();
						int i=0;
						for(String typeId: types){
							Type type = typeDAO.findById(typeId);
							if(type != null)
								typeList.add(type);
							if(i==0){
								typeName=type.getTypeName();
							}
							i++;
						}
						}				 
					ctClass = "兼职";
//					Type type=typeDAO.findById(c.getCtTypeId());
//					typeName=type.getTypeName();
					typeName=typeName.replaceAll("兼职", "");
					 if(!ct_title.contains("兼职")){
						 if(ct_title.contains("聘")){
							 ct_title=ct_title.replaceFirst("聘", "聘兼职"); 
						 }
						 else ct_title=ct_title+"兼职";
					 }
				} else {//全职招聘
					if (typeCol != null ){
						String[] types = typeCol.split("-");
						if (types != null && types.length > 0)
							c.setCtTypeId( types[0].toLowerCase());	
						jobTypeList = new ArrayList<JobType>();
						int i=0;
						for(String typeId : types){
							JobType jobType = jobTypeDAO.findByTypeIds(typeId);
							if(jobType != null)
								jobTypeList.add(jobType);
							if(i==0){
								typeName=jobType.getTypeName();
							}
							i++;
						}
						}
					ctClass = "";
//					JobType jobType=jobTypeDAO.findByTypeIds(c.getCtTypeId());
//					if(jobType!=null)
//						typeName=jobType.getTypeName();
					
					 if(!ct_title.contains("聘")&&!ct_title.contains("兼职")){
						 ct_title=ct_title+"招聘";
					 }
					typeName=typeName.replaceAll("招聘", "");
				}
				if(c.getCtTypeId().length()==5){
					typeId=c.getCtTypeId().substring(0,3).toLowerCase();
				}
				else typeId=c.getCtTypeId().toLowerCase();
			
			 ct_title= ct_title.replaceAll("[^\u4E00-\u9FA50-9a-zA-Z]", "");
			 c.setCtTitle(ct_title);
			
			//相关信息
			moreList = contentDAO.findLatestContent(c.getCtCityId(), c.getCtTypeId(), "0","0", 6);
			
			return "qiuzhi";
		}
		return "404";
	}
	
	//简历
	public String b(){
		if(ctNo == null || (user=userDAO.findById(ctNo)) == null){
			return "404";
		}
		String temp=user.getUserPhone();
		 if(temp!=null&&temp.trim().length()>5){
		 temp=com.throne212.jianzhi8.common.DESUtil.encrypttoStr(temp,"my.jianzhi8.com.eagle.mobile");
		 user.setUserPhone(temp);
		 }
		 else{user.setUserPhone("");}
		 temp=user.getUserMobile();
		 if(temp!=null&&temp.trim().length()>5){
		 temp=com.throne212.jianzhi8.common.DESUtil.encrypttoStr(temp,"my.jianzhi8.com.eagle.mobile");
		 user.setUserMobile(temp);
		 }
		 else {user.setUserMobile("");}
		 
		//获取求职的类别列表
		String typeCol = user.getUserTypeId();
		if(!Util.isEmpty(typeCol)){
			if(user.getUserClass()!=null&&"0".equals(user.getUserClass())){
				ctClass = "兼职";
					typeList = new ArrayList<Type>();
					String[] types = typeCol.split("-");
				if (types != null && types.length > 0)
						user.setUserTypeId( types[0]);	
				int i=0;
				for(String typeId : types){
				Type type = typeDAO.findById(typeId);
				typeList.add(type);
				if(i==0)
					typeName=type.getTypeName();
				i++;
				}
			}
			else if(user.getUserClass()!=null&&"1".equals(user.getUserClass())){
				ctClass = "全职";
				jobTypeList = new ArrayList<JobType>();
				String[] types = typeCol.split("-");
				int i=0;
			if (types != null && types.length > 0)
					user.setUserTypeId( types[0]);	
			for(String typeId : types){
					JobType jobType = jobTypeDAO.findByTypeIds(typeId);
					jobTypeList.add(jobType);
					if(i==0)
						typeName=jobType.getTypeName();
					i++;
				}
			}
			}
		//地区
		if(!Util.isEmpty(user.getUserCityId())){
			List<Region> regionList = regionDAO.findByCityCode(user.getUserCityId());
			if(regionList != null && regionList.size() > 0){
				Region region = regionList.get(0);
				if(region.getCityCode().length() == 6 
						|| "0100".equals(region.getParentCode()) 
						|| "0200".equals(region.getParentCode()) 
						|| "0300".equals(region.getParentCode()) 
						|| "0400".equals(region.getParentCode())){
					area = region;
				}
			}
		}
		//周边城市
		List<Region> cList = regionDAO.findByCityCode(user.getUserCityId());
		if(cList != null && cList.size() > 0)
			city = cList.get(0);
		if (city != null) {
			subCityList = regionDAO.getSubCityList(city);
		}else{
			return "404";
		}
		if (subCityList==null||subCityList.isEmpty())
		{
			brotherCityList = regionDAO.getCityListByBrother(city);
		}
		//相关信息
		//String queryTypeId = typeList!=null&&typeList.size()>0?typeList.get(0).getTypeCode():user.getUserTypeId();
		moreList = userDAO.findLatestResume(city.getCityCode(), user.getUserTypeId(), 4);
		//添加查看次数
		//viewBiz.addResumeLoonum(user.getUserNo());
		return "resume";
	} 

	public Integer getCtNo() {
		return ctNo;
	}

	public void setCtNo(Integer ctNo) {
		this.ctNo = ctNo;
	}

	public Content getC() {
		return c;
	}

	public void setC(Content c) {
		this.c = c;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public TypeIntf getT() {
		return t;
	}

	public void setT(TypeIntf t) {
		this.t = t;
	}

	public Region getArea() {
		return area;
	}

	public void setArea(Region area) {
		this.area = area;
	}
	
	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
	}
	public List<Region> getBrotherCityList() {
		return brotherCityList;
	}

	public void setBrotherCityList(List<Region> brotherCityList) {
		this.brotherCityList = brotherCityList;
	}
	public List<Region> getSubCityList() {
		return subCityList;
	}

	public void setSubCityList(List<Region> subCityList) {
		this.subCityList = subCityList;
	}
	public List getMoreList() {
		return moreList;
	}

	public void setMoreList(List moreList) {
		this.moreList = moreList;
	}

	public List<Type> getTypeList() {
		return typeList;
	}

	public void setTypeList(List<Type> typeList) {
		this.typeList = typeList;
	}
	
	
	public List<JobType> getJobTypeList() {
		return jobTypeList;
	}

	public void setJobTypeList(List<JobType> jobTypeList) {
		this.jobTypeList = jobTypeList;
	}
	
	public String getTypeNames() {
		return typeNames;
	}

	public void setTypeNames(String typeNames) {
		this.typeNames = typeNames;
	}
	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getCtClass() {
		return ctClass;
	}

	public void setCtClass(String ctClass) {
		this.ctClass = ctClass;
	}
	public String getCtClassLink() {
		return ctClassLink;
	}

	public void setCtClassLink(String ctClassLink) {
		this.ctClassLink = ctClassLink;
	}

	public String getParamCityId() {
		return paramCityId;
	}

	public void setParamCityId(String paramCityId) {
		this.paramCityId = paramCityId;
	}
	

}
