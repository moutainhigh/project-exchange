package com.throne212.jianzhi8.listener;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.service.HtmlBuildService;

public class CommonListener implements InitializingBean {

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private ServletContext servletContext;
	
	@Autowired
	private TypeDAO typeDAO;
	
	@Autowired
	private JobTypeDAO jobTypeDAO;
	
	@Autowired
	private HtmlBuildService htmlBuildService;
	
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	
	public void cacheDatas(){
		logger.info("init ...");
		
		//type��map
		List<Type> list = typeDAO.getAll();
		Map<String, String> map = new TreeMap<String, String>();
		for(Type t : list){
			map.put(t.getTypeCode(), t.getTypeName());
		}
		servletContext.setAttribute(Consts.TYPE_MAP, map);
		
		//job type
		List<JobType> list2 = jobTypeDAO.findAll();
		map = new TreeMap<String, String>();
		for(JobType t : list2){
			map.put(t.getTypeCode(), t.getTypeName());
		}
		servletContext.setAttribute(Consts.JOB_TYPE_MAP, map);
		
		//�����������
		List<Region> cityList = regionDAOJDBC.getAllCities();
		servletContext.setAttribute(Consts.CITY_LIST, cityList);
		
		//�����ְ����ʱ��jobtime
		Map<Integer, String> jobdateMap = new TreeMap<Integer, String>();
		jobdateMap.put(1, "��һ������");
		jobdateMap.put(2, "��ĩ��ְ");
		jobdateMap.put(3, "��һ��ְ");
		jobdateMap.put(4, "�����ְ");
		jobdateMap.put(5, "��ټ�ְ");
		jobdateMap.put(6, "���ټ�ְ");
		servletContext.setAttribute(Consts.JOB_DATE_MAP, jobdateMap);
	}

	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
		//��������
		cacheDatas();
		
		//������ҳ
		//htmlBuildService.indexBuildHtml();
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
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

	public HtmlBuildService getHtmlBuildService() {
		return htmlBuildService;
	}

	public void setHtmlBuildService(HtmlBuildService htmlBuildService) {
		this.htmlBuildService = htmlBuildService;
	}

}
