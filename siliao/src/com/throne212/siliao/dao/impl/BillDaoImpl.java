package com.throne212.siliao.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.BillDao;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Bill;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderAccount;
import com.throne212.siliao.domain.User;

public class BillDaoImpl extends BaseDaoImpl implements BillDao {

	public PageBean<Bill> getMyBillList(Bill condition, Date fromDate, Date toDate, String currMan, Date planFromDate, Date planToDate,
			Date sendFromDate, Date sendToDate, User user, Integer pageIndex) {

		PageBean<Bill> page = new PageBean<Bill>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildMyBillFilterHQL(condition, fromDate, toDate, currMan, planFromDate, planToDate, sendFromDate, sendToDate, user);
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
		return page;

	}

	private Object[] buildMyBillFilterHQL(Bill condition, Date fromDate, Date toDate, String currMan, Date planFromDate, Date planToDate,
			Date sendFromDate, Date sendToDate, User user) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Bill where (enable is null or enable=true) and status!="+WebConstants.BILL_STATUS_DELETE);
		List paramValueList = new ArrayList();
		if (condition != null) {
			if (!Util.isEmpty(condition.getOrderId())) {// 单据编号
				sb.append(" and orderId like ?");
				paramValueList.add("%" + condition.getOrderId().toUpperCase() + "%");
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {// 厂商
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {// 供应厂
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			if (!Util.isEmpty(condition.getSize())) {// 型号
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {// 规格
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
			if (condition.getAmount()!=null) {// 吨数
				sb.append(" and amount=?");
				paramValueList.add(condition.getAmount());
			}
			if (condition.getStatus() != null) {// 状态
				sb.append(" and status=?");
				paramValueList.add(condition.getStatus());
			}
			if (!Util.isEmpty(condition.getCurrUserName())) {// 当前处理人
				sb.append(" and currUserName like ?");
				paramValueList.add("%" + condition.getCurrUserName() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(toDate);
		}
		// 计划时间段
		if (planFromDate != null) {
			sb.append(" and planDate>=?");
			paramValueList.add(planFromDate);
		}
		if (planToDate != null) {
			sb.append(" and planDate<=?");
			paramValueList.add(planToDate);
		}
		// 发料时间段
		if (sendFromDate != null) {
			sb.append(" and sendDate>=?");
			paramValueList.add(sendFromDate);
		}
		if (sendToDate != null) {
			sb.append(" and sendDate<=?");
			paramValueList.add(sendToDate);
		}

		//用户
		if(user instanceof AreaAccount){//管区经理
			sb.append(" and areaAccount=?");
			paramValueList.add(user);
		}else if(user instanceof ManagerAccount){//饲料经理看整个农场
			sb.append(" and (areaAccount.area.farm.manager=? or manager=?)");
			paramValueList.add(user);
			paramValueList.add(user);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<Bill> getMyBillList(Bill condition, Date fromDate, Date toDate, String currMan, Date planFromDate, Date planToDate, Date sendFromDate,
			Date sendToDate, User user) {

		Object[] hqlArr = buildMyBillFilterHQL(condition,fromDate,toDate,currMan,planFromDate,planToDate, sendFromDate, sendToDate,user);
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
	
	
	//待我处理
	public PageBean<Bill> getWaitBillList(Bill condition, Date fromDate, Date toDate, String currMan, User user,String accountName, Integer pageIndex) {

		PageBean<Bill> page = new PageBean<Bill>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildWaitBillFilterHQL(condition, fromDate, toDate, currMan, user,accountName);
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
		return page;

	}

	private Object[] buildWaitBillFilterHQL(Bill condition, Date fromDate, Date toDate, String currMan, User user,String accountName) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Bill where (enable is null or enable=true) and status!="+WebConstants.BILL_STATUS_DELETE);
		List paramValueList = new ArrayList();
		if (condition != null) {
			if (!Util.isEmpty(condition.getOrderId())) {// 单据编号
				sb.append(" and orderId like ?");
				paramValueList.add("%" + condition.getOrderId().toUpperCase() + "%");
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {// 厂商
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {// 供应厂
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			if (!Util.isEmpty(condition.getSize())) {// 型号
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {// 规格
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
			if (condition.getAmount()!=null) {// 吨数
				sb.append(" and amount=?");
				paramValueList.add(condition.getAmount());
			}
			if (!Util.isEmpty(condition.getCurrUserName())) {// 当前处理人
				sb.append(" and currUserName like ?");
				paramValueList.add("%" + condition.getCurrUserName() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(toDate);
		}
		if (!Util.isEmpty(accountName)) {// 管区负责人
			sb.append(" and areaAccount.name like ?");
			paramValueList.add("%" + accountName + "%");
		}
		//用户
		if(user instanceof ManagerAccount){//饲料经理看状态为"审核中"的
			sb.append(" and (areaAccount.area.farm.manager=? or manager=?) and status="+WebConstants.BILL_STATUS_SUBMIT);
			paramValueList.add(user);
			paramValueList.add(user);
		}else if(user instanceof ProviderAccount){//供应厂看通过审核的
			sb.append(" and (provider.account=? or providerAccount=?) and status="+WebConstants.BILL_STATUS_CONFIRM);
			paramValueList.add(user);
			paramValueList.add(user);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<Bill> getWaitBillList(Bill condition, Date fromDate, Date toDate, String currMan, User user,String accountName) {

		Object[] hqlArr = buildWaitBillFilterHQL(condition,fromDate,toDate,currMan,user,accountName);
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
	
	
	//系统管理员的单据查询
	public PageBean<Bill> getAdminBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName, Integer pageIndex) {

		PageBean<Bill> page = new PageBean<Bill>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildAdminBillFilterHQL(condition, fromDate, toDate, currMan, accountName);
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
		return page;

	}

	private Object[] buildAdminBillFilterHQL(Bill condition, Date fromDate, Date toDate, String currMan, String accountName) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Bill where (enable is null or enable=true)");
		List paramValueList = new ArrayList();
		if (condition != null) {
			if (!Util.isEmpty(condition.getOrderId())) {// 单据编号
				sb.append(" and orderId like ?");
				paramValueList.add("%" + condition.getOrderId().toUpperCase() + "%");
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {// 厂商
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {// 供应厂
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			if (!Util.isEmpty(condition.getSize())) {// 型号
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {// 规格
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
			if (condition.getAmount()!=null) {// 吨数
				sb.append(" and amount=?");
				paramValueList.add(condition.getAmount());
			}
			if (!Util.isEmpty(condition.getCurrUserName())) {// 当前处理人
				sb.append(" and currUserName like ?");
				paramValueList.add("%" + condition.getCurrUserName() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(toDate);
		}
		if (!Util.isEmpty(accountName)) {// 农场负责人
			sb.append(" and manager.name like ?");
			paramValueList.add("%" + accountName + "%");
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<Bill> getAdminBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName) {

		Object[] hqlArr = buildAdminBillFilterHQL(condition,fromDate,toDate,currMan,accountName);
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
	
	
	//对账
	public PageBean<Bill> getSentBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName, Integer pageIndex) {

		PageBean<Bill> page = new PageBean<Bill>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;

		Object[] hqlArr = buildSentBillFilterHQL(condition, fromDate, toDate, currMan, accountName);
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
		return page;

	}

	private Object[] buildSentBillFilterHQL(Bill condition, Date fromDate, Date toDate, String currMan, String accountName) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Bill where (enable is null or enable=true) and status="+WebConstants.BILL_STATUS_SENT);
		List paramValueList = new ArrayList();
		if (condition != null) {
			if (!Util.isEmpty(condition.getOrderId())) {// 单据编号
				sb.append(" and orderId like ?");
				paramValueList.add("%" + condition.getOrderId().toUpperCase() + "%");
			}
			if (condition.getFactory() != null && condition.getFactory().getId() != null) {// 厂商
				Factory factory = (Factory) this.getHibernateTemplate().get(Factory.class, condition.getFactory().getId());
				sb.append(" and factory=?");
				paramValueList.add(factory);
			}
			if (condition.getProvider() != null && condition.getProvider().getId() != null) {// 供应厂
				Provider provider = (Provider) this.getHibernateTemplate().get(Provider.class, condition.getProvider().getId());
				sb.append(" and provider=?");
				paramValueList.add(provider);
			}
			if (!Util.isEmpty(condition.getSize())) {// 型号
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
			if (!Util.isEmpty(condition.getModel())) {// 规格
				sb.append(" and model like ?");
				paramValueList.add("%" + condition.getModel() + "%");
			}
			if (condition.getAmount()!=null) {// 吨数
				sb.append(" and amount=?");
				paramValueList.add(condition.getAmount());
			}
			if (!Util.isEmpty(condition.getCurrUserName())) {// 当前处理人
				sb.append(" and currUserName like ?");
				paramValueList.add("%" + condition.getCurrUserName() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<=?");
			paramValueList.add(toDate);
		}
		if (!Util.isEmpty(accountName)) {// 农场负责人
			sb.append(" and manager.name like ?");
			paramValueList.add("%" + accountName + "%");
		}
		//用户
		User userObj = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(userObj instanceof AreaAccount){
			AreaAccount aa = (AreaAccount) userObj;
			sb.append(" and areaAccount=?");
			paramValueList.add(aa);
		}
		sb.append(" order by createDate desc,id asc");
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public List<Bill> getSentBillList(Bill condition, Date fromDate, Date toDate, String currMan, String accountName) {

		Object[] hqlArr = buildSentBillFilterHQL(condition,fromDate,toDate,currMan,accountName);
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
