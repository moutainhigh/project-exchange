package com.throne212.siliao.biz;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Farmer;

public interface DataBiz extends BaseBiz{

	//农户
	public Farmer saveFarmer(Farmer farmer);
	public Farmer deleteFarmer(Farmer farmer);
	public PageBean<Farmer> getFarmList(Farmer condition,Date fromDate,Date toDate,Integer page);
	public String getFarmerExcelDownloadFile(Farmer condition,Date fromDate,Date toDate);
	
}
