package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.SMS;

public interface MessageDao extends BaseDao {
	
	public PageBean<Message> getAllMessageToUser(Integer pageIndex,String loginName);
	
	public PageBean<SMS> getAllSMS(Integer pageIndex,String loginName);

}
