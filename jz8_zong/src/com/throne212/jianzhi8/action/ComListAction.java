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
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;

@ParentPackage("basePackage")
public class ComListAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// ��Դ
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

	// ҳ����Ҫ���б�
	private List<Region> fillCityList;// ���л��ߵ����б�
	private List<Type> fillTypeList;// ��ְ�����б�

	// ���ݹ����Ĳ���
	private String paramTypeId;// xuesheng,wangluojianzhi
	private String paramJobTypeId;// xiaoshouyewu
	private String paramUnitype;// t1,t2,t3,��ҵ���н飬��֤
	private String paramCityId;// bj,haidian
	private String paramPageNum;// page�����֣��磺p2
	private String paramClass;//c0,c1

	// ��ǰ����ѡ����
	private String currTypeId;// ��ǰѡ�е�typeid,xuesheng,wangluojianzhi
	private String currTypeName;// ��ǰѡ�е����͵�����
	private String currParentTypeId;// ��ǰѡ�е�type�ĸ�id,xuesheng,wangluojianzhi
	private String currParentTypeName;// ��ǰѡ�е����͵ĵĸ�����
	private String currCityId;// ��ǰѡ�е�cityid,bj,haidian
	private String currCityName;// ��ǰѡ�еĳ��е�����
	private String currParentCityId;// ��ǰѡ�еĳ��еĸ�id,cityid,bj,haidian
	private String currParentCityName;// ��ǰѡ�еĳ��еĵĸ�����
	private String currUnitype;// ��Ϣ����

	// ����
	private Integer pageIndex;
	private PageBean bean;

	public String execute() {
		try {
			HttpServletRequest request = ServletActionContext.getRequest();
			String path = request.getServletPath();
			if (path != null) {
				if (path.contains("/")) {
					path = path.replaceAll("//", "/");
					if (!path.endsWith("/"))
						path = path + "/";
					String[] strpath = path.split("/");
					if (strpath.length == 2) { // һ��Ŀ¼��ʱ��
						String str1 = strpath[1];
						return parseParam(str1);
					} else if (strpath.length == 3) {// ����Ŀ¼��ʱ��
						String str1 = strpath[1];
						String str2 = strpath[2];
						return parseParam(str1,str2);
					} else if (strpath.length == 4) {// ����Ŀ¼��ʱ��
						String str1 = strpath[1];
						String str2 = strpath[2];
						String str3 = strpath[3];
						return parseParam(str1,str2,str3);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "404";
	}

	// �ֽ����
	private String parseParam(String str1){
		return "404";
	}
	private String parseParam(String str1, String str2){
		if(str1.startsWith("zp")){
			str1 = str1.substring(2);
			str2 = str2.substring(2);
			//���ҳ���
			if(Parameter.typemap_py.get(str1) != null){
				
			}
			return job();
		}else if(str1.startsWith("rc")){
			
			return qiuzhi();
		}else{
			//���ҳ���
			if(Parameter.citymap_py.get(str1) != null){
				paramCityId = Parameter.citymap_py.get(str1).getCityId();
				if(Parameter.typemap_py.get(str2) != null){
					
				}
			}
			return jianzhi();
		}
	}
	private String parseParam(String str1, String str2, String str3){
		if(str1.startsWith("zp")){
			paramCityId = str1;
			paramJobTypeId = str2;
			parseOther(str3);
			return job();
		}else if(str1.startsWith("rc")){
			paramCityId = str1;
			paramTypeId = str2;
			parseOther(str3);
			return qiuzhi();
		}else{
			paramCityId = str1;
			paramTypeId = str2;
			parseOther(str3);
			return jianzhi();
		}
	}
	private void parseOther(String str){
		//�ҳ�t����
		Pattern p = Pattern.compile("t\\d");
		Matcher m = p.matcher(str);
		if(m.find())
			paramUnitype = m.group();
		//�ҳ�p����
		p = Pattern.compile("p\\d");
		m = p.matcher(str);
		if(m.find())
			paramPageNum = m.group();
		//�ҳ�c����
		p = Pattern.compile("c\\d");
		m = p.matcher(str);
		if(m.find())
			paramClass = m.group();
	}
	
	public static void main(String[] args) {
		String str = "t1p2";
		Pattern p = Pattern.compile("p\\d");
		Matcher m = p.matcher(str);
		System.out.println(m.find());
		String s = m.group();
		System.out.println(s);
	}

	// �����Ĵ���
	private void getParams() {
		// ҳ��
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1)
			pageIndex = Integer.parseInt(paramPageNum.substring(1));
		else
			pageIndex = 1;

	}

	// ��Ƹ��ְְλ�б�
	public String jianzhi() {
		// �������
		getParams();
		// ��ȡ����
		bean = viewBiz.listJianzhi(null, null, null, false, pageIndex);
		// ���ѡ��
		fillCityList = regionDAOJDBC.getAllCities();
		fillTypeList = typeDAO.getTopAll();
		// �����Ѿ�ѡ�е���Ŀ
		currCityName = "ȫ��";
		currTypeName = "ȫ��";
		return "list_jianzhi";
	}
	
	// ��Ƹȫְְλ�б�
	public String job() {
		return "list_job";
	}
	
	// ��ְ�б�
	public String qiuzhi() {
		return "list_qiuzhi";
	}
	
	// �����б�
	public String resume() {
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

}
