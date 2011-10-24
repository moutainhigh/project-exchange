package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ProjectBiz;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.ProjectCunStat;
import com.throne212.fupin.domain.ProjectZdStat;
import com.throne212.fupin.domain.Report1;

public class RemindAction extends BaseAction {

	private List<Report1> report1List;
	
	private List<ProjectCunStat> report2List;
	private List<ProjectZdStat> report3List;

	private ReportBiz reportBiz;
	private ProjectBiz projectBiz;

	// actions
	public String execute() {
		//户退回提醒
		report1List = reportBiz.getEntitiesByTwoColumn(Report1.class, "cunRemark", "退回修改", "org", ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
		//村退回提醒
		report2List = projectBiz.getEntitiesByTwoColumn(ProjectCunStat.class, "cunRemark", "退回修改", "project.org", ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
		//重点镇退回提醒
		report3List = projectBiz.getEntitiesByTwoColumn(ProjectZdStat.class, "cunRemark", "退回修改", "project.org", ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
		return "success";
	}

	public List<Report1> getReport1List() {
		return report1List;
	}

	public void setReport1List(List<Report1> report1List) {
		this.report1List = report1List;
	}

	public ReportBiz getReportBiz() {
		return reportBiz;
	}

	public void setReportBiz(ReportBiz reportBiz) {
		this.reportBiz = reportBiz;
	}

	public List<ProjectCunStat> getReport2List() {
		return report2List;
	}

	public void setReport2List(List<ProjectCunStat> report2List) {
		this.report2List = report2List;
	}

	public ProjectBiz getProjectBiz() {
		return projectBiz;
	}

	public void setProjectBiz(ProjectBiz projectBiz) {
		this.projectBiz = projectBiz;
	}

	public List<ProjectZdStat> getReport3List() {
		return report3List;
	}

	public void setReport3List(List<ProjectZdStat> report3List) {
		this.report3List = report3List;
	}

}

	
