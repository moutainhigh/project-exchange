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

	// 资源
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private QitaDAO qitaDAO;
	
	// 页面所要的列表

	// 传递过来的参数
	private String params;//总参数
	private String paramQitaTypeCode;//qita type id, C01,D,E12
	private String paramPageNum;//p1,p2

	// 当前被勾选的项
	private String currQitaTypeCode;//qita type id, C01,D,E12
	private String currQitaName;//当前的其他的name,简历模板
	private String currQitaKey;//当前的其他的key,jianli
	
	//用于查询用的filed
	private String queryQitaTypeCode;//qita type id, C01,D,E12

	// 数据
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

	// 参数的处理
	private void getAllParams() {
		//分解得到qitatype code
		logger.debug("biye params=" + params);
		if (params != null) {
			params = params.replaceAll("//", "/");
			if (!params.endsWith("/"))
				params = params + "/";
			String[] strpath = params.split("/");
			String[] str = new String[2];
			if (strpath.length == 1) { // 一级目录的时候
				str[0] = strpath[0];
			} else if (strpath.length == 2) {// 二级目录的时候
				str[0] = strpath[0];
				str[1] = strpath[1];
			}
			//分解参数
			for(String s : str){
				if(s == null)
					continue;
				//分解qita_type_id
				QitaType t = Parameter.qitatypemap.get(s);
				if(t != null){
					paramQitaTypeCode = t.getTypeCode();
				}
				//找出p参数
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
				currQitaName = "毕业论文";
			}else if(currQitaTypeCode.startsWith("E")){
				currQitaKey = "baogao";
				currQitaName = "实习报告";
			}else if(currQitaTypeCode.startsWith("F")){
				currQitaKey = "edu";
				currQitaName = "考试真题";
			}
			if(Parameter.qitatypemap.get(currQitaTypeCode) != null)
				currQitaName = Parameter.qitatypemap.get(currQitaTypeCode).getTypeName();
		}
		// 页码
		if (!Util.isEmpty(paramPageNum) && paramPageNum.length() > 1){
			String pageNum = paramPageNum.replaceAll("\\D", "").trim();
			pageIndex = Integer.parseInt(pageNum);
		}else{
			pageIndex = 1;
		}
	}
	
	public String qitaList(){
		//构建和获取参数
		getAllParams();
		//得到数据
		bean = qitaDAO.getLastQita(queryQitaTypeCode, pageIndex);
		//得到返回字符串
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
