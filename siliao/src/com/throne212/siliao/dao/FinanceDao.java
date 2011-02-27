package com.throne212.siliao.dao;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.ProviderFinance;


public interface FinanceDao extends BaseDao {
	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(Long farmId,Long factoryId,Long providerId, Date fromDate, Date toDate, Integer pageIndex);
	public PageBean<ProviderFinance> getProviderFinanceList(Long farmId,Long factoryId,Long providerId, Date fromDate, Date toDate);
}
