package com.throne212.fupin.biz;

import java.util.Map;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.BatchSMS;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.SMS;

public interface MessageBiz extends BaseBiz {

	public PageBean<Message> getAllMessageToUser(Integer pageIndex,String loginName);
	public boolean deleteMessage(Long[] ids);
	
	//获得用户树形列表
	public Map<String,String> getUserTreeList();
	public Map<String,String> getUserTelTreeList();//手机号码
	
	//sms
	public PageBean<SMS> getAllSMS(Integer pageIndex,String loginName);
	public boolean sendSMS(String tel,String content);
	
	//batch
	public PageBean<BatchSMS> getAllBatchSMS(Integer pageIndex);
}
