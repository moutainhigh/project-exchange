package com.throne212.jianzhi8.service;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

public class HtmlBuildTimerBean extends QuartzJobBean {
	
	private HtmlBuildService htmlBuildService;
	
	private int timeout;
	
	/**
	 * Setter called after the ExampleJob is instantiated with the value from
	 * the JobDetailBean (5)
	 */
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	
	public void setHtmlBuildService(HtmlBuildService htmlBuildService) {
		this.htmlBuildService = htmlBuildService;
	}

	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		// do the actual work
		htmlBuildService.indexBuildHtml();
	}
}
