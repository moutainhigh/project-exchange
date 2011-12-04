package com.throne212.wz.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.wz.common.Consts;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {

	}

	public void contextInitialized(ServletContextEvent e) {
		ApplicationContext ac = (ApplicationContext) e.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		
		ServletContext app = e.getServletContext();
		app.setAttribute(Consts.APP_PATH, app.getContextPath());
		app.setAttribute(Consts.APP_TITLE, "网上兼职,网络兼职 - 兼职吧网赚中心");
		logger.info("this system title is : " + app.getAttribute(Consts.APP_TITLE)+" and appPath is " + app.getAttribute(Consts.APP_PATH));		
		
	}

}
