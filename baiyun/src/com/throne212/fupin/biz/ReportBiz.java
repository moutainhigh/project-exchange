package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.dataobject.Report1Stat;
import com.throne212.fupin.domain.Report;

public interface ReportBiz extends BaseBiz {

	public Report saveReport(Report r, String reportType);

	public Report getReport(String reportType, Integer year, String type, String time);

	public void fillReport(Report r);

	public void requestUnlock(Report r, String reportType);

	public String getExcelReportFilePath(Report r, String reportType) throws Exception;

	public String getExcelReportFilePath(ReportParam reportParam) throws Exception;

	public List<Report1Stat> getReport1Stat();

	// 汇总查询
	public PageBean getProStat(Class statClass,Integer year,Integer month, Integer pageIndex);
}
