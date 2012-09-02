package com.throne212.fupin.biz.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.DangReportBiz;
import com.throne212.fupin.common.ReportParam;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.DangReportDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
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
		// TODO Auto-generated method stub
		return null;
	}

	public void fillReport(DangReport r) {
		// TODO Auto-generated method stub
		
	}

	public DangReport saveReport(DangReport r) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getExcelReportFilePath(ReportParam reportParam) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<String[]> statReport(ReportParam reportParam) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getExcelReportFilePath(DangReport r) {
		// TODO Auto-generated method stub
		return null;
	}


}
