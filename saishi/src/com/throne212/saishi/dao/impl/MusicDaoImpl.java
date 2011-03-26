package com.throne212.saishi.dao.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.dao.MusicDao;
import com.throne212.saishi.domain.Music;
import com.throne212.saishi.domain.News;

public class MusicDaoImpl extends BaseDaoImpl implements MusicDao {

	public PageBean<Music> getMusicList(Music condition, Date fromDate,
			Date toDate, int pageIndex, String orderBy, String orderType,
			int pageSize) {
		PageBean<Music> page = new PageBean<Music>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition, fromDate, toDate, orderBy, orderType);
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
		q.setMaxResults(pageSize==0?WebConstants.PAGE_SIZE:pageSize);
		q.setFirstResult(startIndex);
		page.setResultList(q.list());// 数据列表
		page.setRowPerPage(pageSize==0?WebConstants.PAGE_SIZE:pageSize);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	private Object[] buildFilterHQL(Music condition, Date fromDate, Date toDate,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Music where 1=1");
		List paramValueList = new ArrayList();
		if (condition != null) {
		
			if (!Util.isEmpty(condition.getSinger())) {
				sb.append(" and singer like ?");
				paramValueList.add("%" + condition.getSinger() + "%");
			}
			if (!Util.isEmpty(condition.getSongName())) {
				sb.append(" and songName like ?");
				paramValueList.add("%" + condition.getSongName() + "%");
			}
			if (!Util.isEmpty(condition.getFormat())) {
				sb.append(" and format like ?");
				paramValueList.add("%" + condition.getFormat() + "%");
			}
			if (!Util.isEmpty(String.valueOf(condition.getSize()))) {
				sb.append(" and size like ?");
				paramValueList.add("%" + condition.getSize() + "%");
			}
		}
		// 创建时间段
		if (fromDate != null) {
			sb.append(" and createDate>=?");
			paramValueList.add(fromDate);
		}
		if (toDate != null) {
			sb.append(" and createDate<?");
			paramValueList.add(Util.getNextDay(toDate));
		}
		//排序
		if(!Util.isEmpty(orderBy)){
			sb.append(" order by " + orderBy + " " + orderType);
		}else{
			sb.append(" order by id");
		}		
		logger.debug("hql=[" + sb.toString() + "]");
		rst[0] = sb.toString();
		rst[1] = paramValueList;
		return rst;
	}

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

}
