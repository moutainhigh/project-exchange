package com.throne212.jianzhi8.action;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.ActionSupport;
import com.throne212.jianzhi8.service.HtmlBuildService;

@ParentPackage("basePackage")
public class IndexAction extends ActionSupport {
	
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Resource
	private HtmlBuildService htmlBuildService;

	public String execute(){
		String htmlFile = HtmlBuildService.getTemplatePath() + "index.html";
		if(!new File(htmlFile).exists()){
			logger.warn("index file not extist: " + htmlFile);
			htmlBuildService.indexBuildHtml();
		}
		return "html";
	}

}
