package com.throne212.jianzhi8.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.domain.Content;
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
	private ViewBiz viewBiz;
	
	//bean参数
	private Integer ctNo;
	private Content c;
	private User user;
	private TypeIntf t;
	private Region city;
	private List<Region> subCityList;
	private List moreList;
	private List<Type> typeList;
	private Region area;

	//招聘（全职+兼职）求职
	public String a(){
		if(ctNo == null || (c=contentDAO.findById(ctNo)) == null){
			return "404";
		}
		// 用户
		List<User> userList = userDAO.findByUserId(c.getCtUserId());
		if (userList != null && userList.size() > 0)
			user = userList.get(0);
		if(user == null)
			return "404";
		//周边城市
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);
		if (city != null) {
			subCityList = regionDAO.getSubCityList(city);
		}
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
		if("1".equals(c.getCtKind())){//招聘
			// 目录类型
//			if("0".equals(c.getCtClass())){//兼职
//				t = typeDAO.findByTypeIds(c.getCtTypeId());
//			}else if("1".equals(c.getCtClass())){//兼职
//				t = jobTypeDAO.findByTypeIds(c.getCtTypeId());
//			}
			//相关信息
			moreList = contentDAO.findLatestContent(c.getCtCityId(), c.getCtTypeId(), "1", 4, false);
			//添加查看次数
			viewBiz.addLoonum(c.getCtNo());
			return "info";
		}else if("0".equals(c.getCtKind())){//求职
			//获取求职的类别列表
			String typeCol = c.getCtTypeId();
			if(!Util.isEmpty(typeCol)){
				typeList = new ArrayList<Type>();
				String[] types = typeCol.split("-");
				for(String typeId : types){
					Type type = typeDAO.findById(typeId);
					if(type != null)
						typeList.add(type);
				}
			}
			//相关信息
			String queryTypeId = typeList!=null&&typeList.size()>0?typeList.get(0).getTypeCode():c.getCtTypeId();
			moreList = contentDAO.findLatestContent(c.getCtCityId(), queryTypeId, "0", 4, false);
			//添加查看次数
			viewBiz.addLoonum(c.getCtNo());
			return "qiuzhi";
		}
		return "404";
	}
	
	//简历
	public String b(){
		if(ctNo == null || (user=userDAO.findById(ctNo)) == null){
			return "404";
		}
		//获取求职的类别列表
		String typeCol = user.getUserTypeId();
		if(!Util.isEmpty(typeCol)){
			typeList = new ArrayList<Type>();
			String[] types = typeCol.split("-");
			for(String typeId : types){
				Type type = typeDAO.findById(typeId);
				typeList.add(type);
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
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);
		if (city != null) {
			subCityList = regionDAO.getSubCityList(city);
		}
		//相关信息
		String queryTypeId = typeList!=null&&typeList.size()>0?typeList.get(0).getTypeCode():user.getUserTypeId();
		moreList = userDAO.findLatestResume(city.getCityCode(), queryTypeId, 4);
		//添加查看次数
		viewBiz.addResumeLoonum(user.getUserNo());
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

	public Region getCity() {
		return city;
	}

	public void setCity(Region city) {
		this.city = city;
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

	
}
