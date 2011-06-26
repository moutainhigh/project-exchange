package com.throne212.fupin.dao.impl;

import java.util.List;

import com.throne212.fupin.dao.ReportDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Report;
import com.throne212.fupin.domain.Report1;
import com.throne212.fupin.domain.Report2;

public class ReportDaoImpl extends BaseDaoImpl implements ReportDao {

	public Report getReport(String reportType, Org org, Cun cun, Integer year, String type, String time) {
		Class clazz = null;
		if ("1".equals(reportType)) {
			clazz = Report1.class;
		} else if ("2".equals(reportType)) {
			clazz = Report2.class;
		}
		String hql = "from " + clazz.getSimpleName() + " where org=? and cun=? and year=? and type=?";
		if (!"year".equals(type)) {
			hql += " and time='" + time + "'";
		}
		List<Report> list = this.getHibernateTemplate().find(hql, new Object[] { org, cun, year, type });
		if (list == null || list.size() == 0) {
			try {
				Report r = (Report) clazz.newInstance();
				r.setOrg(org);
				r.setCun(cun);
				r.setYear(year);
				r.setTime(time);
				r.setType(type);
				return r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		}
		return list.get(0);
	}

}
