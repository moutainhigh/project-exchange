package com.throne212.tg.web.dao.impl;

import java.util.Collection;
import java.util.List;

import org.hibernate.Session;
import org.htmlparser.lexer.PageIndex;

import com.throne212.tg.web.common.PageBean;
import com.throne212.tg.web.common.WebConstants;
import com.throne212.tg.web.dao.CommentDao;
import com.throne212.tg.web.domain.Comment;

public class CommentDaoImpl extends BaseDaoImpl implements CommentDao {

	public PageBean<Comment> getAllCommentsByTeamId(int pageIndex, long teamId) {
		logger.debug(pageIndex);
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		
		PageBean<Comment> page = new PageBean<Comment>();
		int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_SITE;
		String hql = "from Comment c where c.team.id='"+teamId+"' order by c.lastModifyDate desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Comment> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_SITE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_SITE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page; 
	}

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids) {
		// TODO Auto-generated method stub
		return null;
	}
	public PageBean<Comment> getAllComments(int pageIndex){
		
		
		
			logger.debug(pageIndex);
			if (pageIndex == 0) {
				pageIndex = 1;
			}
			
			PageBean<Comment> page = new PageBean<Comment>();
			int startIndex = (pageIndex - 1) * WebConstants.NUM_PER_BACK_PAGE_SITE;
			String hql = "from Comment c order by c.lastModifyDate desc";
			Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
			logger.debug("查询总数为：" + count);
			page.setTotalRow(count.intValue());// 总记录数目
			Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
			List<Comment> list = s.createQuery(hql).setMaxResults(WebConstants.NUM_PER_BACK_PAGE_SITE).setFirstResult(startIndex).list();
			page.setResultList(list);// 数据列表
			page.setRowPerPage(WebConstants.NUM_PER_BACK_PAGE_SITE);// 每页记录数目
			page.setPageIndex(pageIndex);// 当前页码
			return page; 
		
		
		
		
		
	}
}
