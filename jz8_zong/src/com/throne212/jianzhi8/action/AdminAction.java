package com.throne212.jianzhi8.action;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.hibernate.SessionFactory;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.JZWords;
import com.throne212.jianzhi8.domain.JobType;
import com.throne212.jianzhi8.domain.Link;
import com.throne212.jianzhi8.domain.Region;
import com.throne212.jianzhi8.domain.Type;
import com.throne212.jianzhi8.listener.CommonListener;
import com.throne212.jianzhi8.service.HtmlBuildService;

@ParentPackage("adminPackage")
public class AdminAction extends ActionSupport {
	
	@Resource
	private HtmlBuildService htmlBuildService;
	@Resource
	private FreemarkerManager freemarkerManager;
	@Resource
	private ServletContext servletContext;
	@Resource
	private SessionFactory sessionFactory;
	@Resource
	private CommonListener commonListener;
	
	private String msg;
	
	public String build(){
		try{
			htmlBuildService.indexBuildHtml();
			msg = "生成HTML成功!";
		} catch(Exception e){
			e.printStackTrace();
			msg = "出现，异常：" + e.getMessage();
		}
		return "result";
	}
	
	// 刷新所有缓存
	public String flush() {
		try {
			flushMemcachedCache();
			freemarkerManager.getConfiguration(servletContext).clearTemplateCache();
			freemarkerManager.getConfiguration(servletContext).clearSharedVariables();
			freemarkerManager.getConfiguration(servletContext).clearEncodingMap();
			freemarkerManager.getConfig().clearTemplateCache();
			commonListener.cacheDatas();
			msg = "刷新缓存成功!";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "刷新缓存失败，异常：" + e.getMessage();
		}
		return "result";
	}
	
	// 更新memcached缓存
	private void flushMemcachedCache() {
		sessionFactory.evictQueries();
		sessionFactory.evictEntity(Content.class.getSimpleName());
		sessionFactory.evictEntity(JobType.class.getSimpleName());
		sessionFactory.evictEntity(JZWords.class.getSimpleName());
		sessionFactory.evictEntity(Link.class.getSimpleName());
		sessionFactory.evictEntity(Region.class.getSimpleName());
		sessionFactory.evictEntity(Type.class.getSimpleName());
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
