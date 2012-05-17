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
	private List<JobType> fillJobTypeList;// ��ְ�����б�

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
	private String currJobTypeId;// ��ǰѡ�е�jobtypeid,xuesheng,wangluojianzhi
	private String currJobTypeName;// ��ǰѡ�е�job���͵�����
	private String currParentJobTypeId;// ��ǰѡ�е�jobtype�ĸ�id,xuesheng,wangluojianzhi
	private String currParentJobTypeName;// ��ǰѡ�е�job���͵ĵĸ�����
	private String currCityId;// ��ǰѡ�е�cityid,bj,haidian
	private String currCityName;// ��ǰѡ�еĳ��е�����
	private String currParentCityId;// ��ǰѡ�еĳ��еĸ�id,cityid,bj,haidian
	private String currParentCityName;// ��ǰѡ�еĳ��еĵĸ�����
	private String currUnitype;// ��Ϣ����
	private String currClass;//c0,c1
	
	//���ڲ�ѯ�õ�filed
	private String queryCityCode;//city��code������1201
	private String queryTypeCode;//type��code������k01
	private String queryJobTypeCode;//jobtype��code������q01
	private String queryUnitype;//�н飬ֱƸ
	private String queryClass;//0,1

	// ����
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
					if (strpath.length == 2) { // һ��Ŀ¼��ʱ��
						str[0] = strpath[1];
					} else if (strpath.length == 3) {// ����Ŀ¼��ʱ��
						str[0] = strpath[1];
						str[1] = strpath[2];
					} else if (strpath.length == 4) {// ����Ŀ¼��ʱ��
						str[0] = strpath[1];
						str[1] = strpath[2];
						str[2] = strpath[3];
					} else{
						return "404";
					}
					//�ֽ����
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
					//���ݱ�ʶ���ò�ͬ���б���
					if(str[0].startsWith("zp")){//ȫְ
						return job();
					}else if(str[0].startsWith("rc")){//��ְ
						return rencai();
					}else{//��ְ
						return jianzhi();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "404";
	}
	
	// �ֽ����
	private boolean parseType(String str){//��ȡ��ְ����
		Type t = Parameter.typemap_py.get(str);
		if(t != null){
			paramTypeId = t.getTypeId();
			return true;
		}
		return false;
	}
	private boolean parseJobType(String str){//��ȡȫְ����
		JobType t = Parameter.jobtypemap_py.get(str);
		if(t != null){
			paramJobTypeId = t.getTypeId();
			return true;
		}
		return false;
	}
	private boolean parseCityId(String str){//��ȡ����id
		Region c = Parameter.citymap_py.get(str);
		if(c != null){
			paramCityId = c.getCityId();
			return true;
		}
		return false;
	}
	private boolean parseOther(String str){
		boolean succ = false;
		//�ҳ�t����
		Pattern p = Pattern.compile("t\\d");
		Matcher m = p.matcher(str);
		if(m.find()){
			paramUnitype = m.group();
			succ = true;
		}
		//�ҳ�p����
		p = Pattern.compile("p\\d+");
		m = p.matcher(str);
		if(m.find()){
			paramPageNum = m.group();
			succ = true;
		}
		//�ҳ�c����
		p = Pattern.compile("c\\d");
		m = p.matcher(str);
		if(m.find()){
			paramClass = m.group();
			succ = true;
		}
		return succ;
	}
	
	//���Դ���
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
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1){
			String pageNum = paramPageNum.replaceAll("\\D", "").trim();
			pageIndex = Integer.parseInt(pageNum);
		}else{
			pageIndex = 1;
		}
		//��ȡ���е�code�ʹ���curr
		if(!Util.isEmpty(paramCityId)){
			Region r = regionDAO.findById(paramCityId);
			if(r != null){
				queryCityCode = r.getCityCode();
				currCityId = r.getCityId();
				currCityName = r.getSimpleName();
				if(r.getGrade() == 0){//����
					currParentCityId = r.getCityId();
					currParentCityName = r.getSimpleName();
				}else{//����
					List<Region> prList = regionDAO.findByProperty("cityCode", r.getParentCode());
					if(prList != null && prList.size() > 0){
						Region pr = prList.get(0);
						currParentCityId = pr.getCityId();
						currParentCityName = pr.getSimpleName();
					}
				}
			}
		}
		//��ȡtype��code�ʹ���curr
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
		//��ȡjobtype��code�ʹ���curr
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
		//��ȡunitype��ʵ��ֵ
		currUnitype = paramUnitype;
		if("t1".equals(paramUnitype)){
			queryUnitype = "ֱƸ";
		}else if("t2".equals(paramUnitype)){
			queryUnitype = "�н�";
		}
		//��ְ/ȫְ
		currClass = paramClass;
		if(currClass != null && currClass.length() > 1){
			queryClass = currClass.substring(1);
		}
	}
	

	// ��Ƹ��ְְλ�б�
	public String jianzhi() {
		// �������
		getParams();
		// ��ȡ����
		if("t3".equals(paramUnitype)){
			bean = viewBiz.listJianzhi(queryCityCode, queryTypeCode, queryUnitype, true, pageIndex);
		}else{
			bean = viewBiz.listJianzhi(queryCityCode, queryTypeCode, queryUnitype, false, pageIndex);
		}
		// ���ѡ��
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
		// �����Ѿ�ѡ�е���Ŀ
		if(Util.isEmpty(currCityName))
			currCityName = "ȫ��";
		if(Util.isEmpty(currTypeName))
			currTypeName = "ȫ��";
		return "list_jianzhi";
	}
	
	// ��Ƹȫְְλ�б�
	public String job() {
		// �������
		getParams();
		// ��ȡ����
		if("t3".equals(paramUnitype)){
			bean = viewBiz.listJob(queryCityCode, queryJobTypeCode, queryUnitype, true, pageIndex);
		}else{
			bean = viewBiz.listJob(queryCityCode, queryJobTypeCode, queryUnitype, false, pageIndex);
		}
		// ���ѡ��
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
		// �����Ѿ�ѡ�е���Ŀ
		if(Util.isEmpty(currCityName))
			currCityName = "ȫ��";
		if(Util.isEmpty(currTypeName))
			currTypeName = "ȫ��";
		return "list_job";
	}
	
	// ��ְ�б�
	public String rencai() {
		// �������
		getParams();
		// ��ȡ����
		bean = viewBiz.listRencai(queryCityCode, queryTypeCode, queryClass, pageIndex);
		// ���ѡ��
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
		// �����Ѿ�ѡ�е���Ŀ
		if(Util.isEmpty(currCityName))
			currCityName = "ȫ��";
		if(Util.isEmpty(currTypeName))
			currTypeName = "ȫ��";
		return "list_rencai";
	}
	
	// �����б�
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
