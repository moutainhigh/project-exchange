package com.throne212.oa.test;

import java.util.List;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.dao.ReportDao;
import com.throne212.oa.domain.report.WorkReportB1;

public class Test3 {
	public static void main(String[] args) throws Exception {
		ReportDao reportDao = new ReportDao();
		WorkReportB1 b1 = (WorkReportB1) reportDao.getWorkReportById(5L);
		b1.setC(1, Double.valueOf(10));
		reportDao.saveOrUpdateReport(b1);
		b1 = (WorkReportB1) reportDao.getWorkReportById(5L);
		System.out.println(b1.getC1());
		
	}
}
