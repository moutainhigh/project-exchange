package com.throne212.fupin.dao;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.dataobject.ProCunStat;
import com.throne212.fupin.dataobject.Report1Stat;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report3;
import com.throne212.fupin.domain.Zhen;

public interface ReportDao extends BaseDao {

	public Report getReport(String reportType, Org org, Cun cun, Integer year, String type, String time);
	
	public List<Report3> getReport3(Integer year, String type, String time);
	public Report3 getReport3(Zhen zhen, Integer year, String type, String time);

	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile);
	
	public List<Report1Stat> getReport1Stat(int year);
	public List<ProCunStat> getProCunStat(int year);
	
	
	public PageBean getProStat(Class statClass, Integer year,Integer month,Integer pageIndex);

}
