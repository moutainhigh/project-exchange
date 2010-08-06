package com.throne212.auto.biz;

import java.util.Date;

import com.throne212.auto.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String loginName, String password);
	
	public boolean changePwd(Long userId,String oldPwd,String newPwd);
	
	public boolean addNewSale(String saleTel,String saleQQ,
			String saleAdr,String saleEmail,String saleFullName,Boolean saleIsLocked,
			String saleLastIp,Date saleLastLogin,Date saleLastChgpwd);
	
	public boolean updateSale(Long saleId,String saleTel,String saleQQ,
			String saleAdr,String saleEmail,String saleFullName,Boolean saleIsLocked,
			String saleLastIp,Date saleLastLogin,Date saleLastChgpwd);
	
	public boolean searchSale(Long saleId);
	
	public boolean deleteSale(Long saleId);
}
