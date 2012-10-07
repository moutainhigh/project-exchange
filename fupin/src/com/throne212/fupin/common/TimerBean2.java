package com.throne212.fupin.common;

import java.util.Calendar;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.throne212.fupin.biz.DangReportBiz;
//dang_report
public class TimerBean2 extends QuartzJobBean {
	
	private int timeout;
	private DangReportBiz dangReportBiz;
	
	/**
	 * Setter called after the ExampleJob is instantiated with the value from
	 * the JobDetailBean (5)
	 */
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	
	public DangReportBiz getDangReportBiz() {
		return dangReportBiz;
	}

	public void setDangReportBiz(DangReportBiz dangReportBiz) {
		this.dangReportBiz = dangReportBiz;
	}

	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		Calendar now = Calendar.getInstance();
		int nowDay = now.get(Calendar.DAY_OF_MONTH);
		//last month
		Calendar last = Calendar.getInstance();
		last.setTimeInMillis(now.getTimeInMillis() - 30L * 24 * 60 * 60 * 1000);
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH);
		if(nowDay >= 11)
			dangReportBiz.autoSaveReports(year, month);
	}
}
