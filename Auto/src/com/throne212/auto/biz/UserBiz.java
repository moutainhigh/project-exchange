package com.throne212.auto.biz;

import java.util.Date;

import com.throne212.auto.common.PageBean;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public interface UserBiz extends BaseBiz{

	public User login(String loginName, String password);
	
	public boolean changePwd(Long userId,String oldPwd,String newPwd);
	
	public PageBean<Sale> getSales(int page);
	
}
