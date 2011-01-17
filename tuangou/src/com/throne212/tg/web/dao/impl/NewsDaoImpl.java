package com.throne212.tg.web.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.NewsDao;
import com.throne212.tg.web.domain.News;
import com.throne212.tg.web.domain.Teams;

public class NewsDaoImpl extends BaseDaoImpl implements NewsDao {

	public PageBean<News> getAllNews(int pageIndex) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<News> page = new PageBean<News>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_TEAM;
		String hql = "from News t order by t.lastModifyDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<News> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_TEAM).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_TEAM);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}

}
