package com.throne212.siliao.biz;

import java.util.Date;
import java.util.List;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.FactoryAbs;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmAbs;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.Rate;
import com.throne212.siliao.domain.User;

public interface DataBiz extends BaseBiz{

	//农户
	public Farmer saveFarmer(Farmer farmer);
	public Farmer deleteFarmer(Farmer farmer);
	public PageBean<Farmer> getFarmerList(Farmer condition,Date fromDate,Date toDate,Integer page,String orderBy,String orderType,int pageSize);
	public String getFarmerExcelDownloadFile(Farmer condition,Date fromDate,Date toDate,String orderBy,String orderType);
	
	//用户
	public <T extends User> T saveUser(T user);
	public User deleteUser(User user);
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,Integer page,String role,String orderBy,String orderType,int pageSize);
	public String getUserExcelDownloadFile(User condition,Date fromDate,Date toDate,String role,String orderBy,String orderType);
	
	//利率
	public Rate saveRate(Rate rate);
	public Rate deleteRate(Rate rate);
	public PageBean<Rate> getRateList(Rate condition,Date fromDate,Date toDate,Date fromDate2,Date toDate2,String rateName,Integer page,String orderBy,String orderType,int pageSize);
	public String getRateExcelDownloadFile(Rate condition, Date fromDate, Date toDate,Date fromDate2, Date toDate2,String rateName,String orderBy,String orderType);
	
	//农场
	public <T extends FarmAbs> T saveFarmAbs(T farmAbs);
	public FarmAbs deleteFarmAbs(FarmAbs farmAbs);
	public PageBean<FarmAbs> getFarmAbsList(FarmAbs condition,Date fromDate,Date toDate,Integer pageIndex,String farmType,Long farmId,String accountName,String orderBy,String orderType,int pageSize);
	public String getFarmAbsExcelDownloadFile(FarmAbs condition,Date fromDate,Date toDate,String farmType,Long farmId,String accountName,String orderBy,String orderType);
	
	//厂商
	public <T extends FactoryAbs> T saveFactoryAbs(T factoryAbs);
	public FactoryAbs deleteFactory(FactoryAbs factoryAbs);
	public PageBean<FactoryAbs> getFactoryAbsList(FactoryAbs condition,Date fromDate,Date toDate,Integer page,String type,Long factoryId,String accountName,String orderBy,String orderType,int pageSize);
	public String getFactoryExcelDownloadFile(FactoryAbs condition,Date fromDate,Date toDate,String type,Long factoryId,String accountName,String orderBy,String orderType);
	
	//其它
	public List<Log> getFarmerLogList(Farmer farmer);
	public List<Log> getUserLogList(User user);
	public List<Log> getRateLogList(Rate rate);
	public List<Log> getFarmLogList(Farm farm);
	public List<Log> getAreaLogList(Area area);
	public List<Log> getFactoryLogList(Factory f);
	public List<Log> getProviderLogList(Provider p);
	
	public List<Farmer> getFarmerByArea(Long areaId);
	
}
