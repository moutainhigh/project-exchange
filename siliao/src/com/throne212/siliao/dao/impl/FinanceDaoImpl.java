package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FinanceDao;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderFinance;
import com.throne212.siliao.domain.Rate;

public class FinanceDaoImpl extends BaseDaoImpl implements FinanceDao {

	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex) {
		PageBean<ProviderFinance> page = new PageBean<ProviderFinance>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];

		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, paramList.toArray()).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalMoneyWithRate = 0;
		// 设置利率金额
		for (Object o : page.getResultList()) {
			ProviderFinance pf = (ProviderFinance) o;
			// 得到供应厂的利率设置
			double rate = 0;
			hql = "from Rate r where r.provider=? and fromDate<=? and endDate>=?";
			List list = this.getHibernateTemplate().find(hql, new Object[] { pf.getProvider(), new Date(), new Date() });
			if (list != null && list.size() > 0) {
				Rate r = (Rate) list.get(0);
				rate = r.getValue();
			} else {
				logger.info("没有找到相关联的利率【" + pf.getProvider().getName() + "】，使用默认的0利率");
			}
			// 统计天数
			long days = (System.currentTimeMillis() - pf.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			double ratePerDay = rate / 30;
			// 累计计算利息
			for (long j = 0; j < days; j++) {
				rateMoney += ratePerDay * pf.getMoney();
			}
			pf.setRateMoney(rateMoney);
			pf.setTotalMoney(Util.addMoney(pf.getMoney(), rateMoney));

			// 合计计算
			totalAmount = Util.addMoney(totalAmount, pf.getAmount());
			totalMoney = Util.addMoney(totalMoney, pf.getMoney());
			totalMoneyWithRate = Util.addMoney(totalMoneyWithRate, pf.getTotalMoney());
		}
		page.setTotal(new Double[] { totalAmount, totalMoney, totalMoneyWithRate });

		return page;

	}

	private Object[] buildFilterHQL(ProviderFinance condition, Date fromDate, Date toDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from ProviderFinance where (enable is null or enable=true) and type!=" + WebConstants.FINANCE_STATUS_PAY);
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getFarm() != null && condition.getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getFarm().getId());
				sb.append(" and farm=?");
				paramValueList.add(farm);
			}
			if (condition.getProvider().getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Provider.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}

			if (condition.getProvider() != null && condition.getProvider().getId() != null) {
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}

		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and bill.sendDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and bill.sendDate<=?");
			paramValueList.add(toDate);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate) {
		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		return q.list();
	}

	// 农户统计
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate,
			Date finishToDate, Integer pageIndex) {

		PageBean<FarmerFinance> page = new PageBean<FarmerFinance>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildFilterHQL(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];

		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, paramList.toArray()).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalMoneyWithRate = 0;

		// 设置利率金额
		for (Object o : page.getResultList()) {
			FarmerFinance ff = (FarmerFinance) o;
			// 得到农场的利率设置
			double rate = 0;
			hql = "from Rate r where r.farm=? and fromDate<=? and endDate>=?";
			List list = this.getHibernateTemplate().find(hql, new Object[] { ff.getFarmer().getArea().getFarm(), new Date(), new Date() });
			if (list != null && list.size() > 0) {
				Rate r = (Rate) list.get(0);
				rate = r.getValue();
			} else {
				logger.info("没有找到相关联的利率【" + ff.getProvider().getName() + "】，使用默认的0利率");
			}
			// 统计天数
			long days = (System.currentTimeMillis() - ff.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			double ratePerDay = rate / 30;
			// 累计计算利息
			for (long j = 0; j < days; j++) {
				rateMoney += ratePerDay * ff.getMoney();
			}
			ff.setRateMoney(rateMoney);
			ff.setTotalMoney(Util.addMoney(ff.getMoney(), rateMoney));

			// 合计计算
			totalAmount = Util.addMoney(totalAmount, ff.getAmount());
			totalMoney = Util.addMoney(totalMoney, ff.getMoney());
			totalMoneyWithRate = Util.addMoney(totalMoneyWithRate, ff.getTotalMoney());
		}
		page.setTotal(new Double[] { totalAmount, totalMoney, totalMoneyWithRate });

		return page;

	}

	private Object[] buildFilterHQL(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from FarmerFinance where (enable is null or enable=true) and type!=" + WebConstants.FINANCE_STATUS_PAY);
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getArea() != null && condition.getArea() != null && condition.getArea().getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getArea().getFarm().getId());
				sb.append(" and area.farm=?");
				paramValueList.add(farm);
			}
			if (condition.getProvider().getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Provider.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			if (condition.getFarmer() != null && !Util.isEmpty(condition.getFarmer().getName())) {
				sb.append(" and farmer.name like ?");
				paramValueList.add("%" + condition.getFarmer().getName() + "%");
			}
			if (!Util.isEmpty(condition.getSize())) {
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
		}
		// 创建时间段
		if (sendFromDate != null) {
			sb.append(" and bill.sendDate>=?");
			paramValueList.add(sendFromDate);
		}
		if (sendToDate != null) {
			sb.append(" and bill.sendDate<=?");
			paramValueList.add(sendToDate);
		}

		if (finishFromDate != null) {
			sb.append(" and bill.finishDate>=?");
			paramValueList.add(finishFromDate);
		}
		if (finishToDate != null) {
			sb.append(" and bill.finishDate<=?");
			paramValueList.add(finishToDate);
		}

		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate,
			Date finishToDate) {
		Object[] hqlArr = buildFilterHQL(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		return q.list();
	}

	// 厂商结算查询
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex) {
		PageBean<ProviderFinance> page = new PageBean<ProviderFinance>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildFilterHQLForSettle(condition, fromDate, toDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];

		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, paramList.toArray()).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		q.setMaxResults(WebConstants.PAGE_SIZE);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalRate = 0;
		double totalMoneyWithRate = 0;
		// 设置利率金额
		for (Object o : page.getResultList()) {
			ProviderFinance pf = (ProviderFinance) o;
			
			// 得到供应厂的利率设置
			double rate = 0;
			hql = "from Rate r where r.provider=? and fromDate<=? and endDate>=?";
			List list = this.getHibernateTemplate().find(hql, new Object[] { pf.getProvider(), new Date(), new Date() });
			if (list != null && list.size() > 0) {
				Rate r = (Rate) list.get(0);
				rate = r.getValue();
			} else {
				logger.info("没有找到相关联的利率【" + pf.getProvider().getName() + "】，使用默认的0利率");
			}
			// 统计天数
			long days = (System.currentTimeMillis() - pf.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			double ratePerDay = rate / 30;
			// 累计计算利息
			for (long j = 0; j < days; j++) {
				rateMoney += ratePerDay * pf.getMoney();
			}
			pf.setRateMoney(Util.roundMoney(rateMoney));
			pf.setTotalMoney(Util.addMoney(pf.getMoney(), rateMoney));

			// 合计计算
			if (pf.getType() != null || pf.getType() == WebConstants.FINANCE_STATUS_PAY) {// 付款类型
				
			}else{
				totalAmount = Util.addMoney(totalAmount, pf.getAmount());
			}
			totalMoney = Util.addMoney(totalMoney, pf.getMoney());
			totalRate = Util.addMoney(totalRate, pf.getRateMoney());
			totalMoneyWithRate = Util.addMoney(totalMoneyWithRate, pf.getTotalMoney());
		}
		page.setTotal(new Double[] { totalAmount, totalMoney, totalRate, totalMoneyWithRate });

		return page;

	}

	private Object[] buildFilterHQLForSettle(ProviderFinance condition, Date fromDate, Date toDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from ProviderFinance where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getFarm() != null && condition.getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getFarm().getId());
				sb.append(" and farm=?");
				paramValueList.add(farm);
			}
			if (condition.getProvider().getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Provider.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}

			if (condition.getProvider() != null && condition.getProvider().getId() != null) {
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}

		}
		// 启息时间段
		if (fromDate != null) {
			sb.append(" and rateFromDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and rateFromDate<=?");
			paramValueList.add(toDate);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<ProviderFinance> getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate) {
		Object[] hqlArr = buildFilterHQLForSettle(condition, fromDate, toDate);
		String hql = (String) hqlArr[0];
		List paramList = (List) hqlArr[1];
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		int i = 0;
		for (Object o : paramList) {
			q.setParameter(i++, o);
		}
		return q.list();
	}

}
