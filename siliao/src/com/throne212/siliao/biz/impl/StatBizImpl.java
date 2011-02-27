package com.throne212.siliao.biz.impl;

import java.util.Date;

import com.throne212.siliao.biz.StatBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.dao.FinanceDao;
import com.throne212.siliao.domain.ProviderFinance;

public class StatBizImpl extends BaseBizImpl implements StatBiz {
	
	private FinanceDao financeDao;

	public FinanceDao getFinanceDao() {
		return financeDao;
	}

	public void setFinanceDao(FinanceDao financeDao) {
		this.financeDao = financeDao;
	}

	public String getProviderFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
