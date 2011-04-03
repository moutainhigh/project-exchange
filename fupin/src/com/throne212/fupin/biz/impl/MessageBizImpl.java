package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.MessageDao;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.Zixun;

public class MessageBizImpl extends BaseBizImpl implements MessageBiz {
	private MessageDao messageDao;
	public PageBean<Message> getAllMessageToUser(Integer pageIndex,
			String loginName) {
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return messageDao.getAllMessageToUser(pageIndex, loginName);
	}
	public MessageDao getMessageDao() {
		return messageDao;
	}
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	public boolean deleteMessage(Long[] ids) {
		if(ids==null || ids.length<1)
			return false;
		for(Long id : ids){
			messageDao.deleteById(Message.class, id);
		}
		return true;
	}

}
