package com.throne212.fupin.biz.impl;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.PinyinToolkit;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.FamilyDao;
import com.throne212.fupin.dao.ReportDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.User;

public class ReportBizImpl extends BaseBizImpl implements ReportBiz {

	private ReportDao reportDao;
	private FamilyDao familyDao;

	public FamilyDao getFamilyDao() {
		return familyDao;
	}

	public void setFamilyDao(FamilyDao familyDao) {
		this.familyDao = familyDao;
	}

	public ReportDao getReportDao() {
		return reportDao;
	}

	public void setReportDao(ReportDao reportDao) {
		this.reportDao = reportDao;
	}

	public Report saveReport(Report r, String reportType) {
		if ("year".equals(r.getType())) {
			r.setTime(null);
		}
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			Report report = reportDao.getReport(reportType, org, cun, r.getYear(), r.getType(), r.getTime());
			for (int i = 1; i <= 60; i++) {
				report.setItem(i, r.getItem(i));
			}
			report.setCun(cun);
			report.setOrg(org);
			report.setYear(r.getYear());
			report.setType(r.getType());
			report.setTime(r.getTime());
			report.setLock(1);// 1表示已经锁定
			reportDao.saveOrUpdate(report);

			// 如果是月份的报表，则生成季度和年份的报表
			if ("month".equals(r.getType())) {
				generateSeasonAndYear(reportType, org, cun, r);
			}

			return report;
		}
		return null;
	}

	private void generateSeasonAndYear(String reportType, Org org, Cun cun, Report r) {
		// 生成季度的
		int month = Integer.valueOf(r.getTime());
		int time = month % 3 == 0 ? month / 3 : month / 3 + 1;
		Report reportSeason = reportDao.getReport(reportType, org, cun, r.getYear(), "season", time + "");
		int minMonth = time * 3 - 2;
		int maxMonth = time * 3;
		clearItems(reportSeason);
		for (int m = minMonth; m <= maxMonth; m++) {
			Report mReport = reportDao.getReport(reportType, org, cun, r.getYear(), "month", m + "");
			addItems(reportSeason, mReport);
			// 特殊字段处理
			if (maxMonth == m && "1".equals(reportType)) {
				reportSeason.setItem13(mReport.getItem13());
				reportSeason.setItem14(mReport.getItem14());
				reportSeason.setItem31(mReport.getItem31());
				fillReport(reportSeason);
			} else if (maxMonth == m && "2".equals(reportType)) {
				reportSeason.setItem1(mReport.getItem1());
			} else {
				reportSeason.setItem13("");
				reportSeason.setItem14("");
			}
		}
		clearItemsZero(reportSeason);
		reportDao.saveOrUpdate(reportSeason);

		// 生成年度的
		Report reportYear = reportDao.getReport(reportType, org, cun, r.getYear(), "year", null);
		clearItems(reportYear);
		for (int m = 1; m <= 12; m++) {
			Report mReport = reportDao.getReport(reportType, org, cun, r.getYear(), "month", m + "");
			addItems(reportYear, mReport);
			// 特殊字段处理
			if (12 == m && "1".equals(reportType)) {
				reportYear.setItem13(mReport.getItem13());
				reportYear.setItem14(mReport.getItem14());
				reportYear.setItem31(mReport.getItem31());
				fillReport(reportYear);
			} else if (12 == m && "2".equals(reportType)) {
				reportYear.setItem1(mReport.getItem1());
			} else {
				reportYear.setItem13("");
				reportYear.setItem14("");
			}
		}
		clearItemsZero(reportYear);
		reportDao.saveOrUpdate(reportYear);
	}

	private void clearItems(Report report) {
		for (int i = 1; i <= 60; i++) {
			report.setItem(i, "");
		}
	}

	private void addItems(Report report, Report mReport) {
		for (int i = 1; i <= 60; i++) {
			try {
				Double temp = 0.0;
				// 原来的item的值
				if (Util.isEmpty(report.getItem(i))) {
					temp = 0.0;
				} else {
					temp = Double.valueOf(report.getItem(i));
				}
				// 月份的item的值
				if (Util.isEmpty(mReport.getItem(i))) {
					temp += 0.0;
				} else {
					temp += Double.valueOf(mReport.getItem(i));
				}
				report.setItem(i, temp + "");
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
	}

	private void clearItemsZero(Report report) {
		for (int i = 1; i <= 60; i++) {
			if ("0.0".equals(report.getItem(i))) {
				report.setItem(i, null);
			}
		}
	}

	public Report getReport(String reportType, Integer year, String type, String time) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			Report report = reportDao.getReport(reportType, org, cun, year, type, time);
			//if (report.getId() != null)
			return report;
		}
		return null;
	}

	// 显示最新的cun的数据
	public void fillReport(Report r) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			cun = reportDao.getEntityById(Cun.class, cun.getId());
			// Long familySum = reportDao.getEntitySum(Family.class, "cun",
			// cun);
			r.setItem1(cun.getPoorFamilyNum() == null ? "" : cun.getPoorFamilyNum() + "");
			// Long personSum = familyDao.getPersonSum(cun);
			r.setItem2(cun.getPoorPersonNum() == null ? "" : cun.getPoorPersonNum() + "");

			r.setItem3(cun.getPoorFamilyNum1() == null ? "" : cun.getPoorFamilyNum1() + "");
			r.setItem4(cun.getPoorPersonNum1() == null ? "" : cun.getPoorPersonNum1() + "");
			r.setItem5(cun.getPoorFamilyNum3() == null ? "" : cun.getPoorFamilyNum3() + "");
			r.setItem6(cun.getPoorPersonNum3() == null ? "" : cun.getPoorPersonNum3() + "");
			r.setItem7(cun.getPoorFamilyNum2() == null ? "" : cun.getPoorFamilyNum2() + "");
			r.setItem8(cun.getPoorPersonNum2() == null ? "" : cun.getPoorPersonNum2() + "");
			r.setItem9(cun.getPoorFamilyNum4() == null ? "" : cun.getPoorFamilyNum4() + "");
			r.setItem10(cun.getPoorPersonNum4() == null ? "" : cun.getPoorPersonNum4() + "");
			r.setItem11(cun.getWeiHouse() == null ? "" : cun.getWeiHouse() + "");

			//if(Util.isEmpty(r.getItem30()))
			r.setItem30(cun.getIncome() == null ? "" : cun.getIncome() + "");
			// if("0".equals(r.getItem30())){
			// r.setItem30("");
			// }
		}
	}

	public void requestUnlock(Report r, String reportType) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			Report report = reportDao.getReport(reportType, org, cun, r.getYear(), r.getType(), r.getTime());
			report.setLock(2);// 2表示请求解锁
			reportDao.saveOrUpdate(report);
		}
	}

	public String getExcelReportFilePath(Report r, String reportType) throws Exception {
		// 获取参数
		Integer year = r.getYear();
		String type = r.getType();
		String time = r.getTime();

		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		String sourceFile = path + File.separator + "report" + reportType + ".xls";
		String targetFile = path + File.separator + "report" + reportType + "_" + year + type + time + ".xls";

		// 获取数据
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = org.getCun();
		Report report = reportDao.getReport(reportType, org, cun, year, type, time);

		if (report != null && report.getId() != null) {
			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			if ("1".equals(reportType)) {
				// 重新更新一下季度和年度的数据
				if ("year".equals(report.getType()) || "season".equals(report.getType())) {
					generateSeasonAndYear("1", org, cun, reportDao.getReport("1", org, cun, year, "month", "6"));
				}
				// 日期类型
				String str = year + "年";
				if ("season".equals(report.getType())) {
					str += time + "季";
				} else if ("month".equals(report.getType())) {
					str += time + "月";
				}
				WritableSheet sheet1 = workbook.getSheet(0);
				WritableSheet sheet2 = workbook.getSheet(1);
				sheet1.addCell(new Label(0, 2, str));
				sheet2.addCell(new Label(0, 2, str));
				fillReportRow1(7, workbook, org, cun, report, false);
				if (!"year".equals(report.getType())) {
					Report leijiReport = reportDao.getReport(reportType, org, cun, year, "year", null);
					// 特殊字段处理
					if ("season".equals(report.getType())) {
						leijiReport.setItem13(report.getItem13());
						leijiReport.setItem14(report.getItem14());
						leijiReport.setItem31(report.getItem31());
					}
					// fillReportRow1(8, workbook, org, cun, leijiReport,true);
				}
			} else if ("2".equals(reportType)) {
				// 重新更新一下季度和年度的数据
				if ("year".equals(report.getType()) || "season".equals(report.getType())) {
					generateSeasonAndYear("2", org, cun, reportDao.getReport("2", org, cun, year, "month", "6"));
				}
				// 日期类型
				String str = year + "年";
				if ("season".equals(report.getType())) {
					str += time + "季";
				} else if ("month".equals(report.getType())) {
					str += time + "月";
				}
				WritableSheet sheet1 = workbook.getSheet(0);
				sheet1.addCell(new Label(0, 2, str));
				fillReportRow2(6, workbook, org, cun, report, false);
				if (!"year".equals(report.getType())) {
					// fillReportRow2(7, workbook, org, cun,
					// reportDao.getReport(reportType, org, cun, year, "year",
					// null),true);
				}
			}
			// 关闭
			workbook.write();
			workbook.close();
			rw.close();
			return targetFile;
		}

		return null;
	}

	public void fillReportRow1(int row, WritableWorkbook workbook, Org org, Cun cun, Report report, boolean leiji) throws Exception {

		WritableSheet sheet1 = workbook.getSheet(0);
		WritableSheet sheet2 = workbook.getSheet(1);

		// 装填sheet1
		if (leiji) {
			sheet1.addCell(new Label(0, row, "累计"));
		} else {
			sheet1.addCell(new Label(0, row, org.getOrgName()));
			sheet1.addCell(new Label(1, row, cun.getName()));
		}
		for (int i = 2; i <= 30; i++) {
			sheet1.addCell(new Label(i, row, report.getItem(i - 1)));
		}

		// 装填sheet2
		if (leiji) {
			sheet2.addCell(new Label(0, row, "累计"));
		} else {
			sheet2.addCell(new Label(0, row, org.getOrgName()));
			sheet2.addCell(new Label(1, row, cun.getName()));
		}
		for (int i = 2; i <= 30; i++) {
			sheet2.addCell(new Label(i, row, report.getItem(i + 28)));
		}

	}

	public void fillReportRow2(int row, WritableWorkbook workbook, Org org, Cun cun, Report report, boolean leiji) throws Exception {
		WritableSheet sheet1 = workbook.getSheet(0);
		// 装填sheet1
		if (leiji) {
			sheet1.addCell(new Label(0, row, "累计"));
		} else {
			sheet1.addCell(new Label(0, row, org.getOrgName()));
			sheet1.addCell(new Label(1, row, cun.getName()));
		}
		for (int i = 2; i <= 10; i++) {
			sheet1.addCell(new Label(i, row, report.getItem(i - 1)));
		}
	}

	public String getExcelReportFilePath(ReportParam reportParam) throws Exception {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof AreaWorkOrg) {
			String areaName = ((AreaWorkOrg)user).getArea().getName();
			reportParam.setAreaName(areaName);
		}
		
		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel" + File.separator + "export";
		String srcFileName = "report_" + reportParam.getName();
		String tgtFileName = "report-" + PinyinToolkit.cn2Pinyin(reportParam.getAreaName()) + "_" + reportParam.getName();
		String sourceFile = path + File.separator + srcFileName + ".xls";
		String targetFile = path + File.separator + tgtFileName + "_" + Util.getDate(new Date()) + ".xls";

		return reportDao.getExportReportData(reportParam, sourceFile, targetFile);
	}
	
	public List<String[]> statReport(ReportParam reportParam) throws Exception {
		return reportDao.statReport(reportParam);
	}
	
	public void autoSaveReports(int year, int month){
		reportDao.autoSaveReports(year, month);
	}

}
