package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ZixunDao;
import com.throne212.fupin.domain.Zixun;


public class ZixunDaoImpl extends BaseDaoImpl implements ZixunDao{

	public PageBean getAllZixun(Integer pageIndex) {
		PageBean<Zixun> page = new PageBean<Zixun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from Zixun t order by createDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Zixun> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE_FRONT).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	
}
