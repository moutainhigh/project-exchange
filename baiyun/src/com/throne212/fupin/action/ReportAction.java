package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.ChartItem;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dataobject.ProCunStat;
import com.throne212.fupin.dataobject.Report1Stat;
import com.throne212.fupin.dataobject.Report3Stat;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectShStat;
import com.throne212.fupin.domain.ProjectStat;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report2;
import com.throne212.fupin.domain.Report3;
import com.throne212.fupin.domain.User;

public class ReportAction extends BaseAction {

	private ReportBiz reportBiz;
	private Report r;
	private Integer maxMonth;
	private Integer maxSeason;
	private Integer maxYear;
	
	private List<Org> orgList;

	// excel导出文件
	private InputStream downloadFile;

	//村委会审核通过
	public String shenhe(){
		if(r!=null && r.getId() != null){
			Report1 r1 = reportBiz.getEntityById(Report1.class, r.getId());
			r1.setCunRemark("已审核");
			reportBiz.saveOrUpdateEntity(r1);
			this.setMsg("已审核");
		}
		return viewReport1();
	}
	//村委会审核退回
	public String tuihui(){
		if(r!=null && r.getId() != null){
			Report1 r1 = reportBiz.getEntityById(Report1.class, r.getId());
			r1.setCunRemark("退回修改");
			r1.setLock(0);//解锁
			reportBiz.saveOrUpdateEntity(r1);
			this.setMsg("退回修改，并自动解锁");
		}
		return viewReport1();
	}
	
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

		// 如果该单位用户未指定村帮扶，不能进行操作
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (user instanceof Org) {
			Org org = (Org) user;
			if (org.getCun() == null) {
				this.setMsg("未指定存帮扶，请联系管理员指定村帮扶以后再进行报表操作");
				return "report_edit1";
			}
		}

		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			if("0".equals(time)){
				year--;
				time = "12";
			}
			r = reportBiz.getReport("1", year, type, time);
			if (r == null) {
				r = new Report1();
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
			}
		} else if (r != null) {// 按条件搜索
			Integer year = r.getYear();
			String type = r.getType();
			String time = r.getTime();
			if(("month".equals(type) || "season".equals(type)) && Util.isEmpty(time)){//如果时间为空，则采用默认的时间
				r = null;
				return viewReport1();
			}
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
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);
		maxSeason = maxMonth % 3 == 0 ? maxMonth / 3 : maxMonth / 3 + 1;

		// 填充灰色项目
		// reportBiz.fillReport(r);

		return "report_edit1";
	}
	
	private Long cunId;
	private Long zhenId;
	private List<Report1> report1List;
	private Object[] heji;
	//汇总
	public String sumReport1() {
		
		if(year == null || month == null){
			Calendar c = GregorianCalendar.getInstance();
			year = c.get(Calendar.YEAR);
			month = c.get(Calendar.MONTH);
			if(month == 0){
				year--;
				month = 12;
			}
		}
		PageBean bean = reportBiz.sumReport1(zhenId, cunId, year, month);
		report1List = bean.getResultList();
		heji = (Object[]) bean.getTotal();

		// 最大的月份和季度
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);

		return "report1_sum";
	}

	public String showReport1() {
		String[] cunId = (String[]) ActionContext.getContext().getParameters().get("cunId");
		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			r = reportBiz.getReport("1", year, type, time, Long.parseLong(cunId[0]));
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
			Report report = reportBiz.getReport("1", year, type, time, Long.parseLong(cunId[0]));
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
		// reportBiz.fillReport(r);

		return "show_report1";
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
				if(report instanceof Report1){
					Report1 r1 = (Report1) report;
					r1.setCunRemark("未审核");
					report = r1;
				}
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

	private List<Report3> r3List;

	private Long orgId;
	private String proName;
	
	// report3
	public String viewReport3() {
		
		orgList = reportBiz.getAll(Org.class);
		
		String result = "report_edit3";

		// baiyun是看全部的
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);

		if (r3 == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			if("0".equals(time)){
				year--;
				time = "12";
			}
			if (user instanceof AreaWorkOrg) {
				pageBean = reportBiz.getReport3(year,type,time,orgId,proName, zhenId, cunId);
				r3 = new Report3();
				r3.setYear(year);
				r3.setType(type);
				r3.setTime(time);
				result = "report_edit3_list";
			} else {
				r3 = (Report3) reportBiz.getReport("3", year, type, time);
				if (r3 == null) {
					r3 = new Report3();
					r3.setYear(year);
					r3.setTime(time);
					r3.setType(type);
				}
			}
		} else if (r3 != null && r3.getId() == null) {// 按条件搜索
			Integer year = r3.getYear();
			String type = r3.getType();
			String time = r3.getTime();
			if(("month".equals(type) || "season".equals(type)) && Util.isEmpty(time)){//如果时间为空，则采用默认的时间
				r3 = null;
				return viewReport3();
			}
			if (user instanceof AreaWorkOrg) {
				pageBean = reportBiz.getReport3(year,type,time,orgId,proName, zhenId, cunId);
				result = "report_edit3_list";
			} else {
				Report report = reportBiz.getReport("3", year, type, time);
				if (report != null)
					r3 = (Report3) report;
				else {
					r3 = new Report3();
					r3.setYear(year);
					r3.setType(type);
					r3.setTime(time);
				}
			}
		}

		// 最大的月份和季度
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);
		maxSeason = maxMonth % 3 == 0 ? maxMonth / 3 : maxMonth / 3 + 1;

		return result;
	}
	
	public String showReport3() {
		String[] zhenId = (String[]) ActionContext.getContext().getParameters().get("zhenId");
		if (r == null) {// 默认条件打开，定向到当前的年得月份
			Calendar c = GregorianCalendar.getInstance();
			Integer year = c.get(Calendar.YEAR);
			String type = "month";
			String time = (c.get(Calendar.MONTH)) + "";
			r = reportBiz.getReport("3",year,type,time,Long.parseLong(zhenId[0]));
			if (r == null) {
				r = new Report3();
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
			}
		} else if (r != null && r.getId() == null) {// 按条件搜索
			Integer year = r.getYear();
			String type = r.getType();
			String time = r.getTime();
			Report report = reportBiz.getReport("3",year,type,time,Long.parseLong(zhenId[0]));
			if (report != null)
				r = report;
			else {
				r = new Report3();
				r.setYear(year);
				r.setType(type);
				r.setTime(time);
			}
		}
		
		r3 = (Report3) r;

		// 最大的月份和季度
		maxMonth = GregorianCalendar.getInstance().get(Calendar.MONTH);
		maxSeason = maxMonth % 3 == 0 ? maxMonth / 3 : maxMonth / 3 + 1;

		// 填充灰色项目
		// reportBiz.fillReport(r);

		return "show_report3";
	}

	private Report3 r3;

	public String saveReport3() {
		if (r3 != null && "month".equals(r3.getType())) {
			String time = r3.getTime();
			int month = GregorianCalendar.getInstance().get(Calendar.MONTH) + 1;
			int year = GregorianCalendar.getInstance().get(Calendar.YEAR);
			if (r3.getYear() > year) {
				this.setMsg("对不起，您只能选择之前的年份，年份数需小于等于" + year);
				return viewReport3();
			} else if (r3.getYear() == year && Integer.valueOf(time) >= month) {
				this.setMsg("对不起，您只能选择之前的月份，月份数需小于" + month);
				return viewReport3();
			}
		}
		if (r3.getItems() == null || r3.getItems().size() == 0) {
			this.setMsg("该镇没有任何的村项目，不能继续");
			return viewReport3();
		}
		r3 = (Report3) reportBiz.saveReport(r3, "3");
		if (r3 == null) {
			this.setMsg("保存报表失败");
		} else {
			this.setMsg("报表保存成功");
		}
		return viewReport3();
	}

	public String tmpSaveReport3() {
		saveReport3();
		if (r3 != null && r3.getId() != null) {
			r3.setLock(3);// 3代表暂存
			reportBiz.saveOrUpdateEntity(r3);
			this.setMsg("报表保存成功");
		} else {
			this.setMsg("报表保存失败");
		}
		return viewReport3();
	}

	// 解锁
	public String requstUnlock3() {
		reportBiz.requestUnlock(r3, "3");
		this.setMsg("已经发送解锁请求");
		return viewReport1();
	}

	// 工作落实情况统计表
	public String report1Stat() {
		if(year == null || year == 0){
			Calendar c = GregorianCalendar.getInstance();
			year = c.get(Calendar.YEAR);
			int m = c.get(Calendar.MONTH);
			if(m == 0){
				year--;
			}
		}
		List<Report1Stat> list = reportBiz.getReport1Stat(year);
		Map<String, Object> mapJson = new Hashtable<String, Object>();
		mapJson.put("total", list.size());// easyUI需要total的大小，就是list的大小
		mapJson.put("rows", list);// 把list放到map里面，一定要写成rows
		JSONObject jsonObject = JSONObject.fromObject(mapJson); // 这个是net.sf.json.JSONObject;下面的方法，将map转换成JSON格式的字符串
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getValueStack().set("jsonObject", jsonObject);// 将转换出来的jsonObject保存起，传到页面上去
		logger.debug("jsonObject:" + jsonObject.toString());
		
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		return "report1_stat";
	}
	
	// 资金到位统计表
	public String report3Stat() {
		if(year == null || year == 0){
			Calendar c = GregorianCalendar.getInstance();
			year = c.get(Calendar.YEAR);
			int m = c.get(Calendar.MONTH);
			if(m == 0){
				year--;
			}
		}
		List<Report3Stat> list = reportBiz.getReport3Stat(year);
		Map<String, Object> mapJson = new Hashtable<String, Object>();
		mapJson.put("total", list.size());// easyUI需要total的大小，就是list的大小
		mapJson.put("rows", list);// 把list放到map里面，一定要写成rows
		JSONObject jsonObject = JSONObject.fromObject(mapJson); // 这个是net.sf.json.JSONObject;下面的方法，将map转换成JSON格式的字符串
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getValueStack().set("jsonObject", jsonObject);// 将转换出来的jsonObject保存起，传到页面上去
		logger.debug("jsonObject:" + jsonObject.toString());
		
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		return "report3_stat";
	}
	

	// 汇总查询
	private PageBean pageBean;
	private Integer pageIndex;

	private Integer year;
	private Integer month;
	
	private ChartItem item;

	public String projectCunStat() {
		orgList = reportBiz.getAll(Org.class);
		if (year == null || month == null) {
			Calendar now = GregorianCalendar.getInstance();
			year = now.get(Calendar.YEAR);
			month = now.get(Calendar.MONTH) + 1;
			if(1 == month){
				year--;
				month = 12;
			}
		}
		pageBean = reportBiz.getProCunStat(zhenId, cunId, year, month, orgId, proName);
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		
		buildChart(ProjectCunStat.class);
		
		return "pro_cun_stat";
	}

	public String projectZdStat() {
		orgList = reportBiz.getAll(Org.class);
		if (year == null || month == null) {
			Calendar now = GregorianCalendar.getInstance();
			year = now.get(Calendar.YEAR);
			month = now.get(Calendar.MONTH) + 1;
			if(1 == month){
				year--;
				month = 12;
			}
		}
		pageBean = reportBiz.getProZdStat(year, month, orgId, proName);
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		
		buildChart(ProjectZdStat.class);
		
		return "pro_zd_stat";
	}

	public String projectShStat() {
		if (year == null || month == null) {
			Calendar now = GregorianCalendar.getInstance();
			year = now.get(Calendar.YEAR);
			month = now.get(Calendar.MONTH) + 1;
			if(1 == month){
				year--;
				month = 12;
			}
		}
		pageBean = reportBiz.getProStat(ProjectShStat.class, year, month, pageIndex);
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		
		buildChart(ProjectShStat.class);
		
		return "pro_sh_stat";
	}
	
	private void buildChart(Class clazz){
		//图表
		List<? extends ProjectStat> statList = reportBiz.getProStat(clazz, year, month);
		if(statList != null && statList.size() > 0){
			item = new ChartItem();
			item.grid = new Object[statList.size()][2];
			StringBuffer xmlData = new StringBuffer();
			xmlData.append("<chart>");
			StringBuffer seriesTag = new StringBuffer("<series>");
			StringBuffer graphTag = new StringBuffer("<graphs><graph gid=\"0\">");
			for (int i = 0; i < statList.size(); i++) {
				ProjectStat s = statList.get(i);
				String name = null;
				if(s instanceof ProjectCunStat){
					ProjectCunStat cs = (ProjectCunStat) s;
					name = cs.getProject().getCun().getName() + " - " + cs.getProject().getName();
				}else if(s instanceof ProjectShStat){
					ProjectShStat cs = (ProjectShStat) s;
					name = cs.getProject().getName();
				}else if(s instanceof ProjectZdStat){
					ProjectZdStat cs = (ProjectZdStat) s;
					name = cs.getProject().getName();
				}
				if(name != null){
					name = name.replaceAll("\n", "");
					name = name.replaceAll("\r", "");
				}
				Integer rate = statList.get(i).getRate();
				item.grid[i][0] = name;
				item.grid[i][1] = rate;
				seriesTag.append("<value xid=\"" + i + "\">" + name + "</value>");
				graphTag.append("<value xid=\"" + i + "\">" + rate + "</value>");
			}
			seriesTag.append("</series>");
			graphTag.append("</graph></graphs>");
			xmlData.append(seriesTag.toString());
			xmlData.append(graphTag.toString());
			xmlData.append("</chart>");
			item.setDataXml(xmlData.toString());
			item.setDivId("position_rate");
			item.setSetXml("<settings><type>bar</type><background><alpha>100</alpha><border_color>FFFFFF</border_color><border_alpha>20</border_alpha></background><grid><category><dashed>1</dashed></category><value><dashed>1</dashed></value></grid><axes><category><width>1</width><color>0D8ECF</color></category><value><width>1</width><color>0D8ECF</color></value></axes><values><value><min>0</min></value></values><depth>15</depth><column><width>85</width><balloon_text>{value}</balloon_text><grow_time>3</grow_time></column><graphs><graph gid='0'><title></title><color>0D8ECF</color></graph></graphs></settings>");
			item.setSwf("amcolumn.swf");
			item.setTitle("完成进度表");
			item.setHeight(50 * statList.size());
		}
	}
	
	
	// 村项目落实情况统计表
	public String proCunStat() {
		if(year == null || year == 0){
			Calendar c = GregorianCalendar.getInstance();
			year = c.get(Calendar.YEAR);
			int m = c.get(Calendar.MONTH);
			if(m == 0){
				year--;
			}
		}
		List<ProCunStat> list = reportBiz.getProCunStat(year);
		Map<String, Object> mapJson = new Hashtable<String, Object>();
		mapJson.put("total", list.size());// easyUI需要total的大小，就是list的大小
		mapJson.put("rows", list);// 把list放到map里面，一定要写成rows
		JSONObject jsonObject = JSONObject.fromObject(mapJson); // 这个是net.sf.json.JSONObject;下面的方法，将map转换成JSON格式的字符串
		ActionContext actionContext = ActionContext.getContext();
		actionContext.getValueStack().set("jsonObject", jsonObject);// 将转换出来的jsonObject保存起，传到页面上去
		logger.debug("jsonObject:" + jsonObject.toString());
		
		maxYear = GregorianCalendar.getInstance().get(Calendar.YEAR);
		return "report1_stat";
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

	public Report3 getR3() {
		return r3;
	}

	public void setR3(Report3 r3) {
		this.r3 = r3;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getMonth() {
		return month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	public List<Report3> getR3List() {
		return r3List;
	}

	public void setR3List(List<Report3> r3List) {
		this.r3List = r3List;
	}
	public Integer getMaxYear() {
		return maxYear;
	}
	public void setMaxYear(Integer maxYear) {
		this.maxYear = maxYear;
	}
	public List<Report1> getReport1List() {
		return report1List;
	}
	public void setReport1List(List<Report1> report1List) {
		this.report1List = report1List;
	}
	public Long getCunId() {
		return cunId;
	}
	public void setCunId(Long cunId) {
		this.cunId = cunId;
	}
	public Long getZhenId() {
		return zhenId;
	}
	public void setZhenId(Long zhenId) {
		this.zhenId = zhenId;
	}
	public Object[] getHeji() {
		return heji;
	}
	public void setHeji(Object[] heji) {
		this.heji = heji;
	}
	public ChartItem getItem() {
		return item;
	}
	public void setItem(ChartItem item) {
		this.item = item;
	}
	public Long getOrgId() {
		return orgId;
	}
	public void setOrgId(Long orgId) {
		this.orgId = orgId;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public List<Org> getOrgList() {
		return orgList;
	}
	public void setOrgList(List<Org> orgList) {
		this.orgList = orgList;
	}

}
