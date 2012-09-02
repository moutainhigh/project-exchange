package com.throne212.fupin.biz.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.DangReportBiz;
import com.throne212.fupin.common.PinyinToolkit;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.DangReportDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

public class DangReportBizImpl extends BaseBizImpl implements DangReportBiz {

	private DangReportDao dangReportDao;

	public DangReportDao getDangReportDao() {
		return dangReportDao;
	}

	public void setDangReportDao(DangReportDao dangReportDao) {
		this.dangReportDao = dangReportDao;
	}

	public void requestUnlock(DangReport r) {
		// TODO Auto-generated method stub
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			DangReport report = dangReportDao.getReport(org, cun, r.getYear(), r.getTime());
			report.setLock(2);// 2表示请求解锁
			dangReportDao.saveOrUpdate(report);
		}
	}

	public DangReport getReport(Integer year, String time) {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			DangReport report = dangReportDao.getReport(org, cun, year, time);
			//if (report.getId() != null)
			return report;
		}
		return null;
	}

	public void fillReport(DangReport r) {
		// TODO Auto-generated method stub
		
	}

	public DangReport saveReport(DangReport r) {
		// TODO Auto-generated method stub
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			Cun cun = org.getCun();
			DangReport report = dangReportDao.getReport(org, cun, r.getYear(), r.getTime());
			for (int i = 1; i <= 60; i++) {
				report.setItem(i, r.getItem(i));
			}
			report.setCun(cun);
			report.setOrg(org);
			report.setYear(r.getYear());
			report.setTime(r.getTime());
			report.setLock(1);// 1表示已经锁定
			report.setDate(r.getDate());
			dangReportDao.saveOrUpdate(report);
			return report;
		}
		return null;
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
		String srcFileName = "report_dang";
		String tgtFileName = "report_dang_" + PinyinToolkit.cn2Pinyin(reportParam.getAreaName()) + "_" + reportParam.getName();
		String sourceFile = path + File.separator + srcFileName + ".xls";
		String targetFile = path + File.separator + tgtFileName + "_" + Util.getDate(new Date()) + ".xls";

		return dangReportDao.getExportReportData(reportParam, sourceFile, targetFile);
	}

	public List<String[]> statReport(ReportParam reportParam) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public String getExcelReportFilePath(DangReport r) throws Exception{
		// 获取参数
		Integer year = r.getYear();
		String time = r.getTime();

		// 文件拷贝
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		String sourceFile = path + File.separator + "report_dang" + ".xls";
		String targetFile = path + File.separator + "report_dang" + "_" + year + time + ".xls";

		// 获取数据
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		Cun cun = org.getCun();
		DangReport report = dangReportDao.getReport(org, cun, year, time);

		if (report != null && report.getId() != null) {
			// 打开excel文件
			Workbook rw = Workbook.getWorkbook(new File(sourceFile));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile), rw);
			WritableSheet sheet1 = workbook.getSheet(0);
			
			WritableCellFormat headerFormat = new WritableCellFormat();
			//水平居中对齐
            headerFormat.setAlignment(Alignment.CENTRE);
            //竖直方向居中对齐
            headerFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            WritableFont wf = new WritableFont(WritableFont.ARIAL, 15,
            	     WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,
            	     jxl.format.Colour.BLACK); // 定义格式 字体 下划线 斜体 粗体 颜色
            headerFormat.setFont(wf);
			
			Label l = new Label(1, 0, cun.getZhen().getArea().getName()+cun.getZhen().getName()+cun.getName()+"党组织和党员情况明细表", headerFormat);
			sheet1.addCell(l);
			l = new Label(3, 1, year + "-" + time, headerFormat);
			sheet1.addCell(l);
			
			WritableCellFormat cellFormat = new WritableCellFormat();
			//水平居中对齐
			cellFormat.setAlignment(Alignment.CENTRE);
            //竖直方向居中对齐
			cellFormat.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.THIN); 
			cellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);
            WritableFont cellWf = new WritableFont(WritableFont.ARIAL, 12,
            	     WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE,
            	     jxl.format.Colour.BLACK); // 定义格式 字体 下划线 斜体 粗体 颜色
            cellFormat.setFont(cellWf);
			int i = 1;
			for(int row=4;row<=52;row++){
				if(row == 18 || row == 32 || row == 43)
					continue;
				sheet1.addCell(new Label(4, row, report.getItem(i++), cellFormat));
			}
			
			String lastStr = "统计截至"+Util.getDate2(report.getDate())+",    填报人："+report.getItem47()+"       联系电话：" + report.getItem48();
			sheet1.addCell(new Label(0, 53, lastStr, cellFormat));
			
			// 关闭
			workbook.write();
			workbook.close();
			rw.close();
			return targetFile;
		}

		return null;
	}


}
