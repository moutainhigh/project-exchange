package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Message;

public interface MessageDao extends BaseDao {
	
	public PageBean<Message> getAllMessageToUser(Integer pageIndex,String loginName);

}
