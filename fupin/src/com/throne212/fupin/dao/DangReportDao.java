package com.throne212.fupin.dao;

import java.util.List;

import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;

public interface DangReportDao extends BaseDao {

	public DangReport getReport(Org org, Cun cun, Integer year, String time);
	
	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile) ;
	
	public List<String[]> statReport(ReportParam reportParam);
	
	public void autoSaveReports(int year, int month);

}
