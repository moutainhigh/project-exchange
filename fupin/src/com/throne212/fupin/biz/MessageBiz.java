package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Message;

public interface MessageBiz extends BaseBiz {

	public PageBean<Message> getAllMessageToUser(Integer pageIndex,String loginName);
	public boolean deleteMessage(Long[] ids);
}
