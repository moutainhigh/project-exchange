package com.throne212.siliao.biz;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.FarmAbs;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.Rate;
import com.throne212.siliao.domain.User;

public interface DataBiz extends BaseBiz{

	//农户
	public Farmer saveFarmer(Farmer farmer);
	public Farmer deleteFarmer(Farmer farmer);
	public PageBean<Farmer> getFarmerList(Farmer condition,Date fromDate,Date toDate,Integer page);
	public String getFarmerExcelDownloadFile(Farmer condition,Date fromDate,Date toDate);
	
	//用户
	public <T extends User> T saveUser(T user);
	public User deleteUser(User user);
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,Integer page,String role);
	public String getUserExcelDownloadFile(User condition,Date fromDate,Date toDate,String role);
	
	//利率
	public Rate saveRate(Rate rate);
	public Rate deleteRate(Rate rate);
	public PageBean<Rate> getRateList(Rate condition,Date fromDate,Date toDate,Date fromDate2,Date toDate2,String rateName,Integer page);
	public String getRateExcelDownloadFile(Rate condition, Date fromDate, Date toDate,Date fromDate2, Date toDate2,String rateName);
	
	//农场
	public <T extends FarmAbs> T saveFarmAbs(T farmAbs);
	public FarmAbs deleteFarmAbs(FarmAbs farmAbs);
	public PageBean<FarmAbs> getFarmAbsList(FarmAbs condition,Date fromDate,Date toDate,Integer pageIndex,String farmType,Long farmId,Long farmManagerId);
	public String getFarmAbsExcelDownloadFile(FarmAbs condition,Date fromDate,Date toDate,String farmType,Long farmId,Long farmManagerId);
	
	//其它
	public List<Log> getFarmerLogList(Farmer farmer);
	public List<Log> getUserLogList(User user);
	public List<Log> getRateLogList(Rate rate);
	
}
