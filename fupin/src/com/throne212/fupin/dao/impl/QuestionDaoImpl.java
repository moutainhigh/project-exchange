package com.throne212.fupin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.QuestionDao;
import com.throne212.fupin.dataobject.State;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;
import com.throne212.fupin.domain.User;

public class QuestionDaoImpl extends BaseDaoImpl implements QuestionDao {
	
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex, int year) {
		PageBean<Question1> page = new PageBean<Question1>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Question1 q where year=" + year;
		
		if(cunId != null){
			hql += " and cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			hql += " and cun.zhen.area.id="+a.getArea().getId()+" and cun.zhen.isNS='N'";
		}
		
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<Question1> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}

	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex, int year) {
		PageBean<Question2> page = new PageBean<Question2>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Question2 q where year=" + year;
		
		if(cunId != null){
			hql += " and family.cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and family.cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and family.cun.zhen.area.id=" + areaId;
		}
		
		Object[] params = new Object[]{};
		if(!Util.isEmpty(familyName)){
			hql += " and family.name like ?";
			params = new Object[]{"%"+familyName+"%"};
		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			hql += " and family.cun.zhen.area.id="+a.getArea().getId()+" and family.cun.zhen.isNS='N'";
		}
		
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,params).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		for(int i=0;i<params.length;i++){
			q.setParameter(i, params[i]);
		}
		List<Question2> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public QuestionStatDO statQuestion1(Long areaId, Long zhenId, int year){
		QuestionStatDO q = new QuestionStatDO();
		Question1 tq = new Question1();
		q.setQ(tq);
		
		String hql = "from Question1 q where status=1 and year=" + year;
		if(zhenId != null){
			hql += " and cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and cun.zhen.area.id=" + areaId;
		}
		
		String[] isNS = (String[]) ActionContext.getContext().getParameters().get("is_ns");
		if(isNS != null && isNS.length > 0 && !Util.isEmpty(isNS[0])){
			hql += " and cun.zhen.isNS='" + isNS[0] + "'";
		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			hql += " and cun.zhen.area.id="+a.getArea().getId()+" and cun.zhen.isNS='N'";
		}
		
		List<Question1> list = this.getHibernateTemplate().find(hql);
		if(list == null || list.size() == 0)
			return q;
		
		for(int i=1;i<=100;i++){
			tq.setItem(i, 0.0);
		}
		
		double avePersonIncome = 0;
		int totalPerson = 0;
		for(Question1 q1 : list){
			for(int i=1;i<=104;i++){
				if(q1.getItem(i) == null)
					continue;
				//统计代码
				if(q1.getYear() == 2011 && (i==2 || i==3 || i==6 || i==7 || i==8 || i==9 || i==10 
						|| i==11 || i==12 || i==13 || i==24 || i==47 || i==76 || i==77 
						|| i==97 || i==98 || i==99 || i==100)){
					q.addNum(i, q1.getItem(i));
				}else if(q1.getYear() == 2012 && (i==2 || i==3 || i==6 || i==7 || i==8 || i==9 || i==10 
						|| i==11 || i==12 || i==13 || i==29 || i==51 || i==80 || i==81 
						|| i==101 || i==102 || i==103 || i==104)){
					q.addNum(i, q1.getItem(i));
				}else{
					//统计数字
					if(tq.getItem(i) != null)
						tq.setItem(i, q1.getItem(i) + tq.getItem(i));
				}
			}
			totalPerson += q1.getItem45();
			avePersonIncome += (q1.getItem45() * q1.getItem48());
		}
		
		//计算人均年收入
		double a = avePersonIncome / totalPerson;
		int b = (int)(a * 100.0);
		double c = b / 100.0;
		q.getQ().setItem48(c);
		
		//统计百分
		if(year == 2011){
			tq.setItem36((tq.getItem35() / tq.getItem34()) * 100);
			tq.setItem46((tq.getItem45() / tq.getItem40()) * 100);
			tq.setItem52((tq.getItem51() / (tq.getItem49()-tq.getItem50())) * 100);
			tq.setItem54((tq.getItem53() / (tq.getItem49()-tq.getItem50())) * 100);
			tq.setItem62((tq.getItem61() / tq.getItem38()) * 100);
			tq.setItem65((tq.getItem64() / tq.getItem39()) * 100);
		}else{
			tq.setItem40((int)(tq.getItem39() / tq.getItem38() * 10000) / 100.0);
			tq.setItem50((int)(tq.getItem49() / tq.getItem44() * 10000) / 100.0);
			tq.setItem56((int)(tq.getItem55() / (tq.getItem53()-tq.getItem54()) * 10000) / 100.0);
			tq.setItem58((int)(tq.getItem57() / (tq.getItem53()-tq.getItem54()) * 10000) / 100.0);
			tq.setItem66((int)(tq.getItem65() / tq.getItem42() * 10000) / 100.0);
			tq.setItem69((int)(tq.getItem68() / tq.getItem43() * 10000) / 100.0);
		}
		
		return q;
	}
	
	public QuestionStatDO statQuestion2(Long areaId, Long zhenId, Long cunId, int year){
		QuestionStatDO q = new QuestionStatDO();
		Question2 tq = new Question2();
		q.setQ(tq);
		
		String hql = "from Question2 q where family.type in (1,2,3,4) and status=1 and year=" + year;
		if(cunId != null){
			hql += " and family.cun.id=" + cunId;
		}else if(zhenId != null){
			hql += " and family.cun.zhen.id=" + zhenId;
		}else if(areaId != null){
			hql += " and family.cun.zhen.area.id=" + areaId;
		}
		
		String[] isNS = (String[]) ActionContext.getContext().getParameters().get("is_ns");
		if(isNS != null && isNS.length > 0 && !Util.isEmpty(isNS[0])){
			hql += " and family.cun.zhen.isNS='" + isNS[0] + "'";
		}
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			hql += " and family.cun.zhen.area.id="+a.getArea().getId()+" and family.cun.zhen.isNS='N'";
		}
		
		List<Question2> list = this.getHibernateTemplate().find(hql);
		if(list == null || list.size() == 0)
			return q;
		
		for(int i=1;i<=47;i++){
			tq.setItem(i, 0.0);
		}
		
		for(Question2 q2 : list){
			for(int i=1;i<=47;i++){
				if(q2.getItem(i) == null)
					continue;
				//统计代码
				if(i==1 || i==29){
					q.addNum(i, q2.getItem(i));
				}else{
					//统计数字
					tq.setItem(i, q2.getItem(i) + tq.getItem(i));
				}
			}
		}
		
		//计算平均值
		double familyAveIn = tq.getItem5() + tq.getItem6() + tq.getItem10() + tq.getItem17() - tq.getItem24();
		familyAveIn = familyAveIn / tq.getItem2();
		familyAveIn = (int)(familyAveIn * 100) / 100.0;
		tq.setItem4(familyAveIn);
		
		return q;
	}
	
	public PageBean<Family> getFamilyList(String familyName, Integer pageIndex, int year){		
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);		
		PageBean<Family> page = new PageBean<Family>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from Family f where f.cun.id=" + org.getCun().getId();
		
		Object[] params = new Object[]{};
		if(!Util.isEmpty(familyName)){
			hql += " and f.name like ?";
			params = new Object[]{"%"+familyName+"%"};
		}
		
		hql+=" order by id desc";
		logger.debug("hql="+hql);
		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql,params).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		Query q = s.createQuery(hql);
		for(int i=0;i<params.length;i++){
			q.setParameter(i, params[i]);
		}
		List<Family> list = q.setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		for(Family f : list){
			List<Question2> q2List = this.getHibernateTemplate().find("from Question2 where family=? and year=?", new Object[]{f, year});
			if(q2List != null && q2List.size() > 0){
				f.setQ2(q2List.get(0));
			}
		}
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;
	}
	
	public List<State> state1(int year){
		List<State> list = new ArrayList<State>();
		String q = "from Cun c where 1=1 ";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			q += " and zhen.area.id="+a.getArea().getId()+" and zhen.isNS='N'";
		}
		
		q += " order by c.zhen.area.id,c.zhen.id";
		List<Cun> cunList = this.getHibernateTemplate().find(q);
		for (Cun c : cunList) {
			State s = new State();
			s.setArea(c.getZhen().getArea().getName());
			s.setZhen(c.getZhen().getName());
			s.setCun(c.getName());
			s.setOrg(c.getOrg().getOrgName());
			
			String hql = "from Question1 q1 where cun=? and year=?";
			List<Question1> q1List = this.getHibernateTemplate().find(hql, new Object[]{c, year});
			if(q1List == null || q1List.size() == 0){
				s.setOk1(null);
			}else{
				Integer status = q1List.get(0).getStatus();
				String str = "";
				if(status == null){
					str = "";
				}else if(status == 0){
					str = "草稿";
				}else if(status == 1){
					str = "已提交";
				}else if(status == 2){
					str = "申请解锁中";
				}
				s.setOk1(str);
			}
			
			list.add(s);
		}
		return list;
	}
	
	public List<State> state2(int year){
		List<State> list = new ArrayList<State>();
		String q = "from Cun c where 1=1";
		
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if(user instanceof AreaWorkOrg && "Y".equals(((AreaWorkOrg) user).getIsWorkGroup())){
			AreaWorkOrg a = (AreaWorkOrg) user;
			q += " and zhen.area.id="+a.getArea().getId()+" and zhen.isNS='N'";
		}
		
		q += " order by c.zhen.area.id,c.zhen.id";
		List<Cun> cunList = this.getHibernateTemplate().find(q);
		for (Cun c : cunList) {
			State s = new State();
			s.setArea(c.getZhen().getArea().getName());
			s.setZhen(c.getZhen().getName());
			s.setCun(c.getName());
			s.setOrg(c.getOrg().getOrgName());
			
			String hql = "select count(*) from Family where cun=?";
			Long count = (Long) this.getHibernateTemplate().find(hql, c).get(0);
			s.setOk1(count + "");
			
			hql = "select count(*) from Question2 q2 where family.cun=? and year=? and status=1";
			count = (Long) this.getHibernateTemplate().find(hql, new Object[]{c,year}).get(0);
			s.setOk2(count + "");
			
			hql = "select count(*) from Question2 q2 where family.cun=? and year=? and status=2";
			count = (Long) this.getHibernateTemplate().find(hql, new Object[]{c,year}).get(0);
			s.setOk3(count + "");
			
			list.add(s);
		}
		return list;
	}

}
