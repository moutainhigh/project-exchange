package com.throne212.fupin.dao;

import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;

public interface ReportDao extends BaseDao {

	public Report getReport(String reportType, Org org, Cun cun, Integer year, String type, String time);

	public String getExportReportData(ReportParam reportParam, String sourceFile, String targetFile);

}
