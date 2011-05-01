package com.throne212.fupin.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ManagerDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;


public class ManagerDaoImpl extends BaseDaoImpl implements ManagerDao{

	public PageBean getAllManager(Integer pageIndex) {
		PageBean<Org> page = new PageBean<Org>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Org t order by id";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Org> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean getAllManager(String name, Integer pageIndex) {
		PageBean<Org> page = new PageBean<Org>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Org t where loginName like ? order by id";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, "%"+name+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Org> list = s.createQuery(hql).setParameter(0, "%"+name+"%").setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllCun(Integer pageIndex) {
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun c where 1=1";
		
		Object[] param = null;
		
		//根据用户不同，得到不同的数据
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			hql += " and (c.org=? or c.id=?)";
			Org org = (Org)user;
			param = new Object[]{org,org.getCun()==null?null:org.getCun().getId()};
		}else if(user instanceof ZhenWorkOrg){
			hql += " and c.zhen=?";
			ZhenWorkOrg zhenOrg = (ZhenWorkOrg) user;
			param = new Object[]{zhenOrg.getZhen()};
		}else if(user instanceof AreaWorkOrg){
			hql += " and c.zhen.area=?";
			AreaWorkOrg areaOrg = (AreaWorkOrg) user;
			param = new Object[]{areaOrg.getArea()};
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql , param).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		if(param != null){
			for(int i=0;i<param.length;i++){
				q.setParameter(i, param[i]);
			}
		}
		List<Cun> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean getAllCun(String name, Integer pageIndex) {
		
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun c where 1=1";
		
		Object[] param = {"%"+name+"%"};
		
		//根据用户不同，得到不同的数据
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			hql += " and (c.org=? or c.id=?)";
			Org org = (Org)user;
			param = new Object[]{org,org.getCun()==null?null:org.getCun().getId(),"%"+name+"%"};
		}else if(user instanceof ZhenWorkOrg){
			hql += " and c.zhen=?";
			ZhenWorkOrg zhenOrg = (ZhenWorkOrg) user;
			param = new Object[]{zhenOrg.getZhen(),"%"+name+"%"};
		}else if(user instanceof AreaWorkOrg){
			hql += " and c.zhen.area=?";
			AreaWorkOrg areaOrg = (AreaWorkOrg) user;
			param = new Object[]{areaOrg.getArea(),"%"+name+"%"};
		}
		hql += " and name like ?";
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql , param).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		if(param != null){
			for(int i=0;i<param.length;i++){
				q.setParameter(i, param[i]);
			}
		}
		List<Cun> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllFamily(Integer pageIndex) {
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family f where 1=1";
		
		Object[] param = null;
		
		//根据用户不同，得到不同的数据
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			hql += " and (f.cun.org=? or f.cun.id=?)";
			Org org = (Org)user;
			param = new Object[]{org,org.getCun()==null?null:org.getCun().getId()};
		}else if(user instanceof ZhenWorkOrg){
			hql += " and f.cun.zhen=?";
			ZhenWorkOrg zhenOrg = (ZhenWorkOrg) user;
			param = new Object[]{zhenOrg.getZhen()};
		}else if(user instanceof AreaWorkOrg){
			hql += " and f.cun.zhen.area=?";
			AreaWorkOrg areaOrg = (AreaWorkOrg) user;
			param = new Object[]{areaOrg.getArea()};
		}
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,param).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		if(param != null){
			for(int i=0;i<param.length;i++){
				q.setParameter(i, param[i]);
			}
		}
		List<Family> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean getAllFamily(String name, Integer pageIndex) {
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family f where 1=1";
		
		Object[] param = {"%"+name+"%"};
		
		//根据用户不同，得到不同的数据
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof Org){
			hql += " and (f.cun.org=? or f.cun.id=?)";
			Org org = (Org)user;
			param = new Object[]{org,org.getCun()==null?null:org.getCun().getId(),"%"+name+"%"};
		}else if(user instanceof ZhenWorkOrg){
			hql += " and f.cun.zhen=?";
			ZhenWorkOrg zhenOrg = (ZhenWorkOrg) user;
			param = new Object[]{zhenOrg.getZhen(),"%"+name+"%"};
		}else if(user instanceof AreaWorkOrg){
			hql += " and f.cun.zhen.area=?";
			AreaWorkOrg areaOrg = (AreaWorkOrg) user;
			param = new Object[]{areaOrg.getArea(),"%"+name+"%"};
		}
		hql += " and name like ?";
		
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, param).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		if(param != null){
			for(int i=0;i<param.length;i++){
				q.setParameter(i, param[i]);
			}
		}
		List<Family> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllFamily(Org org,Integer pageIndex){
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family t where cun.org=? order by id";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, new Object[]{org}).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Family> list = s.createQuery(hql).setParameter(0, org).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllFamily(Org org,String name,Integer pageIndex){
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family t where cun.org=? and name like ? order by id";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql, new Object[]{org,"%"+name+"%"}).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Family> list = s.createQuery(hql).setParameter(0, org).setParameter(1, "%"+name+"%").setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllLeader(Long orgId,Integer pageIndex){
		PageBean<Leader> page = new PageBean<Leader>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Leader t where org.id="+orgId;
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Leader> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public PageBean getAllLeader(Long orgId,String name,Integer pageIndex){
		PageBean<Leader> page = new PageBean<Leader>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Leader t where org.id="+orgId+" and leaderName like ?";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,"%"+name+"%").get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Leader> list = s.createQuery(hql).setParameter(0, "%"+name+"%").setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	public PageBean getAllCun(Zhen zhen,Integer pageIndex){
		PageBean<Cun> page = new PageBean<Cun>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Cun t where zhen=? order by id";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,zhen).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Cun> list = s.createQuery(hql).setParameter(0, zhen).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public Cun getCunByAreaAndName(Area area,String name){
		String hql = "from Cun c where c.zhen.area=? and c.name=?";
		List<Cun> list = this.getHibernateTemplate().find(hql,new Object[]{area,name});
		if(list!=null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	
	public Cun getCunByAreaZhenAndName(Area area, Zhen zhen,String name){
		String hql = "from Cun c where c.zhen.area=? and c.zhen=? and c.name=?";
		List<Cun> list = this.getHibernateTemplate().find(hql,new Object[]{area,zhen,name});
		if(list!=null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}
	
	public void deleteNonLeaderData(){
		this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session s) throws HibernateException, SQLException {
				String hql = "delete LeaderHelp lh where lh.leader not in(from Leader)";
				long rst = s.createQuery(hql).executeUpdate();
				logger.info("共删除"+rst+"条多余的干部链接数据");
				return null;
			}
		});
		
	}
	
	public void deleteFamily(Long familyId){
		String hql = "delete from ChengxiaoFamily c where c.family.id=?";
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		int len = s.createQuery(hql).setParameter(0, familyId).executeUpdate();
		
		hql = "delete from CuoshiFamily c where c.family.id=?";
		len = s.createQuery(hql).setParameter(0, familyId).executeUpdate();
		
		hql = "delete from PicFamily c where c.family.id=?";
		len = s.createQuery(hql).setParameter(0, familyId).executeUpdate();
		
		hql = "delete from Record c where c.family.id=?";
		len = s.createQuery(hql).setParameter(0, familyId).executeUpdate();
		
		hql = "delete from Reason c where c.family.id=?";
		len = s.createQuery(hql).setParameter(0, familyId).executeUpdate();
		
		super.deleteById(Family.class, familyId);
	}

}
