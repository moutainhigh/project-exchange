package com.throne212.siliao.action;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.MailSetting;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class DataAction extends BaseAction {

	private BaseBiz baseBiz;
	
	private Boolean on;
	private String username;
	private String password;
	private String smtp;
		
	private MailSetting mailSetting;
	public MailSetting getMailSetting() {
		return mailSetting;
	}


	public void setMailSetting(MailSetting mailSetting) {
		this.mailSetting = mailSetting;
	}


	public String updateMailSetting(){
		User user=(User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		
		if (Util.isEmpty(username) || Util.isEmpty(password)||Util.isEmpty(smtp)) {
			this.setMsg("请填入完整信息！");
			return "fail";
		}
		
		List<MailSetting> list=baseBiz.getAll(MailSetting.class);
		if (list.size()==0) {
			mailSetting=null;
		} else {
			mailSetting=list.get(0);
		}
		
		if(mailSetting==null){
			mailSetting=new MailSetting();
		}
		mailSetting.setUsername(username);
		mailSetting.setPassword(password);
		mailSetting.setSmtp(smtp);
		mailSetting.setEnable(on);
		mailSetting.setCreateName(user.getLoginName());
		mailSetting.setCreateDate(new Date());
		baseBiz.saveOrUpdateEntity(mailSetting);
		
		UserLog log= new UserLog();
		log.setByWho(user);
		log.setCreateDate(new Date());
		log.setCreateName(user.getName());
		log.setEnable(true);
		log.setLogTime(new Date());
		log.setMsg(WebConstants.OP_UPDATE);
		log.setUser(user);
		baseBiz.saveOrUpdateEntity(log);
		
		
		
		this.setMsg("设置成功！");
		return "mail_setting";
	}


	
	
	
	
	public BaseBiz getBaseBiz() {
		return baseBiz;
	}


	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}


	


	public Boolean getOn() {
		return on;
	}


	public void setOn(Boolean on) {
		this.on = on;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getSmtp() {
		return smtp;
	}


	public void setSmtp(String smtp) {
		this.smtp = smtp;
	}

}
