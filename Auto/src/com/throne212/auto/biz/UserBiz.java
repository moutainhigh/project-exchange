package com.throne212.auto.biz;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;
import com.throne212.auto.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String loginName, String password);
	
	public boolean changePwd(Long userId,String oldPwd,String newPwd);
	
	public PageBean<Sale> getSales(int page);
	public PageBean<Sale> getSales(int page,int num);
	
	public PageBean<Car> getCars(int page);
	public PageBean<Car> getCarsBySale(long saleId,int page);
	
	public PageBean<Special> getSpecials(int page);
	public PageBean<Special> getSpecialsBySale(long saleId,int page);
	
}
