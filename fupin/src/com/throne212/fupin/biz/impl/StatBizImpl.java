package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.StatBiz;
import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.StatDao;
import com.throne212.fupin.domain.User;

public class StatBizImpl extends BaseBizImpl implements StatBiz {

	private StatDao statDao;
	
	public StatDao getStatDao() {
		return statDao;
	}

	public void setStatDao(StatDao statDao) {
		this.statDao = statDao;
	}

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Integer pageIndex) {
		return statDao.getFamilyTypeByUser(user, pageIndex);
	}

}
