package com.throne212.tui5.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.ScoreDao;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

@Repository("scoreDao")
public class ScoreDaoImpl extends BaseDaoImpl implements ScoreDao {

	public PageBean<Task> getMyScore(Integer pageIndex, User user) {
		List params = new ArrayList();
		String hql = "from Score where user=? order by time desc";
		params.add(user);
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}
	
	public PageBean<Task> getMyFinance(Integer pageIndex, User user, int... type) {
		List params = new ArrayList();
		String hql = "from Finance where user=?";
		params.add(user);
		if(type != null && type.length > 0){
			int t = type[0];
			hql += " and type=?";
			params.add(t);
		}
		hql += " order by time desc";
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}
	
	public PageBean getMyMoneyRecords(Integer pageIndex, User user){
		List params = new ArrayList();
		String hql = "from MoneyRecord where user=? and type=0 order by completeTime desc,applyTime desc";
		params.add(user);
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}

}
