package com.throne212.fupin.dao.impl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Long cunId,Long zhenId,Long areaId, Integer pageIndex) {

		if (pageIndex == null || pageIndex == 0) {
			pageIndex = 1;
		}

		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();

		PageBean<FamilyTypeStatDO> page = new PageBean<FamilyTypeStatDO>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		SQLQuery q = null;

		Map<String, Object> nameParams = new HashMap<String, Object>();

		if (user instanceof Org) {// 单位
			q = (SQLQuery) s.getNamedQuery("family_type_org");
			nameParams.put("loginName", user.getLoginName());
		} else if (user instanceof ZhenWorkOrg) {// 镇级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_zhen");
			nameParams.put("zhenId", ((ZhenWorkOrg) user).getZhen().getId());
		} else if (user instanceof WorkTeam) {// 工作组
			q = (SQLQuery) s.getNamedQuery("family_type_team");
			nameParams.put("loginName", user.getLoginName());
		} else if (user instanceof AreaWorkOrg && !"Y".equals(((AreaWorkOrg) user).getIsWorkGroup()) && 
				(((AreaWorkOrg) user).getArea().getName().equals("从化市") || ((AreaWorkOrg) user).getArea().getName().equals("增城市"))) {// 区县管理员-ch & zc
			q = (SQLQuery) s.getNamedQuery("family_type_area_zc_ch");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && !"Y".equals(((AreaWorkOrg) user).getIsWorkGroup())) {// 区县管理员
			q = (SQLQuery) s.getNamedQuery("family_type_area");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup()) && 
				(((AreaWorkOrg) user).getArea().getName().equals("从化市") || ((AreaWorkOrg) user).getArea().getName().equals("增城市"))) {// 工作队，增城和从化
			q = (SQLQuery) s.getNamedQuery("family_type_group_zc_ch");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())) {// 工作队
			q = (SQLQuery) s.getNamedQuery("family_type_group");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof Admin || user instanceof ShiWorkOrg) {// 市级管理员或超级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_all");
		} else {
			return page;
		}

		// 具体一个村
		if (cunId != null) {
			logger.info("查询具体村id=" + cunId);
			String sql = q.getQueryString();
			sql += " and c.id=" + cunId;
			q = s.createSQLQuery(sql);
		}else if (zhenId != null) {
			logger.info("查询具体镇id=" + zhenId);
			String sql = q.getQueryString();
			sql += " and z.id=" + zhenId;
			q = s.createSQLQuery(sql);
		}else if (areaId != null) {
			logger.info("查询区县id=" + areaId);
			String sql = q.getQueryString();
			sql += " and a.id=" + areaId;
			q = s.createSQLQuery(sql);
		}

		// 设置参数
		for (String key : nameParams.keySet()) {
			q.setParameter(key, nameParams.get(key));
		}

		// 设置总数
		int count = q.list().size();
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count);

		// 填充数据
		
		//统计总计
		List list = q.list();
		int[][] sumArr = new int[2][9];
		for (Object obj : list) {
			Object[] values = (Object[]) obj;
			BigInteger type1 = (BigInteger) values[1];
			BigInteger type2 = (BigInteger) values[2];
			BigInteger type3 = (BigInteger) values[3];
			BigInteger type4 = (BigInteger) values[4];
			BigInteger sum = (BigInteger) values[5];
			//arr
			sumArr[1][0] += type1.intValue();
			sumArr[1][1] += type2.intValue();
			sumArr[1][2] += type3.intValue();
			sumArr[1][3] += type4.intValue();
			sumArr[1][4] += sum.intValue();
			sumArr[1][5] += type1.intValue() + type2.intValue();
			sumArr[1][6] += type3.intValue() + type4.intValue();
			sumArr[1][7] += type1.intValue() + type3.intValue();
			sumArr[1][8] += type2.intValue() + type4.intValue();
		}
		logger.debug("查询总条数：" + list.size());
		
		//填充当前页
		q.setFirstResult(startIndex);
		q.setMaxResults(WebConstants.PAGE_SIZE);
		// 开始执行
		list = q.list();
		List<FamilyTypeStatDO> rstList = new ArrayList<FamilyTypeStatDO>();
		for (Object obj : list) {
			Object[] values = (Object[]) obj;
			String cunName = (String) values[0];
			BigInteger type1 = (BigInteger) values[1];
			BigInteger type2 = (BigInteger) values[2];
			BigInteger type3 = (BigInteger) values[3];
			BigInteger type4 = (BigInteger) values[4];
			BigInteger sum = (BigInteger) values[5];
			//arr
			sumArr[0][0] += type1.intValue();
			sumArr[0][1] += type2.intValue();
			sumArr[0][2] += type3.intValue();
			sumArr[0][3] += type4.intValue();
			sumArr[0][4] += sum.intValue();
			sumArr[0][5] += type1.intValue() + type2.intValue();
			sumArr[0][6] += type3.intValue() + type4.intValue();
			sumArr[0][7] += type1.intValue() + type3.intValue();
			sumArr[0][8] += type2.intValue() + type4.intValue();
			rstList.add(new FamilyTypeStatDO(cunName, type1.longValue(), type2.longValue(), type3.longValue(), type4.longValue(), sum.longValue()));
		}
		logger.debug("查询数据条数：" + list.size());
		
		// 设置page数据
		page.setResultList(rstList);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		page.setTotal(sumArr);
		return page;

	}


	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Long cunId, Long zhenId, Long areaId) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();

		SQLQuery q = null;

		Map<String, Object> nameParams = new HashMap<String, Object>();

		if (user instanceof Org) {// 单位
			q = (SQLQuery) s.getNamedQuery("family_type_org");
			nameParams.put("loginName", user.getLoginName());
		} else if (user instanceof ZhenWorkOrg) {// 镇级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_zhen");
			nameParams.put("zhenId", ((ZhenWorkOrg) user).getZhen().getId());
		} else if (user instanceof WorkTeam) {// 工作组
			q = (SQLQuery) s.getNamedQuery("family_type_team");
			nameParams.put("loginName", user.getLoginName());
		} else if (user instanceof AreaWorkOrg && !"Y".equals(((AreaWorkOrg) user).getIsWorkGroup()) && 
				(((AreaWorkOrg) user).getArea().getName().equals("从化市") || ((AreaWorkOrg) user).getArea().getName().equals("增城市"))) {// 区县管理员-ch & zc
			q = (SQLQuery) s.getNamedQuery("family_type_area_zc_ch");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && !"Y".equals(((AreaWorkOrg) user).getIsWorkGroup())) {// 区县管理员
			q = (SQLQuery) s.getNamedQuery("family_type_area");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup()) && 
				(((AreaWorkOrg) user).getArea().getName().equals("从化市") || ((AreaWorkOrg) user).getArea().getName().equals("增城市"))) {// 工作队，增城和从化
			q = (SQLQuery) s.getNamedQuery("family_type_group_zc_ch");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())) {// 工作队
			q = (SQLQuery) s.getNamedQuery("family_type_group");
			nameParams.put("areaId", ((AreaWorkOrg) user).getArea().getId());
		} else if (user instanceof Admin || user instanceof ShiWorkOrg) {// 市级管理员或超级管理员
			q = (SQLQuery) s.getNamedQuery("family_type_all");
		} else {
			return null;
		}

		// 具体一个村
		if (cunId != null) {
			logger.info("查询具体村id=" + cunId);
			String sql = q.getQueryString();
			sql += " and c.id=" + cunId;
			q = s.createSQLQuery(sql);
		}else if (zhenId != null) {
			logger.info("查询具体镇id=" + zhenId);
			String sql = q.getQueryString();
			sql += " and z.id=" + zhenId;
			q = s.createSQLQuery(sql);
		}else if (areaId != null) {
			logger.info("查询区县id=" + areaId);
			String sql = q.getQueryString();
			sql += " and a.id=" + areaId;
			q = s.createSQLQuery(sql);
		}

		// 设置参数
		for (String key : nameParams.keySet()) {
			q.setParameter(key, nameParams.get(key));
		}

		// 开始执行
		List list = q.list();
		List<FamilyTypeStatDO> rstList = new ArrayList<FamilyTypeStatDO>();
		int[] sumArr = new int[9];
		for (Object obj : list) {
			Object[] values = (Object[]) obj;
			String cunName = (String) values[0];
			BigInteger type1 = (BigInteger) values[1];
			BigInteger type2 = (BigInteger) values[2];
			BigInteger type3 = (BigInteger) values[3];
			BigInteger type4 = (BigInteger) values[4];
			BigInteger sum = (BigInteger) values[5];
			//arr
			sumArr[0] += type1.intValue();
			sumArr[1] += type2.intValue();
			sumArr[2] += type3.intValue();
			sumArr[3] += type4.intValue();
			sumArr[4] += sum.intValue();
			sumArr[5] += type1.intValue() + type2.intValue();
			sumArr[6] += type3.intValue() + type4.intValue();
			sumArr[7] += type1.intValue() + type3.intValue();
			sumArr[8] += type2.intValue() + type4.intValue();
			rstList.add(new FamilyTypeStatDO(cunName, type1.longValue(), type2.longValue(), type3.longValue(), type4.longValue(), sum.longValue()));
		}
		logger.debug("查询数据条数：" + list.size());

		PageBean<FamilyTypeStatDO> pageBean = new PageBean<FamilyTypeStatDO>();
		pageBean.setResultList(rstList);
		pageBean.setTotal(sumArr);
		return pageBean;
	}
	
}
