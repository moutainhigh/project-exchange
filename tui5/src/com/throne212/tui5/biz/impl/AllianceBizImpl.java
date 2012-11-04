package com.throne212.tui5.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.AllianceBiz;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.AllianceDao;
import com.throne212.tui5.dao.BaseDao;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.User;

@Service("allianceBiz")
public class AllianceBizImpl extends BaseBizImpl implements AllianceBiz {

	@Autowired
	private BaseDao baseDao;
	@Autowired
	private AllianceDao allianceDao;
	
	public PageBean<Alliance> getTaskList(Integer pageIndex, User user){
		return allianceDao.getTaskList(pageIndex, user);
	}

}
