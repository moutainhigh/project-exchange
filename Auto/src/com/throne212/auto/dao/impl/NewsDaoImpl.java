package com.throne212.auto.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.NewsDao;
import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Insurance;
import com.throne212.auto.domain.News;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.Zhuangshi;

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
	public long getNewsListCount(int type){
		return (Long) this.getHibernateTemplate().find("select count(*) from News n where n.category.orderNum=?",type).get(0);
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
	public List<Zhuangshi> getTop3Zhuangshi(){
		String hql = "from Zhuangshi z where z.recommend = true and z.image != null order by id";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setMaxResults(2).list();
	}
	public List<Insurance> getTop3Baoxian(){
		String hql = "from Insurance z where z.recommend = true and z.image != null order by id";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setMaxResults(3).list();
	}
	
	public List<Brand> getBrandList(){
		String hql = "from Brand b where b.parentBrand=null order by b.orderNum";
		List<Brand> topBrands = this.getHibernateTemplate().find(hql);
		List<Brand> list = new ArrayList<Brand>();
		if(topBrands != null && topBrands.size() > 0){
			hql = "from Brand b where parentBrand=? order by b.orderNum";
			for(Brand b : topBrands){
				list.add(b);
				List<Brand> childBrands = this.getHibernateTemplate().find(hql, b);
				if(childBrands != null && childBrands.size() > 0)
					list.addAll(childBrands);
			}
		}
		return list;
	}

	public List<Brand> getChildBrandList(Brand parent){
		String hql = "from Brand b where b.parentBrand=? order by b.orderNum";
		return this.getHibernateTemplate().find(hql, parent);
	}
	public List<Brand> getTopBrandList(){
		String hql = "from Brand b where b.parentBrand=null order by b.orderNum";
		return this.getHibernateTemplate().find(hql);
	}
	public List<Brand> getBrandList(Sale sale){
		List<Brand> list = new ArrayList<Brand>();
		List<Brand> allBrands = getTopBrandList();
		for(Brand b : allBrands){
			String hql = "select count(*) from Car c where c.sale=? and (c.brand=? or c.brand.parentBrand=?)";
			long size = (Long)this.getHibernateTemplate().find(hql,new Object[]{sale,b,b}).get(0);
			if(size > 0){
				list.add(b);
				String hql2 = "from Brand b where b.parentBrand=?";
				List<Brand> childBrands = this.getHibernateTemplate().find(hql2, b);
				b.setChildBrands(childBrands);
			}
		}
		return list;
	}
	public List<Sale> getTop10Sale(){
		String hql = "from Sale s where s.recommend=true order by s.createdDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setMaxResults(10).list();
	}
	public List<News> getTop10Xinde(){
		String hql = "from News n where (n.category.orderNum=? or n.category.orderNum=?)  and n.recommend=true order by publishDate desc";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		return s.createQuery(hql).setParameter(0, WebConstants.NEWS_JINGJI_XINDE).setParameter(1, WebConstants.NEWS_ZHONGJI_XINDE).setMaxResults(10).list();
	}
}
