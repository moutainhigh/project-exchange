package com.throne212.saishi.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.common.Util;
import com.throne212.saishi.common.WebConstants;
import com.throne212.saishi.comunicate.MultiThreadServer;
import com.throne212.saishi.dao.GameDao;
import com.throne212.saishi.domain.Game;
import com.throne212.saishi.domain.Queue;
import com.throne212.saishi.domain.Tixing;

public class GameDaoImpl extends BaseDaoImpl implements GameDao {

	public PageBean<Game> getGameList(Game condition, Date startDate, Date endDate,Date fromDate, Date toDate, int pageIndex, String orderBy, String orderType, int pageSize) {
		PageBean<Game> page = new PageBean<Game>();
		int startIndex = (pageIndex - 1) * (pageSize==0?WebConstants.PAGE_SIZE:pageSize);

		Object[] hqlArr = buildFilterHQL(condition,startDate,endDate, fromDate, toDate, orderBy, orderType);
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

	private Object[] buildFilterHQL(Game condition, Date startDate, Date endDate,Date fromDate, Date toDate,String orderBy,String orderType) {
		Object[] rst = new Object[2];
		StringBuffer sb = new StringBuffer("from Game where 1=1");
		List paramValueList = new ArrayList();
		if (condition != null) {
		
			if (!Util.isEmpty(condition.getHour())) {
				sb.append(" and hour like ?");
				paramValueList.add("%" + condition.getHour() + "%");
			}
			if (!Util.isEmpty(condition.getMinute())) {
				sb.append(" and minute like ?");
				paramValueList.add("%" + condition.getMinute() + "%");
			}
			if (!Util.isEmpty(condition.getPlayer())) {
				sb.append(" and player like ?");
				paramValueList.add("%" + condition.getPlayer() + "%");
			}
			if (!Util.isEmpty(condition.getType())) {
				sb.append(" and type like ?");
				paramValueList.add("%" + condition.getType() + "%");
			}
			if (!Util.isEmpty(condition.getDuration())) {
				sb.append(" and duration like ?");
				paramValueList.add("%" + condition.getDuration() + "%");
			}
			if (!Util.isEmpty(condition.getIntro())) {
				sb.append(" and intro like ?");
				paramValueList.add("%" + condition.getIntro() + "%");
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
		if (startDate != null) {
			sb.append(" and startDate>=?");
			paramValueList.add(startDate);
		}
		if (endDate != null) {
			sb.append(" and startDate<?");
			paramValueList.add(Util.getNextDay(endDate));
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


	public void tixing(Game game){
		List<String> clientList = MultiThreadServer.list;
		logger.debug("客户数量：" + clientList.size());
		if(clientList.size() > 0){
			for(String c : clientList){
				Queue q = new Queue();
				q.setClient(c);
				q.setGame(game);
				this.saveOrUpdate(q);
			}
			//加入一条系统保存
			Queue q = new Queue();
			q.setGame(game);
			q.setClient(clientList.size()+"");//提醒的人次
			this.saveOrUpdate(q);
		}
		//填入一条提醒记录
		Tixing t = new Tixing();
		t.setGame(game);
		t.setDate(new Date());
		this.saveOrUpdate(t);
	}
	
	//最近的赛事
	public List<Game> getTopGames(){
		String hql = "from Game g order by startDate desc";
		Session s = this.getSession();
		Query q = s.createQuery(hql);
		q.setMaxResults(10);
		return q.list();
	}
	
	//最新的5条提醒
	public List<Tixing> getTopTixing(){
		String hql = "from Tixing q order by date desc";
		Session s = this.getSession();
		Query q = s.createQuery(hql);
		q.setMaxResults(5);
		return q.list();
	}
	
	//推荐视频
	public Game getGame(){
		String hql = "from Game where recommend=true order by startDate desc";
		Session s = this.getSession();
		Query q = s.createQuery(hql);
		q.setMaxResults(1);
		List<Game> list = q.list();
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

}
