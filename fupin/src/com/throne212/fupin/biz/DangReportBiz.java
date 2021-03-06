package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.domain.DangReport;


public interface DangReportBiz extends BaseBiz {

	public void requestUnlock(DangReport r);
	
	public DangReport getReport(Integer year, String time);
	
	public void fillReport(DangReport r);
	
	public DangReport saveReport(DangReport r);
	
	public String getExcelReportFilePath(ReportParam reportParam) throws Exception;
	
	public String getExcelReportFilePath(DangReport r) throws Exception;
	
	public List<String[]> statReport(ReportParam reportParam);
	
	public void autoSaveReports(int year, int month);
	
}