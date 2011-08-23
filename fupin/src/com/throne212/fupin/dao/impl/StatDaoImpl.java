package com.throne212.fupin.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;

import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.StatDao;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class StatDaoImpl extends BaseDaoImpl implements StatDao {

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Integer pageIndex) {

		if (pageIndex == null || pageIndex == 0) {
			pageIndex = 1;
		}

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();

		PageBean<FamilyTypeStatDO> page = new PageBean<FamilyTypeStatDO>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		SQLQuery q = null;

		if (user instanceof Org) {//单位
			q = (SQLQuery) s.getNamedQuery("family_type_org");
			q.setParameter("loginName", user.getLoginName());
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		} else if (user instanceof ZhenWorkOrg) {//镇级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_zhen");
			q.setParameter("zhenId", ((ZhenWorkOrg)user).getZhen().getId());
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		} else if (user instanceof WorkTeam) {//工作组
			q = (SQLQuery) s.getNamedQuery("family_type_team");
			q.setParameter("loginName", user.getLoginName());
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		} else if (user instanceof AreaWorkOrg && !"Y".equals(((AreaWorkOrg)user).getIsWorkGroup())) {//区县管理员
			q = (SQLQuery) s.getNamedQuery("family_type_area");
			q.setParameter("areaId", ((AreaWorkOrg)user).getArea().getId());
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		}else if (user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg)user).getIsWorkGroup())) {//工作队，增城和从化
			q = (SQLQuery) s.getNamedQuery("family_type_group");
			q.setParameter("areaId", ((AreaWorkOrg)user).getArea().getId());
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		}else if (user instanceof Admin || user instanceof ShiWorkOrg) {//市级管理员或超级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_all");
			int count = q.list().size();
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count);
		}else {
			return page;
		}

		// 填充数据
		q.setFirstResult(startIndex);
		q.setMaxResults(WebConstants.PAGE_SIZE);
		List list = q.list();
		List<FamilyTypeStatDO> rstList = new ArrayList<FamilyTypeStatDO>();
		for (Object obj : list) {
			Object[] values = (Object[]) obj;
			String cunName = (String) values[0];
			BigInteger type1 = (BigInteger) values[1];
			BigInteger type2 = (BigInteger) values[2];
			BigInteger type3 = (BigInteger) values[3];
			BigInteger type4 = (BigInteger) values[4];
			BigInteger sum = (BigInteger) values[5];
			rstList.add(new FamilyTypeStatDO(cunName, type1.longValue(), type2.longValue(), type3.longValue(), type4.longValue(), sum.longValue()));
		}
		logger.debug("查询数据条数：" + list.size());

		// 设置page数据
		page.setResultList(rstList);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码

		return page;

	}

}
