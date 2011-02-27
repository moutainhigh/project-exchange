package com.throne212.siliao.dao.impl;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.dao.FinanceDao;
import com.throne212.siliao.domain.ProviderFinance;

public class FinanceDaoImpl extends BaseDaoImpl implements FinanceDao {

	
	public PageBean<ProviderFinance> getProviderFinanceList(Long farmId,Long factoryId,Long providerId, Date fromDate, Date toDate, Integer pageIndex){
		return null;
	}
	public PageBean<ProviderFinance> getProviderFinanceList(Long farmId,Long factoryId,Long providerId, Date fromDate, Date toDate){
		return null;
	}
}
