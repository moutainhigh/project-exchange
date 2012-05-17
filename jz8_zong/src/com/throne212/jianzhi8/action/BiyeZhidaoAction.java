package com.throne212.jianzhi8.action;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.common.Util;
import com.throne212.jianzhi8.dao.QitaDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Qita;
import com.throne212.jianzhi8.domain.QitaType;

@ParentPackage("basePackage")
public class BiyeZhidaoAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// ��Դ
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private QitaDAO qitaDAO;
	
	// ҳ����Ҫ���б�

	// ���ݹ����Ĳ���
	private String params;//�ܲ���
	private String paramQitaTypeCode;//qita type id, C01,D,E12
	private String paramPageNum;//p1,p2

	// ��ǰ����ѡ����
	private String currQitaTypeCode;//qita type id, C01,D,E12
	private String currQitaName;//��ǰ��������name,����ģ��
	private String currQitaKey;//��ǰ��������key,jianli
	
	//���ڲ�ѯ�õ�filed
	private String queryQitaTypeCode;//qita type id, C01,D,E12

	// ����
	private List<Qita> lunwenList;
	private List<Qita> baogaoList;
	private List<Qita> eduList;
	private PageBean bean;
	private Integer pageIndex;

	public String index() {
		lunwenList = qitaDAO.getLastQita(8, "C");
		baogaoList = qitaDAO.getLastQita(8, "E");
		eduList = qitaDAO.getLastQita(8, "F");
		return "biye_zhidao";
	}

	// �����Ĵ���
	private void getAllParams() {
		//�ֽ�õ�qitatype code
		logger.debug("biye params=" + params);
		if (params != null) {
			params = params.replaceAll("//", "/");
			if (!params.endsWith("/"))
				params = params + "/";
			String[] strpath = params.split("/");
			String[] str = new String[2];
			if (strpath.length == 1) { // һ��Ŀ¼��ʱ��
				str[0] = strpath[0];
			} else if (strpath.length == 2) {// ����Ŀ¼��ʱ��
				str[0] = strpath[0];
				str[1] = strpath[1];
			}
			//�ֽ����
			for(String s : str){
				if(s == null)
					continue;
				//�ֽ�qita_type_id
				QitaType t = Parameter.qitatypemap.get(s);
				if(t != null){
					paramQitaTypeCode = t.getTypeCode();
				}
				//�ҳ�p����
				Pattern p = Pattern.compile("p\\d+");
				Matcher m = p.matcher(s);
				if(m.find()){
					paramPageNum = m.group();
				}
			}
		}
		if(paramQitaTypeCode != null){
			queryQitaTypeCode = paramQitaTypeCode;
			currQitaTypeCode = paramQitaTypeCode;
			if(currQitaTypeCode.startsWith("C")){
				currQitaKey = "lunwen";
				currQitaName = "��ҵ����";
			}else if(currQitaTypeCode.startsWith("E")){
				currQitaKey = "baogao";
				currQitaName = "ʵϰ����";
			}else if(currQitaTypeCode.startsWith("F")){
				currQitaKey = "edu";
				currQitaName = "��������";
			}
			if(Parameter.qitatypemap.get(currQitaTypeCode) != null)
				currQitaName = Parameter.qitatypemap.get(currQitaTypeCode).getTypeName();
		}
		// ҳ��
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1){
			String pageNum = paramPageNum.replaceAll("\\D", "").trim();
			pageIndex = Integer.parseInt(pageNum);
		}else{
			pageIndex = 1;
		}
	}
	
	public String qitaList(){
		//�����ͻ�ȡ����
		getAllParams();
		//�õ�����
		bean = qitaDAO.getLastQita(queryQitaTypeCode, pageIndex);
		//�õ������ַ���
		return "list_biye_zhidao";
	}
	
	public String lunwen(){
		paramQitaTypeCode = "C";
		return qitaList();
	}
	
	public String baogao(){
		paramQitaTypeCode = "E";
		return qitaList();
	}
	
	public String edu(){
		paramQitaTypeCode = "F";
		return qitaList();
	}
	
	//setter and getter

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


	public List<Qita> getLunwenList() {
		return lunwenList;
	}

	public void setLunwenList(List<Qita> lunwenList) {
		this.lunwenList = lunwenList;
	}

	public List<Qita> getBaogaoList() {
		return baogaoList;
	}

	public void setBaogaoList(List<Qita> baogaoList) {
		this.baogaoList = baogaoList;
	}

	public List<Qita> getEduList() {
		return eduList;
	}

	public void setEduList(List<Qita> eduList) {
		this.eduList = eduList;
	}

	public QitaDAO getQitaDAO() {
		return qitaDAO;
	}

	public void setQitaDAO(QitaDAO qitaDAO) {
		this.qitaDAO = qitaDAO;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getParamQitaTypeCode() {
		return paramQitaTypeCode;
	}

	public void setParamQitaTypeCode(String paramQitaTypeCode) {
		this.paramQitaTypeCode = paramQitaTypeCode;
	}

	public String getParamPageNum() {
		return paramPageNum;
	}

	public void setParamPageNum(String paramPageNum) {
		this.paramPageNum = paramPageNum;
	}

	public String getCurrQitaTypeCode() {
		return currQitaTypeCode;
	}

	public void setCurrQitaTypeCode(String currQitaTypeCode) {
		this.currQitaTypeCode = currQitaTypeCode;
	}

	public String getQueryQitaTypeCode() {
		return queryQitaTypeCode;
	}

	public void setQueryQitaTypeCode(String queryQitaTypeCode) {
		this.queryQitaTypeCode = queryQitaTypeCode;
	}

	public PageBean getBean() {
		return bean;
	}

	public void setBean(PageBean bean) {
		this.bean = bean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getCurrQitaName() {
		return currQitaName;
	}

	public void setCurrQitaName(String currQitaName) {
		this.currQitaName = currQitaName;
	}

	public String getCurrQitaKey() {
		return currQitaKey;
	}

	public void setCurrQitaKey(String currQitaKey) {
		this.currQitaKey = currQitaKey;
	}
	
}
