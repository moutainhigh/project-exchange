package com.throne212.fupin.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.User;

public class SMSAction extends BaseAction {

	private PageBean<SMS> pageBean;
	private MessageBiz messageBiz;
	private Integer pageIndex;
	private SMS sms;

	public String getAllSMS() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		pageBean = messageBiz.getAllSMS(pageIndex, user.getLoginName());
		return "sms_list";
	}
	
	public String sendSMS(){
		if (sms == null) {
			this.setMsg("通知发送失败，请检查数据是否录入完整");
			return "sms_edit";
		}
		if (sms != null && sms.getTel() != null) {// 发送通知
			String recieverString = sms.getTel();
			Set<String> set = new HashSet<String>();
			if(recieverString.contains("+")){
				String[] reciever = recieverString.split("[+]");
				for (String loginName : reciever) {//排除重复
					set.add(loginName);
				}
			}else{
				set.add(recieverString);
			}
			List<String> notExist = new ArrayList<String>();
			for (String loginName : set) {
				logger.debug(loginName);
//				User user = messageBiz.getEntityByUnique(User.class,
//						"loginName", loginName);
//				if (user == null) {
//					notExist.add(loginName);
//				} else {
//					Date sendDate = new Date();
//					Message sendMessage = new Message();
//					sendMessage.setTitle(message.getTitle());
//					sendMessage.setContent(message.getContent());
//					sendMessage.setCreateDate(sendDate);
//					sendMessage.setReciever(user);
//					
//					String attach = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_ATTACH);
//					if (attach != null) {
//						sendMessage.setAttatch(attach);
//						ActionContext.getContext().getSession().remove(
//								WebConstants.SESS_ATTACH);
//					} else {
//						
//					}
//					User currUser = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
//					sendMessage.setSender(currUser);
//					messageBiz.saveOrUpdateEntity(sendMessage);
//					this.setMsg("发送成功");
//					this.setSucc("Y");
//
//				}
			}
//			if (notExist != null && notExist.size() > 0) {
//				StringBuffer sBuffer = new StringBuffer();
//				for (String user : notExist) {
//					sBuffer.append(user + "+");
//
//				}
//				String sb= sBuffer.toString();
//				this.setMsg("通知发送成功,标题【" + message.getTitle() + "】 以下用户不存在:"+sb.substring(0, sb.length()-1)+"请重新填入并发送：" );
//			} else {
//				this.setMsg("通知发送成功,标题【" + message.getTitle() + "】");
//			}
//			this.setSucc("Y");
//			message = null;
//
//			return "mes_send";
		} 
		this.setSucc("N");
		this.setMsg("发送失败");
		return "sms_edit";
	}

	public String sendMessage() {
		return "mes_send";
	}

	public PageBean<SMS> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<SMS> pageBean) {
		this.pageBean = pageBean;
	}

	public MessageBiz getMessageBiz() {
		return messageBiz;
	}

	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public SMS getSms() {
		return sms;
	}

	public void setSms(SMS sms) {
		this.sms = sms;
	}

}
