package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.common.FactoryStatDO;
import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.ProviderStatDO;
import com.throne212.siliao.common.SysStatDO;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FinanceDao;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderFinance;
import com.throne212.siliao.domain.Rate;
import com.throne212.siliao.domain.User;

public class FinanceDaoImpl extends BaseDaoImpl implements FinanceDao {
	
	//获取当天的利率
	private double getProviderRate(Object obj,Date date){
		String target = (obj instanceof Provider)?"provider":"farm";
		double rate = 0;
		String hql = "from Rate r where r."+target+"=? and fromDate<=? and ?<=endDate";
		List list = this.getHibernateTemplate().find(hql, new Object[] { obj, date, date });
		if (list != null && list.size() > 0) {
			Rate r = (Rate) list.get(0);
			rate = r.getValue();
		} else {
			logger.info("没有找到相关联的利率，使用默认的0利率");
		}
		return rate/30;
	}
	

	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex,int pageSize) {
		PageBean<ProviderFinance> page = new PageBean<ProviderFinance>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

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
		if(pageIndex > -1){
			q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
			q.setFirstResult(startIndex);
		}
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalMoneyWithRate = 0;
		double totalAgentMoney = 0;
		// 设置利率金额
		for (Object o : page.getResultList()) {
			ProviderFinance pf = (ProviderFinance) o;
			
			// 计算利率
			long days = (System.currentTimeMillis() - pf.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			for (long j = 0; j < days; j++) {
				long time = pf.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
				rateMoney += pf.getMoney() * getProviderRate(pf.getProvider(),new Date(time));
			}
			pf.setRateMoney(rateMoney);
			pf.setTotalMoney(Util.addMoney(pf.getMoney(), rateMoney));
			
			// 合计计算
			totalAmount = Util.addMoney(totalAmount, pf.getAmount());
			totalMoney = Util.addMoney(totalMoney, pf.getMoney());
			totalMoneyWithRate = Util.addMoney(totalMoneyWithRate, pf.getTotalMoney());
			totalAgentMoney = Util.addMoney(totalAgentMoney, pf.getAgentMoney());
		}
		page.setTotal(new Double[] { totalAmount, totalMoney, totalMoneyWithRate, totalAgentMoney});

		return page;

	}

	private Object[] buildFilterHQL(ProviderFinance condition, Date fromDate, Date toDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from ProviderFinance where (enable is null or enable=true) and type=0");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getFarm() != null && condition.getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getFarm().getId());
				sb.append(" and farm=?");
				paramValueList.add(farm);
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and (factory=? or provider.factory=?)");
				paramValueList.add(factory);
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
			sb.append(" and bill.sendDate<?");
			paramValueList.add(Util.getNextDate(toDate));
		}
		//用户限制
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ManagerAccount){
			sb.append(" and farm=?");
			paramValueList.add(((ManagerAccount)user).getFarm());
		}
		sb.append(" order by id asc");
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
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate, Integer pageIndex,int pageSize) {

		PageBean<FarmerFinance> page = new PageBean<FarmerFinance>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

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
		if(pageIndex > -1){
			q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
			q.setFirstResult(startIndex);
		}
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalMoneyWithRate = 0;

		// 设置利率金额
		for (Object o : page.getResultList()) {
			FarmerFinance ff = (FarmerFinance) o;
			// 计算利率
			long days = (System.currentTimeMillis() - ff.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			for (long j = 0; j < days; j++) {
				long time = ff.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
				rateMoney += ff.getMoney() * getProviderRate(ff.getArea().getFarm(),new Date(time));
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
		StringBuffer sb = new StringBuffer("from FarmerFinance where (enable is null or enable=true) and type=0");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getArea() != null && condition.getArea() != null && condition.getArea().getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getArea().getFarm().getId());
				sb.append(" and area.farm=?");
				paramValueList.add(farm);
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
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
			//编号
			if(condition.getBill()!=null && !Util.isEmpty(condition.getBill().getOrderId())){
				sb.append(" and bill.orderId like ?");
				paramValueList.add("%" + condition.getBill().getOrderId() + "%");
			}
		}
		// 创建时间段
		if (sendFromDate != null) {
			sb.append(" and bill.sendDate>=?");
			paramValueList.add(sendFromDate);
		}
		if (sendToDate != null) {
			sb.append(" and bill.sendDate<?");
			paramValueList.add(Util.getNextDate(sendToDate));
		}

		if (finishFromDate != null) {
			sb.append(" and bill.finishDate>=?");
			paramValueList.add(finishFromDate);
		}
		if (finishToDate != null) {
			sb.append(" and bill.finishDate<?");
			paramValueList.add(Util.getNextDate(finishToDate));
		}
		//用户限制
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ManagerAccount){
			sb.append(" and area.farm=?");
			paramValueList.add(((ManagerAccount)user).getFarm());
		}
		sb.append(" order by id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate) {
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
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex,int pageSize) {
		PageBean<ProviderFinance> page = new PageBean<ProviderFinance>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

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
		if(pageIndex > -1){
			q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
			q.setFirstResult(startIndex);
		}
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalRate = 0;
		double totalMoneyWithRate = 0;
		// 设置利率金额
		for (Object o : page.getResultList()) {
			ProviderFinance pf = (ProviderFinance) o;

			// 计算利率
			long days = (System.currentTimeMillis() - pf.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			for (long j = 0; j < days; j++) {
				long time = pf.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
				rateMoney += pf.getMoney() * getProviderRate(pf.getProvider(),new Date(time));
			}
			pf.setRateMoney(rateMoney);
			pf.setTotalMoney(Util.addMoney(pf.getMoney(), rateMoney));

			// 合计计算
			if (pf.getType() != null || pf.getType() == WebConstants.FINANCE_STATUS_PAY) {// 付款类型

			} else {
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
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
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
			sb.append(" and rateFromDate<?");
			paramValueList.add(Util.getNextDate(toDate));
		}
		//用户限制
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ManagerAccount){
			sb.append(" and farm=?");
			paramValueList.add(((ManagerAccount)user).getFarm());
		}
		sb.append(" order by id asc");
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

	// 农户结算
	public PageBean<FarmerFinance> getFarmerSettleFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate, Integer pageIndex,int pageSize) {

		PageBean<FarmerFinance> page = new PageBean<FarmerFinance>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQLForSettle(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
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
		if(pageIndex > -1){
			q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
			q.setFirstResult(startIndex);
		}
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		// 设置合计
		double totalAmount = 0;
		double totalMoney = 0;
		double totalRate = 0;
		double totalMoneyWithRate = 0;

		// 设置利率金额
		for (Object o : page.getResultList()) {
			FarmerFinance ff = (FarmerFinance) o;
			
			// 计算利率
			long days = (System.currentTimeMillis() - ff.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
			double rateMoney = 0;
			for (long j = 0; j < days; j++) {
				long time = ff.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
				if (ff.getArea()!=null&&ff.getArea().getFarm()!=null) {
					rateMoney += ff.getMoney() * getProviderRate(ff.getArea().getFarm(),new Date(time));
				}
				}
			ff.setRateMoney(rateMoney);
			ff.setTotalMoney(Util.addMoney(ff.getMoney(), rateMoney));

			// 合计计算
			if (ff.getType() == null || ff.getType() == 0) {
				totalAmount = Util.addMoney(totalAmount, ff.getAmount());
			}
			totalMoney = Util.addMoney(totalMoney, ff.getMoney());
			totalRate = Util.addMoney(totalRate, ff.getRateMoney());
			totalMoneyWithRate = Util.addMoney(totalMoneyWithRate, ff.getTotalMoney());
		}
		page.setTotal(new Double[] { totalAmount, totalMoney, totalRate, totalMoneyWithRate });

		return page;

	}

	private Object[] buildFilterHQLForSettle(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from FarmerFinance where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			// 构建下拉项的条件
			if (condition.getArea() != null && condition.getArea() != null && condition.getArea().getFarm().getId() != null) {
				Farm farm = (Farm) this.getHibernateTemplate().get(Farm.class, condition.getArea().getFarm().getId());
				sb.append(" and area.farm=?");
				paramValueList.add(farm);
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
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
			//编号
			if(condition.getBill()!=null && !Util.isEmpty(condition.getBill().getOrderId())){
				sb.append(" and bill.orderId like ?");
				paramValueList.add("%" + condition.getBill().getOrderId() + "%");
			}
		}
		// 创建时间段
		if (sendFromDate != null) {
			sb.append(" and bill.sendDate>=?");
			paramValueList.add(sendFromDate);
		}
		if (sendToDate != null) {
			sb.append(" and bill.sendDate<?");
			paramValueList.add(Util.getNextDate(sendToDate));
		}

		if (finishFromDate != null) {
			sb.append(" and bill.finishDate>=?");
			paramValueList.add(finishFromDate);
		}
		if (finishToDate != null) {
			sb.append(" and bill.finishDate<?");
			paramValueList.add(Util.getNextDate(finishToDate));
		}
		//用户限制
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof ManagerAccount){
			sb.append(" and area.farm=?");
			paramValueList.add(((ManagerAccount)user).getFarm());
		}
		sb.append(" order by id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<FarmerFinance> getFarmerSettleFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate, Date finishFromDate, Date finishToDate) {
		Object[] hqlArr = buildFilterHQLForSettle(condition, sendFromDate, sendToDate, finishFromDate, finishToDate);
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

	// 农场统计
	public List<FarmerStatDO> getFarmStatList(Long farmId) {
		Farm farm = null;
		List<Area> areaList = null;
		if (farmId != null) {
			farm = (Farm) this.getHibernateTemplate().get(Farm.class, farmId);
		}
		// 查询管区
		List<FarmerStatDO> farmerStatList = new ArrayList<FarmerStatDO>();

		if (farm != null) {
			areaList = this.getHibernateTemplate().find("from Area where farm=? and (enable is null or enable=true)", farm);
		}

		double sumAmount = 0;
		double sumMoney = 0;
		double sumMoneyWithRate = 0;
		double sumPay = 0;
		for (Area area : areaList) {
			FarmerStatDO farmerStatDO = new FarmerStatDO();
			farmerStatDO.setOrderNum(area.getId());
			farmerStatDO.setAreaName(area.getName());
			farmerStatDO.setAreaAccount(area.getAccount().getName());

			// 获得用料量合计(吨)
			Double totalAmount = (Double) this.getHibernateTemplate().find("select sum(amount) from FarmerFinance where area=? and type=0", area).get(0);
			farmerStatDO.setTotalAmount(totalAmount==null?0:totalAmount);

			// 获得总料款合计
			Double totalMoney = (Double) this.getHibernateTemplate().find("select sum(money) from FarmerFinance where area=? and type=0", area).get(0);
			farmerStatDO.setTotalMoney(totalMoney==null?0:totalMoney);

			// 获得单笔本息合计
			double totalMoneyWithRate = 0;
			List<FarmerFinance> tmpList = this.getHibernateTemplate().find("from FarmerFinance ff where area=? and type=0", new Object[] { area });
			for (FarmerFinance ff : tmpList) {
				// 统计天数
				long days = (System.currentTimeMillis() - ff.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
				double rateMoney = 0;
				// 累计计算利息
				for (long j = 0; j < days; j++) {
					long time = ff.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
					rateMoney += ff.getMoney() * getProviderRate(ff.getArea().getFarm(),new Date(time));
				}
				totalMoneyWithRate = rateMoney + ff.getMoney();				
			}
			farmerStatDO.setTotalOwn(Util.roundMoney(totalMoneyWithRate));

			// 获得已付款
			Double totalPay = (Double) this.getHibernateTemplate().find("select sum(money) from FarmerFinance where (area=? or farmer.area=?) and type=" + WebConstants.FINANCE_STATUS_GET, new Object[]{area,area}).get(0);
			farmerStatDO.setTotalPay(totalPay==null?0:totalPay);

			farmerStatList.add(farmerStatDO);
			
			//进行合计
			sumAmount = Util.addMoney(sumAmount, farmerStatDO.getTotalAmount());
			sumMoney = Util.addMoney(sumMoney, farmerStatDO.getTotalMoney());
			sumMoneyWithRate = Util.addMoney(sumMoneyWithRate, farmerStatDO.getTotalOwn());
			sumPay = Util.addMoney(sumPay, farmerStatDO.getTotalPay());
		}
		if(farmerStatList != null && farmerStatList.size() > 0){
			farmerStatList.get(0).setTotal(new Double[]{sumAmount,sumMoney,sumMoneyWithRate,sumPay});
		}
		return farmerStatList;
	}

	public List<ProviderStatDO> getProviderStatList(Long farmId) {
		Farm farm = null;
		List<Provider> List = null;
		if (farmId != null) {
			farm = (Farm) this.getHibernateTemplate().get(Farm.class, farmId);
			List = this.getHibernateTemplate().find("from Provider where enable is null or enable=true");
		} else {
			return null;
		}

		List<ProviderStatDO> pfList = new ArrayList<ProviderStatDO>();
		double sumAmount = 0;
		double sumMoney = 0;
		double sumMoneyWithRate = 0;
		for (Provider p : List) {
			ProviderStatDO pDO = new ProviderStatDO();
			pDO.setOrderNum(p.getId());
			pDO.setProviderName(p.getName());
			pDO.setFarmName(farm.getName());

			// 获得用料量合计(吨)
			Double totalAmount = (Double) this.getHibernateTemplate().find("select sum(amount) from ProviderFinance where provider=? and farm=? and type=0", new Object[] { p, farm }).get(0);
			pDO.setTotalAmount(totalAmount==null?0:totalAmount);

			// 获得总料款合计
			Double totalMoney = (Double) this.getHibernateTemplate().find("select sum(money) from ProviderFinance where provider=? and farm=? and type=0", new Object[] { p, farm }).get(0);
			pDO.setTotalMoney(totalMoney==null?0:totalMoney);

			// 获得单笔本息合计
			double totalMoneyWithRate = 0;
			List<ProviderFinance> tmpList = this.getHibernateTemplate().find("from ProviderFinance pf where provider=? and farm=? and type=0", new Object[] { p, farm });
			for (ProviderFinance pf : tmpList) {
				// 统计天数
				long days = (System.currentTimeMillis() - pf.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
				double rateMoney = 0;
				// 累计计算利息
				for (long j = 0; j < days; j++) {
					long time = pf.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
					rateMoney += this.getProviderRate(pf.getProvider(), new Date(time)) * pf.getMoney();
				}
				totalMoneyWithRate = rateMoney + pf.getMoney();
			}
			if (totalMoneyWithRate != 0)
				pDO.setTotalRateMoney(Util.roundMoney(totalMoneyWithRate));

			pfList.add(pDO);
			
			
			//进行合计
			sumAmount = Util.addMoney(sumAmount, pDO.getTotalAmount());
			sumMoney = Util.addMoney(sumMoney, pDO.getTotalMoney());
			sumMoneyWithRate = Util.addMoney(sumMoneyWithRate, pDO.getTotalRateMoney()==null?0:pDO.getTotalRateMoney());
		}
		//添加合计到DO
		if(pfList != null && pfList.size() > 0){
			pfList.get(0).setTotal(new Double[]{sumAmount,sumMoney,sumMoneyWithRate});
		}
		return pfList;
	}
	
	
	//集团统计
	public List<SysStatDO> getAllFarmStatList() {
		List<SysStatDO> statList = new ArrayList<SysStatDO>();
		List<Farm> farmList = this.getHibernateTemplate().find("from Farm where (enable is null or enable=true)");
		double sumAmount = 0;
		double sumMoney = 0;
		double sumMoneyWithRate = 0;
		double sumPay = 0;
		for (Farm farm : farmList) {
			SysStatDO statDO = new SysStatDO();
			statDO.setOrderNum(farm.getId());
			statDO.setFarmName(farm.getName());
			statDO.setManager(farm.getManager().getName());

			// 获得用料量合计(吨)
			Double totalAmount = (Double) this.getHibernateTemplate().find("select sum(amount) from FarmerFinance where area.farm=? and type=0", farm).get(0);
			statDO.setTotalAmount(totalAmount==null?0:totalAmount);

			// 获得总料款合计
			Double totalMoney = (Double) this.getHibernateTemplate().find("select sum(money) from FarmerFinance where area.farm=? and type=0", farm).get(0);
			statDO.setTotalMoney(totalMoney==null?0:totalMoney);

			// 获得单笔本息合计
			double totalMoneyWithRate = 0;
			List<FarmerFinance> tmpList = this.getHibernateTemplate().find("from FarmerFinance ff where area.farm=? and type=0", new Object[] { farm });
			for (FarmerFinance ff : tmpList) {
				// 统计天数
				long days = (System.currentTimeMillis() - ff.getRateFromDate().getTime()) / 1000 / 60 / 60 / 24;
				double rateMoney = 0;
				// 累计计算利息
				for (long j = 0; j < days; j++) {
					long time = ff.getRateFromDate().getTime() + 1000 * 60 * 60 * 24 * (j+1);
					rateMoney += this.getProviderRate(ff.getArea().getFarm(), new Date(time)) * ff.getMoney();
				}
				totalMoneyWithRate = rateMoney + ff.getMoney();
			}
			statDO.setTotalOwn(Util.roundMoney(totalMoneyWithRate));

			// 获得已付款
			Double totalPay = (Double) this.getHibernateTemplate().find("select sum(money) from FarmerFinance where (area.farm=? or farmer.area.farm=?) and type=" + WebConstants.FINANCE_STATUS_GET, new Object[]{farm,farm}).get(0);
			statDO.setTotalPay(totalPay==null?0:totalPay);

			statList.add(statDO);
			
			//进行合计
			sumAmount = Util.addMoney(sumAmount, statDO.getTotalAmount());
			sumMoney = Util.addMoney(sumMoney, statDO.getTotalMoney());
			sumMoneyWithRate = Util.addMoney(sumMoneyWithRate, statDO.getTotalOwn());
			sumPay = Util.addMoney(sumPay, statDO.getTotalPay());
		}
		if(statList != null && statList.size() > 0){
			statList.get(0).setTotal(new Double[]{sumAmount,sumMoney,sumMoneyWithRate,sumPay});
		}
		return statList;
	}

	public List<FactoryStatDO> getAllFactoryStatList() {
		List<Factory> List = this.getHibernateTemplate().find("from Factory where enable is null or enable=true");
		List<FactoryStatDO> pfList = new ArrayList<FactoryStatDO>();
		double sumAmount = 0;
		double sumMoney = 0;
		double sumPay = 0;
		double sumBalance = 0;
		for (Factory f : List) {
			FactoryStatDO pDO = new FactoryStatDO();
			pDO.setOrderNum(f.getId());
			pDO.setFactoryName(f.getName());

			// 获得用料量合计(吨)
			Double totalAmount = (Double) this.getHibernateTemplate().find("select sum(amount) from ProviderFinance where (factory=? or provider.factory=?) and type=0", new Object[] { f,f }).get(0);
			pDO.setTotalAmount(totalAmount==null?0:totalAmount);

			// 获得总料款合计
			Double totalMoney = (Double) this.getHibernateTemplate().find("select sum(money) from ProviderFinance where (factory=? or provider.factory=?) and type=0", new Object[] { f,f }).get(0);
			pDO.setTotalMoney(totalMoney==null?0:totalMoney);

			// 获得已经付款
			Double totalPay = (Double) this.getHibernateTemplate().find("select sum(money) from ProviderFinance where (factory=? or provider.factory=?) and type="+WebConstants.FINANCE_STATUS_PAY, new Object[] { f,f }).get(0);
			pDO.setTotalPay(totalPay==null?0:Math.abs(totalPay));
			
			//欠款余额
			pDO.setOwnBalance(Util.subMoney(pDO.getTotalMoney(),pDO.getTotalPay()));
			
			pfList.add(pDO);
			
			
			//进行合计
			sumAmount = Util.addMoney(sumAmount, pDO.getTotalAmount());
			sumMoney = Util.addMoney(sumMoney, pDO.getTotalMoney());
			sumPay = Util.addMoney(sumMoney, pDO.getTotalPay());
			sumBalance = Util.addMoney(sumBalance, pDO.getOwnBalance());
		}
		//添加合计到DO
		if(pfList != null && pfList.size() > 0){
			pfList.get(0).setTotal(new Double[]{sumAmount,sumMoney,sumPay,sumBalance});
		}
		return pfList;
	}
}
