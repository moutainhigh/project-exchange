package com.throne212.fupin.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ReportBiz;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Report1;

public class RemindAction extends BaseAction {

	private List<Report1> report1List;

	private ReportBiz reportBiz;

	// actions
	public String execute() {
		report1List = reportBiz.getEntitiesByTwoColumn(Report1.class, "cunRemark", "退回修改", "org", ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ));
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

}
