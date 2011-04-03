package com.throne212.fupin.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.DiscussDao;
import com.throne212.fupin.domain.Discuss;
import com.throne212.fupin.domain.Zixun;

public class DiscussDaoImpl extends BaseDaoImpl implements DiscussDao {

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//获取所有主题帖
	public PageBean<Discuss> getAllDiscuss(Integer pageIndex) {
		PageBean<Discuss> page = new PageBean<Discuss>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE_FRONT;
		String hql = "from Discuss t where t.pid=0 order by createDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Discuss> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE_FRONT).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	
	
	
	

}
