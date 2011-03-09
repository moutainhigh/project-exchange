package com.throne212.siliao.listener;

import java.util.Date;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.UserLog;

public class CommonListener implements ServletContextListener {

	private Logger logger = Logger.getLogger(this.getClass());

	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	public void contextInitialized(ServletContextEvent e) {
		// 设置上下文路径
		String appPath = e.getServletContext().getContextPath();
		logger.info("appPath=" + appPath);
		if (!appPath.equals("/")) {
			appPath = appPath + "/";
		}
		e.getServletContext().setAttribute(WebConstants.APP_PATH, appPath);
		// 设置系统名称
		e.getServletContext().setAttribute(WebConstants.APP_TITLE, "饲料管理系统");

		// 插入系统管理员sa
		ApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(e.getServletContext());
		BaseBiz baseBiz = (BaseBiz) ac.getBean("baseBiz");
		if (baseBiz.getAll(Admin.class) == null || baseBiz.getAll(Admin.class).size() == 0) {
			Admin admin = new Admin();
			admin.setLoginName("sa");
			admin.setPassword("123");
			admin.setName("超级管理员");
			admin.setRemark("系统最高管理员，拥有一切权限");
			baseBiz.saveOrUpdateEntity(admin);

			UserLog log = new UserLog();
			log.setByWho(admin);
			log.setCreateDate(new Date());
			log.setCreateName(admin.getName());
			log.setEnable(true);
			log.setLogTime(new Date());
			log.setMsg(WebConstants.OP_CREATE);
			log.setUser(admin);
			baseBiz.saveOrUpdateEntity(log);
		}
	}

}
