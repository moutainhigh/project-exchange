package com.throne212.tui5.action;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.User;


public class AjaxAction extends BaseAction {

	@Autowired
	private BaseBiz baseBiz;
	
	protected String msg;
	
	//check
	private String username;
	private String email;
	private String password;
	private String password2;
	private String rand;
	
	public String checkUserName(){
		User user = baseBiz.getEntityByUnique(User.class, "userId", username);
		if(user == null)
			msg = "Y";
		else
			msg = "�û����Ѿ���ע��";
		return "msg";
	}	
	
	public String checkEmail(){
		User user = baseBiz.getEntityByUnique(User.class, "userEmail", email);
		if(user == null)
			msg = "Y";
		else
			msg = "�����ַ�Ѿ���ע��";
		return "msg";
	}
	
	public String addUser(){
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if(rand == null || !rand.equals(randInSess)){
			msg = "��֤�����";
		} else if(!Util.isEmpty(username) 
				&& !Util.isEmpty(email) 
				&& !Util.isEmpty(password)
				&& !Util.isEmpty(password2)
				&& password.equals(password2)){
			if(baseBiz.getEntityByUnique(User.class, "userId", username) != null){
				msg = "�û����Ѿ���ע�ᣬ��������д";
				return "msg"; 
			}if(baseBiz.getEntityByUnique(User.class, "userEmail", email) != null){
				msg = "�ʼ���ַ�Ѿ���ע�ᣬ��������д";
				return "msg";
			}
			User user = new User();
			user.setUserId(username);
			user.setUserPassword(EncryptUtil.md5Encode(password));
			user.setUserEmail(email);
			user.setUserRegdate(new Timestamp(System.currentTimeMillis()));
			user.setUserLastdate(new Timestamp(System.currentTimeMillis()));
			user.setUserUpdate(new Timestamp(System.currentTimeMillis()));
			try {
				logger.debug("try to add user: "  + username);
				baseBiz.saveOrUpdateEntity(user);
				msg = "Y";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		}else{
			msg = "���ݴ�������";
		}
		return "msg";
	}
	
	public String loginUser(){
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if(rand == null || !rand.equals(randInSess)){
			msg = "��֤�����";
		} else if(!Util.isEmpty(username) 
				&& !Util.isEmpty(password)){
			try {
				User user = baseBiz.getEntityByUnique(User.class, "userId", username);
				if(user == null)
					msg = "��¼�����������";
				else if(!user.getUserPassword().equals(EncryptUtil.md5Encode(password))){
					msg = "��¼�����������";
				}else {
					msg = "Y";
					ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		}else{
			msg = "���ݴ�������";
		}
		return "msg";
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	public String getRand() {
		return rand;
	}
	public void setRand(String rand) {
		this.rand = rand;
	}

}
