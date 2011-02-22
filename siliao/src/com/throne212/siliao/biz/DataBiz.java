package com.throne212.siliao.biz;

import java.util.Date;

import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.User;

public interface DataBiz extends BaseBiz{

	//农户
	public Farmer saveFarmer(Farmer farmer);
	public Farmer deleteFarmer(Farmer farmer);
	public PageBean<Farmer> getFarmList(Farmer condition,Date fromDate,Date toDate,Integer page);
	public String getFarmerExcelDownloadFile(Farmer condition,Date fromDate,Date toDate);
	
	//用户
	public <T extends User> T saveUser(T user);
	public User deleteUser(User user);
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,Integer page,String role);
	public String getUserExcelDownloadFile(User condition,Date fromDate,Date toDate,String role);
	
}
