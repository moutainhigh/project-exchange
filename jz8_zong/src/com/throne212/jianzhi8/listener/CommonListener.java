package com.throne212.jianzhi8.listener;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.service.HtmlBuildService;

public class CommonListener implements InitializingBean {

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private ServletContext servletContext;
	
	@Resource
	private HtmlBuildService htmlBuildService;
	
	@Resource
	private RegionDAO regionDAO;
	
	public void cacheDatas(){
		logger.info("init ...");
		//regionDAO.fi
		
	}
	
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
		//缓存数据
		cacheDatas();
		
		//生成首页
		htmlBuildService.indexBuildHtml();
	}


}
