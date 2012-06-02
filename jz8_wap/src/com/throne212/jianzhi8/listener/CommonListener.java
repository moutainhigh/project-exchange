package com.throne212.jianzhi8.listener;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

import com.throne212.jianzhi8.common.Consts;
import com.throne212.jianzhi8.common.Parameter;
import com.throne212.jianzhi8.dao.JobTypeDAO;
import com.throne212.jianzhi8.dao.QitaTypeDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.jdbc.RegionDAOJDBC;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.QitaType;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;

public class CommonListener implements InitializingBean {

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private ServletContext servletContext;
	
	@Resource
	private RegionDAO regionDAO;
	
	@Resource
	private TypeDAO typeDAO;
	
	@Resource
	private JobTypeDAO jobTypeDAO;
	
	@Resource
	private RegionDAOJDBC regionDAOJDBC;
	
	public void cacheDatas(){
		logger.info("init ...");
		
		//type的map
		List<Type> list = typeDAO.getAll();
		Map<String, Type> map = new TreeMap<String, Type>();
		for(Type t : list){
			map.put(t.getTypeCode(), t);
		}
		servletContext.setAttribute(Consts.TYPE_MAP, map);
		Parameter.typemap.putAll(map);
		
		//兼职类，编号对应拼音
		map = new TreeMap<String, Type>();
		for(Type t : list){
			map.put(t.getTypeId(), t);
		}
		servletContext.setAttribute(Consts.TYPE_MAP_PINYIN, map);
		Parameter.typemap_py.putAll(map);
		
		//job type
		List<JobType> list2 = jobTypeDAO.findAll();
		Map<String, JobType> map2 = new TreeMap<String, JobType>();
		for(JobType t : list2){
			map2.put(t.getTypeCode(), t);
		}
		servletContext.setAttribute(Consts.JOB_TYPE_MAP, map2);
		Parameter.jobtypemap.putAll(map2);
		
		//全职类，编号对应拼音
		map2 = new TreeMap<String, JobType>();
		for(JobType t : list2){
			map2.put(t.getTypeId(), t);
		}
		servletContext.setAttribute(Consts.JOB_TYPE_MAP_PINYIN, map2);
		Parameter.jobtypemap_py.putAll(map2);
		
		
		//城市，编号对应拼音缓存
		List<Region> cityList = regionDAOJDBC.getAllCityandAreas();
		Map<String, Region> map3 = new TreeMap<String, Region>();
		for(Region c : cityList){
			map3.put(c.getCityId(), c);
		}
		servletContext.setAttribute(Consts.CITY_MAP_PINYIN, map3);
		Parameter.citymap_py.putAll(map3);
		
		//城市，拼音对应编号缓存
		map3 = new TreeMap<String, Region>();
		for(Region c : cityList){
			map3.put(c.getCityCode(), c);
		}
		servletContext.setAttribute(Consts.CITY_MAP_BIANHAO, map3);
		Parameter.citymap_bh.putAll(map3);
		
	}
	
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
		//缓存数据
		cacheDatas();
		
		//生成首页
		//htmlBuildService.indexBuildHtml();
	}


}
