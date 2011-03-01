package com.throne212.siliao.dao;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.FarmerStatDO;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.ProviderStatDO;
import com.throne212.siliao.domain.FarmerFinance;
import com.throne212.siliao.domain.ProviderFinance;


public interface FinanceDao extends BaseDao {
	// 厂商统计
	public PageBean<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex);
	public List<ProviderFinance> getProviderFinanceList(ProviderFinance condition, Date fromDate, Date toDate);
	
	//农户统计
	public PageBean<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer page);
	public List<FarmerFinance> getFarmerFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate);
	
	// 厂商结算
	public PageBean<ProviderFinance> getProviderSettleFinanceList(ProviderFinance condition, Date fromDate, Date toDate, Integer pageIndex);
	public List<ProviderFinance>  getProviderSettleFinanceExcelDownloadFile(ProviderFinance condition, Date fromDate, Date toDate);
	
	//农户结算
	public PageBean<FarmerFinance> getFarmerSettleFinanceList(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate, Integer page);
	public List<FarmerFinance> getFarmerSettleFinanceExcelDownloadFile(FarmerFinance condition, Date sendFromDate, Date sendToDate,Date finishFromDate,Date finishToDate);

	//农场统计
	public List<FarmerStatDO> getFarmStatList(Long farmId);
	public List<ProviderStatDO> getProviderStatList(Long farmId);
}
