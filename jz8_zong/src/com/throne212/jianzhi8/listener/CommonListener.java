package com.throne212.jianzhi8.listener;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;

public class CommonListener implements InitializingBean {

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private ServletContext servletContext;
	
	
	public void cacheDatas(){
		logger.info("init ...");
	}

	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
		//缓存数据
		cacheDatas();
		
		//生成首页
		//htmlBuildService.indexBuildHtml();
	}


}
