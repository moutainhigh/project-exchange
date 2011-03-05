package com.throne212.siliao.biz;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ProviderFinance;

//财务cases
public interface StatBiz extends BaseBiz {
	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex,int pageSize);
	public String  getProviderFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);

	//农户统计
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer pageIndex,int pageSize);
	public String getFarmerFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate);
	
	
	// 厂商结算
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex,int pageSize);
	public String  getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);
	public ProviderFinance payProvider(ProviderFinance pf);
	
	
	// 农户结算
	public PageBean<FarmerFinance> getFarmerSettleFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer pageIndex,int pageSize);
	public String  getFarmerSettleFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate);
	public FarmerFinance payFarmer(FarmerFinance pf);
	
	//农场统计
	public Object[] getFarmStatListArr(Long farmId);
	public String exportFarmStatList(Long farmId);
	
	//集团统计
	public Object[] getSysStatListArr();
	public String exportSysStatList();
}
