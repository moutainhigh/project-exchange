package com.throne212.fupin.biz.impl;

import java.io.File;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.FamilyDao;
import com.throne212.fupin.dao.ReportDao;
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
				// 生成季度的
				int month = Integer.valueOf(r.getTime());
				int time = month % 3 == 0 ? month / 3 : month / 3 + 1;
				Report reportSeason = reportDao.getReport(reportType, org, cun, r.getYear(), "season", time + "");
				if(reportSeason.getLock() == null || reportSeason.getLock() == 0){
					int minMonth = time * 3 - 2;
					int maxMonth = time * 3;
					clearItems(reportSeason);
					for (int m = minMonth; m <= maxMonth; m++) {
						Report mReport = reportDao.getReport(reportType, org, cun, r.getYear(), "month", m + "");
						addItems(reportSeason,mReport);
						//特殊字段处理
						if(maxMonth == m && "1".equals(reportType)){
							reportSeason.setItem13(mReport.getItem13());
							reportSeason.setItem14(mReport.getItem14());
						}else{
							reportSeason.setItem13("");
							reportSeason.setItem14("");
						}
					}
					clearItemsZero(reportSeason);
					reportDao.saveOrUpdate(reportSeason);
				}
				
				
				// 生成年度的
				Report reportYear = reportDao.getReport(reportType, org, cun, r.getYear(), "year", null);
				if(reportYear.getLock() == null || reportYear.getLock() == 0){	
					clearItems(reportYear);
					for (int m = 1; m <= 12; m++) {
						Report mReport = reportDao.getReport(reportType, org, cun, r.getYear(), "month", m + "");
						addItems(reportYear,mReport);
						//特殊字段处理
						if(12 == m && "1".equals(reportType)){
							reportYear.setItem13(mReport.getItem13());
							reportYear.setItem14(mReport.getItem14());
						}else{
							reportYear.setItem13("");
							reportYear.setItem14("");
						}
					}
					clearItemsZero(reportYear);
					reportDao.saveOrUpdate(reportYear);
				}

			}

			return report;
		}
		return null;
	}

	private void clearItems(Report report) {
		for (int i = 1; i <= 60; i++) {
			report.setItem(i, "");
		}
	}
	private void addItems(Report report,Report mReport) {
		for (int i = 1; i <= 60; i++) {
			try {
				Double temp = 0.0;
				//原来的item的值
				if(Util.isEmpty(report.getItem(i))){
					temp = 0.0;
				}else{
					temp = Double.valueOf(report.getItem(i));
				}
				//月份的item的值
				if(Util.isEmpty(mReport.getItem(i))){
					temp += 0.0;
				}else{
					temp += Double.valueOf(mReport.getItem(i));
				}
				report.setItem(i, temp+"");
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
	}
	private void clearItemsZero(Report report) {
		for (int i = 1; i <= 60; i++) {
			if("0.0".equals(report.getItem(i))){
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
			if (report.getId() != null)
				return report;
		}
		return null;
	}

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

			r.setItem30(cun.getIncome() == null ? "" : cun.getIncome() + "");
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
			//打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			if("1".equals(reportType)){
				fillReportRow1(7, workbook, org, cun, report,false);
				if(!"year".equals(r.getType())){
					fillReportRow1(8, workbook, org, cun, reportDao.getReport(reportType, org, cun, year, "year", null),true);
				}
			}else if("2".equals(reportType)){
				fillReportRow2(7, workbook, org, cun, report,false);
				if(!"year".equals(r.getType())){
					fillReportRow2(8, workbook, org, cun, reportDao.getReport(reportType, org, cun, year, "year", null),true);
				}
			}
			//关闭
			workbook.write();
			workbook.close();
			rw.close();
			return targetFile;
		}
		
		return null;
	}

	public void fillReportRow1(int row, WritableWorkbook workbook, Org org, Cun cun, Report report,boolean leiji) throws Exception {
		
		WritableSheet sheet1 = workbook.getSheet(0);
		WritableSheet sheet2 = workbook.getSheet(1);

		// 装填sheet1
		if(leiji){
			sheet1.addCell(new Label(0, row, "累计"));
		}else{
			sheet1.addCell(new Label(0, row, org.getOrgName()));
			sheet1.addCell(new Label(1, row, cun.getName()));
		}
		for (int i = 2; i <= 30; i++) {
			sheet1.addCell(new Label(i, row, report.getItem(i - 1)));
		}

		// 装填sheet2
		sheet2.addCell(new Label(0, row, org.getOrgName()));
		sheet2.addCell(new Label(1, row, cun.getName()));
		for (int i = 2; i <= 30; i++) {
			sheet2.addCell(new Label(i, row, report.getItem(i + 28)));
		}

		
	}
	public void fillReportRow2(int row, WritableWorkbook workbook, Org org, Cun cun, Report report,boolean leiji) throws Exception {
		WritableSheet sheet1 = workbook.getSheet(0);
		// 装填sheet1
		if(leiji){
			sheet1.addCell(new Label(0, row, "累计"));
		}else{
			sheet1.addCell(new Label(0, row, org.getOrgName()));
			sheet1.addCell(new Label(1, row, cun.getName()));
		}
		for (int i = 2; i <= 10; i++) {
			sheet1.addCell(new Label(i, row, report.getItem(i - 1)));
		}
	}

}
