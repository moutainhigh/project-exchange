package com.throne212.fupin.dao.impl;

import java.util.List;

import com.throne212.fupin.dao.DangReportDao;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.DangReport;
import com.throne212.fupin.domain.Org;

public class DangReportDaoImpl extends BaseDaoImpl implements DangReportDao {

	public DangReport getReport(Org org, Cun cun, Integer year, String time) {

		DangReport report = null;
		String hql = "from DangReport where org=? and cun=? and year=? and time=?";
		List<DangReport> list = this.getHibernateTemplate().find(hql, new Object[] { org, cun, year, time });
		if (list == null || list.size() == 0) {
			try {
				DangReport r = new DangReport();
				r.setOrg(org);
				r.setCun(cun);
				r.setYear(year);
				r.setTime(time);
				report = r;
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
		} else {
			report = list.get(0);
		}
		// 填入默认项目
		return report;
	}
}
