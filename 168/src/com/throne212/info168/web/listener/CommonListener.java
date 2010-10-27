package com.throne212.info168.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.throne212.info168.web.common.WebConstants;

public class CommonListener implements ServletContextListener{

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	public void contextInitialized(ServletContextEvent e) {
		//设置上下文路径
		e.getServletContext().setAttribute(WebConstants.APP_PATH,e.getServletContext().getContextPath());
		e.getServletContext().setAttribute(WebConstants.APP_TITLE, "一路发分类信息系统");
		e.getServletContext().setAttribute(WebConstants.APP_DESC, "交友征婚，家政，招聘求职，房屋出租，跳蚤市场，二手车等生活分类信息尽在列表网。欢迎免费发布查询生活分类信息。");
		e.getServletContext().setAttribute(WebConstants.APP_KEY_WORDS, "分类信息 生活信息 分类广告 一路发");
	}

}
