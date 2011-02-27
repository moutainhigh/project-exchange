package com.throne212.siliao.biz.impl;

import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.dao.FinanceDao;

public class StatBizImpl extends BaseBizImpl implements StatBiz {
	
	private FinanceDao financeDao;

	public FinanceDao getFinanceDao() {
		return financeDao;
	}

	public void setFinanceDao(FinanceDao financeDao) {
		this.financeDao = financeDao;
	}
	
	

}
