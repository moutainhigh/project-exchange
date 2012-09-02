package com.throne212.fupin.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.DangReportBiz;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

//党建工作的action
public class DangReportAction extends BaseAction {
	
	private DangReportBiz dangReportBiz; 
	
	private DangReport r;
	private Integer maxMonth;
	private Integer maxYear;
	
	private boolean showZanCun;
	
	// 报表列表，给sa用的
	private List<DangReport> reportList;

	public String reportList() {
		reportList = dangReportBiz.getEntitiesByColumn(DangReport.class, "lock", 2);
		return "report_list";
	}

	public String unlock() {
		String[] ids = (String[]) ActionContext.getContext().getParameters().get("ids");
		if (ids != null && ids.length > 0) {
			for (String idStr : ids) {
				DangReport report = dangReportBiz.getEntityById(DangReport.class, Long.parseLong(idStr));
				report.setLock(0);// 0表示已经解锁
				dangReportBiz.saveOrUpdateEntity(report);
			}
			this.setMsg("成功解锁" + ids.length + "个报表");
		}
		return reportList();
	}
	
	// 解锁
	public String requstUnlock() {
		dangReportBiz.requestUnlock(r);
		this.setMsg("已经发送解锁请求");
		return viewReport();
	}

	public String viewReport() {
		
		//如果该单位用户未指定村帮扶，不能进行操作
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			Org org = (Org) user;
			if(org.getCun() == null){
				this.setMsg("未指定存帮扶，请联系管理员指定村帮扶以后再进行报表操作");
				return "report_edit";
			}
		}
		
		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String time = (c.get(Calendar.MONTH)) + "";
			if("0".equals(time)){
				year--;
				time = "12";
			}
			r = dangReportBiz.getReport(year,time);
			if (r == null) {
				r = new DangReport();
				r.setYear(year);
				r.setTime(time);
			}
		} else if (r != null && r.getId() == null) {// 按条件搜索
			Integer year = r.getYear();
			String time = r.getTime();
			if(Util.isEmpty(time)){//如果时间为空，则采用默认的时间
				r = null;
				return viewReport();
			}
			DangReport report = dangReportBiz.getReport(year, time);
			if (report != null)
				r = report;
			else {
				r = new DangReport();
				r.setYear(year);
				r.setTime(time);
			}
		}

		// 最大的月份和季度
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);

		// 填充灰色项目
		dangReportBiz.fillReport(r);
		
		//只有每月的1号到10号，可以暂存
//		if(user instanceof Org){
//			Calendar now = Calendar.getInstance();
//			int day = now.get(Calendar.DAY_OF_MONTH);
//			if(day >= 1 && day <= 10){
				showZanCun = true;
//			}
//		}

		return "report_edit";
	}
	
	// 导出Excel
	public String excelReport() {
		if (r == null) {
			this.setMsg("导出Excel失败，请检查参数是否正确");
			return viewReport();
		}
		String filePath = null;
		try {
			filePath = dangReportBiz.getExcelReportFilePath(r);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("report_dang_" + r.getYear() + "_" + r.getTime());
			} else {
				this.setMsg("报表文件生成失败，数据不完整或参数错误，请联系管理员");
				return viewReport();
			}
		} catch (Exception e) {
			logger.error("报表文件生成失败", e);
			this.setMsg("报表文件生成失败，请联系管理员");
			return viewReport();
		}
		return "excel";
	}

	public String tmpSaveReport() {
		if (r != null) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport();
			}
		}
		r = dangReportBiz.saveReport(r);
		if (r == null) {
			this.setMsg("暂时保存报表失败");
		} else {
			r.setLock(3);// 3代表暂存
			dangReportBiz.saveOrUpdateEntity(r);
			this.setMsg("暂时报表保存成功");
		}
		return viewReport();
	}

	public String saveReport() {
		if (r != null ) {
			String time = r.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport();
			} else if (r.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport();
			}
		}
		r = dangReportBiz.saveReport(r);
		if (r == null) {
			this.setMsg("保存报表失败");
		} else {
			this.setMsg("报表保存成功");
		}
		return viewReport();
	}

	//导出
	private InputStream downloadFile;
	private ReportParam reportParam;
	public String export() {
		if (reportParam == null)
			return "report_export";
		if(Util.isEmpty(reportParam.getMonth()) || Util.isEmpty(reportParam.getMonth2())){
			this.setMsg("月份不可为空");
			return "report_export"; 
		}
		String filePath = null;
		try {
			filePath = dangReportBiz.getExcelReportFilePath(reportParam);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg(filePath.substring(filePath.lastIndexOf(File.separator),filePath.lastIndexOf(".")));
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
	
	
	//统计
	private List<String[]> statList;
	public String stat() {
		if (reportParam == null)
			return "report_stat";
		if(Util.isEmpty(reportParam.getMonth()) || Util.isEmpty(reportParam.getMonth2())){
			this.setMsg("月份不可为空");
			return "report_stat"; 
		}
		try {
			statList = dangReportBiz.statReport(reportParam);
		} catch (Exception e) {
			logger.error("统计失败", e);
			this.setMsg("统计失败，请联系管理员");
		}
		return "report_stat";
	}

	public DangReportBiz getDangReportBiz() {
		return dangReportBiz;
	}

	public void setDangReportBiz(DangReportBiz dangReportBiz) {
		this.dangReportBiz = dangReportBiz;
	}

	public DangReport getR() {
		return r;
	}

	public void setR(DangReport r) {
		this.r = r;
	}

	public Integer getMaxMonth() {
		return maxMonth;
	}

	public void setMaxMonth(Integer maxMonth) {
		this.maxMonth = maxMonth;
	}

	public Integer getMaxYear() {
		return maxYear;
	}

	public void setMaxYear(Integer maxYear) {
		this.maxYear = maxYear;
	}

	public boolean isShowZanCun() {
		return showZanCun;
	}

	public void setShowZanCun(boolean showZanCun) {
		this.showZanCun = showZanCun;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public ReportParam getReportParam() {
		return reportParam;
	}

	public void setReportParam(ReportParam reportParam) {
		this.reportParam = reportParam;
	}

	public List<String[]> getStatList() {
		return statList;
	}

	public void setStatList(List<String[]> statList) {
		this.statList = statList;
	}

	public List<DangReport> getReportList() {
		return reportList;
	}

	public void setReportList(List<DangReport> reportList) {
		this.reportList = reportList;
	}
}
