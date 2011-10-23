package com.throne212.jianzhi8.action;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.biz.ViewBiz;
import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.UserDAO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.domain.User;

public class ViewAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());
	private ViewBiz viewBiz;
	private TypeDAO typeDAO;
	private UserDAO userDAO;
	private RegionDAO regionDAO;
	private ContentDAO contentDAO;

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

	// ����
	private Integer ctNo;
	private Content c;
	private Type t;
	private String ctClass;
	private String ctClassLink;
	private String kind;
	private User user;
	private Region city;
	private String cateName;
	
	private String typeNames;
	
	//��ǰ���ڳ��У��͵�ǰ��Ϣ���ڷ��������10����Ƹ��Ϣ
	private List<Content> moreList;

	public String a() {
		
		//String path = ActionContext.getContext().get`
		
		if (ctNo == null)
			return "404";
		logger.debug("view action ing... ct_no=" + ctNo);
		
		// ��ȡ����
		String cityId = (String) ActionContext.getContext().getSession().get(Consts.SESS_CITY_ID);
		city = regionDAO.findById(cityId);
		
		// ͨ��no��ȡ����ʵ��
		c = viewBiz.getContentByNo(ctNo);
		
		if(c == null)
			return "404";

		// Ŀ¼����
		t = typeDAO.findByTypeIds(c.getCtTypeId());

		// ��ְ\ȫְ
		if ("0".equals(c.getCtClass())) {
			ctClass = "��ְ";
			ctClassLink = "jianzhi";
		} else if ("1".equals(c.getCtClass())) {
			ctClass = "ȫְ";
			ctClassLink = "job";
		}
		
		//����������
		typeNames = "";
		if(c.getCtTypeId() != null){
    		String[] arr = c.getCtTypeId().split("-");
    		List<Type> typeList = typeDAO.findTypesByTypeIds(c.getCtTypeId());
    		for(Type type : typeList){
    			typeNames += type.getId().getTypeName()+";";
    		}
    	}

		// �û�
		List<User> userList = userDAO.findByUserId(c.getCtUserId());
		if (userList != null && userList.size() > 0)
			user = userList.get(0);

		// ��ȡ��Ϣ�ķ��࣬��Ƹ����ְ
		kind = c.getCtKind();
		logger.debug("view info kind=" + kind);

		viewBiz.addLoonum(c.getCtNo());
		
		//���cate
		if(c.getCtTypeId()!=null && c.getCtTypeId().contains("K25")){
			cateName = "shixi";
		}else if("0".equals(c.getCtKind())){
			cateName = "rencai";
		}else if("1".equals(c.getCtKind()) && "0".equals(c.getCtClass())){
			cateName = "jianzhi";
		}else if("1".equals(c.getCtKind()) && "1".equals(c.getCtClass())){
			cateName = "job";
		}
		
		if ("1".equals(kind)) {
			moreList = contentDAO.findLatestContent(c.getCtCityId(), c.getCtTypeId(), "1", 10, false);
			kind = "��Ƹ";
			return "view_job";
		} else if ("0".equals(kind)) {
			moreList = contentDAO.findLatestContent(c.getCtCityId(), c.getCtTypeId(), "0", 10, false);
			kind = "��ְ";
			return "view_resume";
		}
		
		return "view";
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

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

}
