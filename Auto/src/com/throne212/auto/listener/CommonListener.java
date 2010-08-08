package com.throne212.auto.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.auto.biz.BaseBiz;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.domain.Setting;


public class CommonListener implements ServletContextListener{
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	private ApplicationContext ac = null;

	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent e) {
		logger.info("Into application init function");
		
		ac = (ApplicationContext) e.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		Setting setting = baseBiz.getAll(Setting.class).get(0);
		
		ServletContext app = e.getServletContext();
		app.setAttribute(WebConstants.APP_PATH, app.getContextPath());
		app.setAttribute(WebConstants.APP_TITLE, setting.getPageTitle());
		logger.info("this system title is : " + app.getAttribute(WebConstants.APP_TITLE)+" and appPath is " + app.getAttribute(WebConstants.APP_PATH));
		
		
	}

}
