package com.throne212.fupin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ContactGroupDao;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;

public class ContactGroupDaoImpl extends BaseDaoImpl implements ContactGroupDao {

	public PageBean<ContactGroup> getGroupOfUser(String queryKey,String userName, Integer pageIndex) {

		PageBean<ContactGroup> page = new PageBean<ContactGroup>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from ContactGroup t ";
		if (userName!=null&&!"".equals(userName)) {
			hql+=" where t.userName='"+userName+"'";
		}
		if (queryKey!=null&&!"".equals(queryKey)) {
			hql+=" and t.groupName like '%"+queryKey+"%'";
		}
		
		hql+=" order by id desc";
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<ContactGroup> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	
	}

	public List<ContactGroup> getAllContactTree(String userName){
		List<ContactGroup> list = null;
		List<ContactGroup> returnList = new ArrayList<ContactGroup>();
		String hql = "from ContactGroup t  where t.userName=? and parentGroup is null";
		list = this.getHibernateTemplate().find(hql, userName);
		//if(list != null && list.size() > 0){
			for(ContactGroup g : list){
				g.setShowTreeName(g.getGroupName());
				returnList.add(g);
				fillChildGroup(g,userName,returnList,1);
				fillContact(g,userName);
				
				
			}
		//}
		
		return returnList;
	}
	
	private void fillChildGroup(ContactGroup parentGroup,String userName,List<ContactGroup> groupList,int level){
		String hql = "from ContactGroup t  where t.userName=? and parentGroup=?";
		List<ContactGroup> list = this.getHibernateTemplate().find(hql, new Object[]{userName,parentGroup});
		//if(list !=null && list.size()>0){
		String blank = "";
		for(int i=0;i<level;i++)
			blank += "--";
		
		for(ContactGroup g : list){
				g.setShowTreeName(blank+g.getGroupName());
				groupList.add(g);
				fillChildGroup(g,userName,groupList,level+1);
				fillContact(g,userName);
				
			}
		//}
	}
	
	private void fillContact(ContactGroup g,String userName){
		String hql = "from Contact t  where t.owner=? and group=?";
		List<Contact> list = this.getHibernateTemplate().find(hql, new Object[]{userName,g});
		g.setContactList(list);
	}
	
}
