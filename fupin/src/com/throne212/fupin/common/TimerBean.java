package com.throne212.fupin.common;

import java.util.Calendar;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.dao.ReportDao;

public class TimerBean extends QuartzJobBean {
	
	private int timeout;
	private ReportBiz reportBiz;
	
	/**
	 * Setter called after the ExampleJob is instantiated with the value from
	 * the JobDetailBean (5)
	 */
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}
	
	public void setReportBiz(ReportBiz reportBiz) {
		this.reportBiz = reportBiz;
	}

	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH);
		if(day == 11)
			reportBiz.autoSaveReports(year, month);
	}
}
