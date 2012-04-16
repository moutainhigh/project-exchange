package com.throne212.jianzhi8.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.apache.struts2.views.freemarker.FreemarkerManager;
import org.springframework.stereotype.Service;

import com.throne212.jianzhi8.common.HtmlConfig;
import com.throne212.jianzhi8.dao.LinkDAO;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service("htmlBuildService")
public class HtmlBuildService {
	
	private static int buildTime = 0;
	
	private static String templatePath = null;

	public static String getTemplatePath() {
		if(templatePath != null)
			return templatePath;
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "WEB-INF/template/";
		templatePath = path;
		return path;
	}

	private Logger logger = Logger.getLogger(this.getClass());

	@Resource
	private FreemarkerManager freemarkerManager;
	
	@Resource
	private ServletContext servletContext;
	
	@Resource
	private LinkDAO linkDAO;
	
	
	public void buildHtml(String templateFilePath, String htmlFilePath, Map<String, Object> data) {
		try {
			Configuration configuration = freemarkerManager.getConfiguration(servletContext);
			
			// debug cfgs
			//logger.debug(configuration.getLocale());
			//logger.debug(configuration.getEncoding(configuration.getLocale()));
			
			configuration.setDirectoryForTemplateLoading(new File(getTemplatePath()));
			Template template = configuration.getTemplate(templateFilePath);
			//File htmlFile = new File(servletContext.getRealPath("html/" + htmlFilePath));
			File htmlFile = new File(getTemplatePath() + htmlFilePath);
			File htmlDirectory = htmlFile.getParentFile();
			if (!htmlDirectory.exists()) {
				htmlDirectory.mkdirs();
			}
			Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(htmlFile), "GBK"));
			template.process(data, out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	}

	public Map<String, Object> getCommonData() {
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
	public void indexBuildHtml() {
		// 构建模板配置
		HtmlConfig htmlConfig = new HtmlConfig();
		htmlConfig.setName("首页");
		htmlConfig.setDescription("首页HTML模板");
		htmlConfig.setTemplateFilePath("index.ftl");
		
		htmlConfig.setHtmlFilePath("index.html");
		//获取通用数据
		Map<String, Object> data = getCommonData();
		
		//检查模板路径和生成HTML文件的路径
		String htmlFilePath = htmlConfig.getHtmlFilePath();
		String templateFilePath = htmlConfig.getTemplateFilePath();
		logger.info("Buliding index html\n" + htmlFilePath + "\n" + templateFilePath);
		buildHtml(templateFilePath, htmlFilePath, data);
	}
}
