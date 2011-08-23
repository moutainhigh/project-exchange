package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.sun.faces.config.WebConfiguration;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report2;
import com.throne212.fupin.domain.User;

public class ReportAction extends BaseAction {

	private ReportBiz reportBiz;
	private Report r;
	private Integer maxMonth;
	private Integer maxSeason;

	// excel导出文件
	private InputStream downloadFile;

	// 导出Excel
	public String excelReport1() {
		if (r == null) {
			this.setMsg("导出Excel失败，请检查参数是否正确");
			return viewReport1();
		}
		String filePath = null;
		try {
			filePath = reportBiz.getExcelReportFilePath(r, "1");
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("report1_" + r.getYear() + "_" + r.getType() + "_" + r.getTime());
			} else {
				this.setMsg("报表文件生成失败，数据不完整或参数错误，请联系管理员");
				return viewReport1();
			}
		} catch (Exception e) {
			logger.error("报表文件生成失败", e);
			this.setMsg("报表文件生成失败，请联系管理员");
			return viewReport1();
		}
		return "excel";
	}

	// 解锁
	public String requstUnlock1() {
		reportBiz.requestUnlock(r, "1");
		this.setMsg("已经发送解锁请求");
		return viewReport1();
	}

	public String viewReport1() {
		
		//如果该单位用户未指定村帮扶，不能进行操作
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			Org org = (Org) user;
			if(org.getCun() == null){
				this.setMsg("未指定存帮扶，请联系管理员指定村帮扶以后再进行报表操作");
				return "report_edit1";
			}
		}
		
		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			r = reportBiz.getReport("1", year, type, time);
			if (r == null) {
				r = new Report1();
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
			}
		} else if (r != null && r.getId() == null) {// 按条件搜索
			Integer year = r.getYear();
			String type = r.getType();
			String time = r.getTime();
			Report report = reportBiz.getReport("1", year, type, time);
			if (report != null)
				r = report;
			else {
				r = new Report1();
				r.setYear(year);
				r.setType(type);
				r.setTime(time);
			}
		}

		// 最大的月份和季度
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);
		maxSeason = maxMonth % 3 == 0 ? maxMonth / 3 : maxMonth / 3 + 1;

		// 填充灰色项目
		reportBiz.fillReport(r);

		return "report_edit1";
	}

	public String tmpSaveReport1() {
		if (r != null && "month".equals(r.getType())) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport1();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport1();
			}
		}
		r = reportBiz.saveReport(r, "1");
		if (r == null) {
			this.setMsg("暂时保存报表失败");
		} else {
			r.setLock(3);// 3代表暂存
			reportBiz.saveOrUpdateEntity(r);
			this.setMsg("暂时报表保存成功");
		}
		return viewReport1();
	}

	public String saveReport1() {
		if (r != null && "month".equals(r.getType())) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport1();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport1();
			}
		}
		r = reportBiz.saveReport(r, "1");
		if (r == null) {
			this.setMsg("保存报表失败");
		} else {
			this.setMsg("报表保存成功");
		}
		return viewReport1();
	}

	// report2
	public String viewReport2() {
		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			r = reportBiz.getReport("2", year, type, time);
			if (r == null) {
				r = new Report2();
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
			}
		} else if (r != null && r.getId() == null) {// 按条件搜索
			Integer year = r.getYear();
			String type = r.getType();
			String time = r.getTime();
			Report report = reportBiz.getReport("2", year, type, time);
			if (report != null)
				r = report;
			else {
				r = new Report2();
				r.setYear(year);
				r.setType(type);
				r.setTime(time);
			}
		}

		// 最大的月份和季度
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);
		maxSeason = maxMonth % 3 == 0 ? maxMonth / 3 : maxMonth / 3 + 1;

		return "report_edit2";
	}

	public String saveReport2() {
		if (r != null && "month".equals(r.getType())) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport2();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport2();
			}
		}
		r = reportBiz.saveReport(r, "2");
		if (r == null) {
			this.setMsg("保存报表失败");
		} else {
			this.setMsg("报表保存成功");
		}
		return viewReport2();
	}

	public String tmpSaveReport2() {
		if (r != null && "month".equals(r.getType())) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport2();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport2();
			}
		}
		r = reportBiz.saveReport(r, "2");
		if (r == null) {
			this.setMsg("暂时保存报表失败");
		} else {
			r.setLock(3);// 3代表暂存
			reportBiz.saveOrUpdateEntity(r);
			this.setMsg("暂时报表保存成功");
		}
		return viewReport2();
	}

	public String requstUnlock2() {
		reportBiz.requestUnlock(r, "2");
		this.setMsg("已经发送解锁请求");
		return viewReport2();
	}

	// 报表列表，给sa用的
	private List<Report> reportList;

	public String reportList() {
		reportList = reportBiz.getEntitiesByColumn(Report.class, "lock", 2);
		return "report_list";
	}

	public String unlock() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				Report report = reportBiz.getEntityById(Report.class, Long.parseLong(idStr));
				report.setLock(0);// 0表示已经解锁
				reportBiz.saveOrUpdateEntity(report);
			}
			this.setMsg("成功解锁" + ids.length + "个报表");
		}
		return reportList();
	}

	// 导出Excel2
	public String excelReport2() {
		if (r == null) {
			this.setMsg("导出Excel失败，请检查参数是否正确");
			return viewReport2();
		}
		String filePath = null;
		try {
			filePath = reportBiz.getExcelReportFilePath(r, "2");
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("report2_" + r.getYear() + "_" + r.getType() + "_" + r.getTime());
			} else {
				this.setMsg("报表文件生成失败，数据不完整或参数错误，请联系管理员");
				return viewReport2();
			}
		} catch (Exception e) {
			logger.error("报表文件生成失败", e);
			this.setMsg("报表文件生成失败，请联系管理员");
			return viewReport2();
		}
		return "excel";
	}

	private ReportParam reportParam;

	public String export() {
		if (reportParam == null)
			return "report_export";
		String filePath = null;
		try {
			filePath = reportBiz.getExcelReportFilePath(reportParam);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("report-" + reportParam.getDiqu() + "_" + reportParam.getIs206() + "_" + reportParam.getName());
				return "excel";
			} else {
				this.setMsg("报表文件生成失败，数据不完整或参数错误，请联系管理员");
			}
		} catch (Exception e) {
			logger.error("报表文件生成失败", e);
			this.setMsg("报表文件生成失败，请联系管理员");
		}
		return "report_export";
	}

	public Report getR() {
		return r;
	}

	public void setR(Report r) {
		this.r = r;
	}

	public ReportBiz getReportBiz() {
		return reportBiz;
	}

	public void setReportBiz(ReportBiz reportBiz) {
		this.reportBiz = reportBiz;
	}

	public List<Report> getReportList() {
		return reportList;
	}

	public void setReportList(List<Report> reportList) {
		this.reportList = reportList;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public Integer getMaxMonth() {
		return maxMonth;
	}

	public void setMaxMonth(Integer maxMonth) {
		this.maxMonth = maxMonth;
	}

	public Integer getMaxSeason() {
		return maxSeason;
	}

	public void setMaxSeason(Integer maxSeason) {
		this.maxSeason = maxSeason;
	}

	public ReportParam getReportParam() {
		return reportParam;
	}

	public void setReportParam(ReportParam reportParam) {
		this.reportParam = reportParam;
	}

}
