package com.throne212.auto.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Special;

public class NewsDaoImpl extends BaseDaoImpl implements NewsDao {

	public List<News> getNewsList(int first, int max) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from News n where n.category!=null order by publishDate desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public List<News> getNewsList(int first,int max,String key){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from News n where n.category!=null and (n.title like ? or n.seoDesc like ?) order by publishDate desc");
		return q.setParameter(0, "%"+key+"%").setParameter(1, "%"+key+"%").setMaxResults(max).setFirstResult(first).list();
	}
	public List<Special> getSpecialList(int first,int max,String key){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Special n where n.title like ? or n.seoDesc like ? order by publishDate desc");
		return q.setParameter(0, "%"+key+"%").setParameter(1, "%"+key+"%").setMaxResults(max).setFirstResult(first).list();
	}
	public List<News> getNewsList(int first, int max,int type) {
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from News n where n.category.orderNum=? order by publishDate desc");
		return q.setParameter(0, type).setMaxResults(max).setFirstResult(first).list();
	}
	public List<Special> getSpecialList(int first,int max){
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery("from Special n order by publishDate desc");
		return q.setMaxResults(max).setFirstResult(first).list();
	}
	public long getNewsListCount(){
		return (Long) this.getHibernateTemplate().find("select count(*) from News n where n.category!=null").get(0);
	}
	public long getNewsListCount(String key){
		return (Long) this.getHibernateTemplate().find("select count(*) from News n where n.category!=null and (n.title like ? or n.seoDesc like ?)",new Object[]{"%"+key+"%","%"+key+"%"}).get(0);
	}
	public long getSpecialListCount(String key){
		return (Long) this.getHibernateTemplate().find("select count(*) from Special n where n.title like ? or n.seoDesc like ?",new Object[]{"%"+key+"%","%"+key+"%"}).get(0);
	}
	
	public News getLastedRecommendNews(){
		/*String hql = "from News n where n.category.orderNum=? and n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<News> list = s.createQuery(hql).setParameter(0, WebConstants.NEWS_NEWS).setMaxResults(1).list();
		if(list == null || list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}*/
		String hql = "from Special n where n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Special> list = s.createQuery(hql).setMaxResults(1).list();
		if(list == null || list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}
	}
	public News getFocusNews(){
		String hql = "from News n where n.category.orderNum!=null and n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<News> list = s.createQuery(hql).setMaxResults(1).list();
		if(list == null || list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}
	}
	public News getRecommendNews(int type){
		String hql = "from News n where n.category.orderNum=? and n.image!=null and n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<News> list = s.createQuery(hql).setParameter(0, type).setMaxResults(1).list();
		if(list == null || list.size() == 0){
			return null;
		}else{
			return list.get(0);
		}
	}
	public List<News> getTop4RecommendImageNews(){
		String hql = "from News n where n.image!=null and n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setMaxResults(4).list();
	}

}
