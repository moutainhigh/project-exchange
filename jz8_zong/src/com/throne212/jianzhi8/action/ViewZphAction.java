package com.throne212.jianzhi8.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.dao.InfoZphDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.InfoZph;
import com.throne212.jianzhi8.domain.Region;

public class ViewZphAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	//��Դ
	@Resource
	private InfoZphDAO infoZphDAO;
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	
	// ҳ����Ҫ���б�
	private List<Region> fillProCityList;// ʡ�ݺͳ�������
	
	//����
	private Integer paramZphNo;
	private InfoZph z;
	private InfoZph preZph;
	private InfoZph postZph;
	private List<InfoZph> moreList;
	
	//�鿴��ϸҳ��
	public String execute(){
		logger.debug("zph paramZphNo=" + paramZphNo);
		if(paramZphNo == null || (z=infoZphDAO.findById(paramZphNo))==null)
			return "404";
		//��һƪ����һƪ
		preZph = infoZphDAO.getPreZphById(paramZphNo);
		postZph = infoZphDAO.getPostZphById(paramZphNo);
		//more
		moreList = infoZphDAO.getMoreZph(z);
		// ���ѡ��
		fillProCityList = regionDAOJDBC.getProCityList();
		return "view_zph";
	}
	
	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public InfoZphDAO getInfoZphDAO() {
		return infoZphDAO;
	}

	public void setInfoZphDAO(InfoZphDAO infoZphDAO) {
		this.infoZphDAO = infoZphDAO;
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

	public RegionDAOJDBC getRegionDAOJDBC() {
		return regionDAOJDBC;
	}

	public void setRegionDAOJDBC(RegionDAOJDBC regionDAOJDBC) {
		this.regionDAOJDBC = regionDAOJDBC;
	}

	public List<Region> getFillProCityList() {
		return fillProCityList;
	}

	public void setFillProCityList(List<Region> fillProCityList) {
		this.fillProCityList = fillProCityList;
	}

	
}
