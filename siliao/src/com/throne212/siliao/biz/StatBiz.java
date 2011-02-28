package com.throne212.siliao.biz;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ProviderFinance;

//财务cases
public interface StatBiz extends BaseBiz {
	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page);
	public String  getProviderFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);

	//农户统计
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer page);
	public String getFarmerFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate);
	
	
	// 厂商结算
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer page);
	public String  getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);
	public ProviderFinance payProvider(ProviderFinance pf);
}
