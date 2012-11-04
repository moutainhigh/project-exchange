package com.throne212.tui5.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.AllianceDao;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.User;

@Repository("allianceDao")
public class AllianceDaoImpl extends BaseDaoImpl implements AllianceDao {

	public PageBean<Alliance> getTaskList(Integer pageIndex, User user){
		List params = new ArrayList();
		String hql = "from Alliance where user=? order by id desc";
		params.add(user);
		return buildBean(pageIndex, Const.MEMBER_PAGE_SIZE, hql, params);
	}

}
