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
import com.throne212.jianzhi8.dao.QitaDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.Qita;
import com.throne212.jianzhi8.domain.QitaType;
import com.throne212.jianzhi8.domain.Region;

@ParentPackage("basePackage")
public class QitaAction extends ActionSupport {

	private Logger logger = Logger.getLogger(this.getClass());

	// 资源
	@Resource
	private RegionDAO regionDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	@Resource
	private QitaDAO qitaDAO;
	
	// 页面所要的列表
	private List<Qita> moreList;

	// 传递过来的参数
	private Integer paramQitaNo;//qita no

	// 当前被勾选的项
	private String currQitaName;//当前的其他的name,简历模板
	private String currQitaKey;//当前的其他的key,jianli
	
	//用于查询用的filed

	// 数据
	private Qita q;
	private Qita preQita;
	private Qita postQita;

	public String execute() {
		logger.debug("qita paramQitaNo=" + paramQitaNo);
		if(paramQitaNo == null || (q=qitaDAO.getQitaById(paramQitaNo))==null)
			return "404";
		currQitaKey = q.getKey();
		//上一篇和下一篇
		preQita = qitaDAO.getPreQitaById(paramQitaNo);
		postQita = qitaDAO.getPostQitaById(paramQitaNo);
		//more
		moreList = qitaDAO.getMoreQita(q);
		return "qita";
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

	public QitaDAO getQitaDAO() {
		return qitaDAO;
	}

	public void setQitaDAO(QitaDAO qitaDAO) {
		this.qitaDAO = qitaDAO;
	}

	public List<Qita> getMoreList() {
		return moreList;
	}

	public void setMoreList(List<Qita> moreList) {
		this.moreList = moreList;
	}

	public Integer getParamQitaNo() {
		return paramQitaNo;
	}

	public void setParamQitaNo(Integer paramQitaNo) {
		this.paramQitaNo = paramQitaNo;
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

	public Qita getQ() {
		return q;
	}

	public void setQ(Qita q) {
		this.q = q;
	}

	public Qita getPreQita() {
		return preQita;
	}

	public void setPreQita(Qita preQita) {
		this.preQita = preQita;
	}

	public Qita getPostQita() {
		return postQita;
	}

	public void setPostQita(Qita postQita) {
		this.postQita = postQita;
	}
	
}
