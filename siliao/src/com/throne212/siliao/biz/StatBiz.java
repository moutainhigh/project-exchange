package com.throne212.siliao.biz;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.ProviderFinance;

//财务cases
public interface StatBiz extends BaseBiz {
	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page);

	public String getProviderFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);
}
