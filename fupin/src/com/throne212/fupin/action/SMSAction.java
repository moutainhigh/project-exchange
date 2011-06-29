package com.throne212.fupin.action;

import java.util.HashSet;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.Util;
import com.throne212.fupin.common.WebConstants;
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
		StringBuffer sb = new StringBuffer();
		if (sms != null && sms.getTel() != null) {// 发送短信
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
			User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
			for (String tel : set) {
				logger.info("正在发送短信给：" + tel);
				int rst = -1;
				try {
					rst = Util.sendMessage(tel, sms.getContent(), user.getLoginName(), user.getId().intValue());//0为成功
					if(rst == 0){
						sb.append("("+tel+")发送成功");
						sb.append("\n");
						logger.info("成功发送短信给：" + tel);
					}else if(rst == -108){
						sb.append("发送失败，短息服务连接失败，请联系管理员");
						logger.warn("发送短信失败,短息服务连接失败");
						break;
					}else{
						sb.append("("+tel+")发送失败");
						sb.append("\n");
					}
				} catch (Exception e) {
					logger.warn("发送短信失败", e);
					sb.append("发送失败，短息服务连接失败，请联系管理员");
					break;
				}				
			}
		} else{
			sb.append("发送失败，参数缺失");
		}
		this.setSucc("N");
		this.setMsg(sb.toString());
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
