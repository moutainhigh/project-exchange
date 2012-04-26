package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.dataobject.ProCunStat;
import com.throne212.fupin.dataobject.ProZdStat;
import com.throne212.fupin.dataobject.Report1Stat;
import com.throne212.fupin.dataobject.Report3Stat;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report3;

public interface ReportBiz extends BaseBiz {

	public Report saveReport(Report r, String reportType);

	public Report getReport(String reportType, Integer year, String type, String time);
	
	public List<Report3> getReport3(Integer year, String type, String time);
	public Report getReport(String reportType, Integer year, String type, String time,Long cunId);

	public void fillReport(Report r);

	public void requestUnlock(Report r, String reportType);

	public String getExcelReportFilePath(Report r, String reportType) throws Exception;

	public String getExcelReportFilePath(ReportParam reportParam) throws Exception;

	public List<Report1Stat> getReport1Stat(int year);
	public List<Report3Stat> getReport3Stat(int year);
	public List<ProCunStat> getProCunStat(int year);
	public List<ProZdStat> getProZdStat(int year);
	
	public PageBean sumReport1(Long zhenId,Long cunId,int year,int month);
	public Object[] sumReport1Num(Long zhenId,Long cunId,int year,int month);

	// 汇总查询
	public PageBean getProStat(Class statClass,Integer year,Integer month, Integer pageIndex);
	public List<ProjectCunStat> getProStat(Class statClass,Integer year,Integer month);
	
	public PageBean getProCunStat(Integer year, Integer month);
	public PageBean getProCunStat(Long zhenId, Long cunId, Integer year, Integer month,Long orgId, String proName);
	public PageBean getReport3(Integer year, String type, String time, Long orgId, String proName, Long zhenId, Long cunId);
	public PageBean getProStat(Class statClass, Integer year, Integer month, Integer pageIndex, Long orgId, String proName);
	public PageBean getProZdStat(Integer year, Integer month,Long orgId, String proName);
}
