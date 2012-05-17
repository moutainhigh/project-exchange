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
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.InfoZphDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.InfoZph;
import com.throne212.jianzhi8.domain.Region;

@ParentPackage("basePackage")
public class ZphAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// ��Դ
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private InfoZphDAO infoZphDAO; 
	
	// ҳ����Ҫ���б�
	private List<Region> fillProCityList;// ʡ�ݺͳ�������

	// ���ݹ����Ĳ���
	private String params;//�ܲ���
	private String paramCityId;// bj,cd
	private String paramPageNum;//p1,p2

	// ��ǰ����ѡ����
	private String currCityId;// ��ǰѡ�е�cityid,bj,haidian
	private String currCityName;// ��ǰѡ�еĳ��е�����
	
	//���ڲ�ѯ�õ�filed
	private String queryCityCode;//city��code������1201

	// ����
	private Integer pageIndex;
	private PageBean bean;

	public String execute() {
		try {
			logger.debug("params=" + params);
			if(Util.isEmpty(params))
				return list();
			else if (params != null) {
				params = params.replaceAll("//", "/").replaceAll("zph/", "");
				if (!params.endsWith("/"))
					params = params + "/";
				String[] strpath = params.split("/");
				String[] str = new String[2];
				if (strpath.length == 1) { // һ��Ŀ¼��ʱ��
					str[0] = strpath[0];
				} else if (strpath.length == 2) {// ����Ŀ¼��ʱ��
					str[0] = strpath[0];
					str[1] = strpath[1];
				} else{
					return "404";
				}
				//�ֽ����
				for(String s : str){
					if(s == null)
						continue;
					//�ֽ�city_id
					Region c = Parameter.citymap_py.get(s);
					if(c != null){
						paramCityId = c.getCityId();
					}
					//�ҳ�p����
					Pattern p = Pattern.compile("p\\d+");
					Matcher m = p.matcher(s);
					if(m.find()){
						paramPageNum = m.group();
					}
				}
				return list();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "404";
	}
	

	// �����Ĵ���
	private void getAllParams() {
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
			}
		}
	}

	public String list() {
		// �������
		getAllParams();
		// ��ȡ����
		bean = infoZphDAO.listZph(queryCityCode, pageIndex);
		// ���ѡ��
		fillProCityList = regionDAOJDBC.getProCityList();
		return "list_zph";
	}
	
	//����
	private Integer paramZphNo;
	private InfoZph z;
	private InfoZph preZph;
	private InfoZph postZph;
	private List<InfoZph> moreList;
	
	//�鿴��ϸҳ��
	public String view(){
		logger.debug("zph paramZphNo=" + paramZphNo);
		if(paramZphNo == null || (z=infoZphDAO.findById(paramZphNo))==null)
			return "404";
		//��һƪ����һƪ
		preZph = infoZphDAO.getPreZphById(paramZphNo);
		postZph = infoZphDAO.getPostZphById(paramZphNo);
		//more
		moreList = infoZphDAO.getMoreZph(z);
		return "zph";
	}


	public Logger getLogger() {
		return logger;
	}


	public void setLogger(Logger logger) {
		this.logger = logger;
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


	public InfoZphDAO getInfoZphDAO() {
		return infoZphDAO;
	}


	public void setInfoZphDAO(InfoZphDAO infoZphDAO) {
		this.infoZphDAO = infoZphDAO;
	}


	public List<Region> getFillProCityList() {
		return fillProCityList;
	}


	public void setFillProCityList(List<Region> fillProCityList) {
		this.fillProCityList = fillProCityList;
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


	public String getCurrCityId() {
		return currCityId;
	}


	public void setCurrCityId(String currCityId) {
		this.currCityId = currCityId;
	}


	public String getCurrCityName() {
		return currCityName;
	}


	public void setCurrCityName(String currCityName) {
		this.currCityName = currCityName;
	}


	public String getQueryCityCode() {
		return queryCityCode;
	}


	public void setQueryCityCode(String queryCityCode) {
		this.queryCityCode = queryCityCode;
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


	public void setParams(String params) {
		this.params = params;
	}


	public String getParams() {
		return params;
	}


	public Integer getParamZphNo() {
		return paramZphNo;
	}


	public void setParamZphNo(Integer paramZphNo) {
		this.paramZphNo = paramZphNo;
	}


	public InfoZph getZ() {
		return z;
	}


	public void setZ(InfoZph z) {
		this.z = z;
	}


	public InfoZph getPreZph() {
		return preZph;
	}


	public void setPreZph(InfoZph preZph) {
		this.preZph = preZph;
	}


	public InfoZph getPostZph() {
		return postZph;
	}


	public void setPostZph(InfoZph postZph) {
		this.postZph = postZph;
	}


	public List<InfoZph> getMoreList() {
		return moreList;
	}


	public void setMoreList(List<InfoZph> moreList) {
		this.moreList = moreList;
	}
	

	
}
