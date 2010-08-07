package com.throne212.auto.biz;

import java.util.Date;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String loginName, String password);
	
	public boolean changePwd(Long userId,String oldPwd,String newPwd);
	
	public PageBean<Sale> getSales(int page);
	
	public PageBean<Sale> getCars(int page);
	public PageBean<Sale> getCarsBySale(int page);
	
	public PageBean<Sale> getSpecails(int page);
	public PageBean<Sale> getSpecailsBySale(int page);
	
}
