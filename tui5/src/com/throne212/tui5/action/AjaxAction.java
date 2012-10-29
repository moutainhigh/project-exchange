package com.throne212.tui5.action;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

public class AjaxAction extends BaseAction {

	@Autowired
	private BaseBiz baseBiz;

	protected String msg;

	// check
	private String username;
	private String email;
	private String password;
	private String password2;
	private String rand;

	public String checkUserName() {
		User user = baseBiz.getEntityByUnique(User.class, "userId", username);
		if (user == null)
			msg = "Y";
		else
			msg = "用户名已经被注册";
		return "msg";
	}

	public String checkEmail() {
		User user = baseBiz.getEntityByUnique(User.class, "userEmail", email);
		if (user == null)
			msg = "Y";
		else
			msg = "邮箱地址已经被注册";
		return "msg";
	}

	public String addUser() {
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if (rand == null || !rand.equals(randInSess)) {
			msg = "验证码错误";
		} else if (!Util.isEmpty(username) && !Util.isEmpty(email) && !Util.isEmpty(password) && !Util.isEmpty(password2) && password.equals(password2)) {
			if (baseBiz.getEntityByUnique(User.class, "userId", username) != null) {
				msg = "用户名已经被注册，请重新填写";
				return "msg";
			}
			if (baseBiz.getEntityByUnique(User.class, "userEmail", email) != null) {
				msg = "邮件地址已经被注册，请重新填写";
				return "msg";
			}
			User user = new User();
			user.setUserId(username);
			user.setUserPassword(EncryptUtil.md5Encode(password));
			user.setUserEmail(email);
			user.setUserRegdate(new Timestamp(System.currentTimeMillis()));
			user.setUserLastdate(new Timestamp(System.currentTimeMillis()));
			user.setUserUpdate(new Timestamp(System.currentTimeMillis()));
			user.setUserAccount(new BigDecimal(Const.USER_REG_MONEY));
			user.setUserScore(Const.USER_REG_SCORE);
			//是否为推客推荐过来的用户
			String allianceUserId = (String) ActionContext.getContext().getSession().get(Const.SESS_ALLIANCE_USER_ID);
			if(!Util.isEmpty(allianceUserId)){
				User u = baseBiz.getEntityByUnique(User.class, "userId", allianceUserId);
				if(u != null)
					user.setAllianceUser(u);
			}
			try {
				logger.debug("try to add user: " + username);
				baseBiz.saveOrUpdateEntity(user);
				msg = "Y";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "服务器内部错误，请稍候再试";
			}
		} else {
			msg = "数据错误，请检查";
		}
		return "msg";
	}

	public String loginUser() {
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if (rand == null || !rand.equals(randInSess)) {
			msg = "验证码错误";
		} else if (!Util.isEmpty(username) && !Util.isEmpty(password)) {
			try {
				User user = baseBiz.getEntityByUnique(User.class, "userId", username);
				if (user == null)
					msg = "登录名或密码错误";
				else if (!user.getUserPassword().equals(EncryptUtil.md5Encode(password))) {
					msg = "登录名或密码错误";
				} else {
					msg = "Y";
					ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
					user.setUserLastdate(new Timestamp(System.currentTimeMillis()));
					baseBiz.saveOrUpdateEntity(user);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "服务器内部错误，请稍候再试";
			}
		} else {
			msg = "数据错误，请检查";
		}
		return "msg";
	}

	private Long gjId;
	private Integer status;

	public String checkGaojian() {
		if (gjId == null || status == null) {
			msg = "参数缺失";
			return "msg";
		}
		Gaojian gj = baseBiz.getEntityById(Gaojian.class, gjId);
		if (gj == null) {
			msg = "稿件未找到";
			return "msg";
		}
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (user == null) {
			msg = "用户还未登录，请先登录";
			return "msg";
		}
		if (!user.getUserNo().equals(gj.getTask().getPublisher().getUserNo())) {
			msg = "审核用户与任务的发布者不一致";
			return "msg";
		}
		if (status == Const.GAOJIAN_STATUS_FAIL || status == Const.GAOJIAN_STATUS_SUCC)
			gj.setStatus(status);
		else {
			msg = "状态的值不正确";
			return "msg";
		}
		try {
			Task task = gj.getTask();
			int mount = task.getGaojianMount();
			long currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status", Const.GAOJIAN_STATUS_SUCC);
			if (currMount >= mount) {
				msg = "提交的稿件份数已经足够了";
				return "msg";
			}
			// 保存
			baseBiz.saveOrUpdateEntity(gj);
			if (status == Const.GAOJIAN_STATUS_SUCC) {
				currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status", Const.GAOJIAN_STATUS_SUCC);
				if (currMount >= mount) {
					task.setStatus(Const.TASK_STATUS_COMPLETE);
					baseBiz.saveOrUpdateEntity(task);
				}
			}
			msg = "Y";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "服务器内部错误，请稍候再试";
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

	public Long getGjId() {
		return gjId;
	}

	public void setGjId(Long gjId) {
		this.gjId = gjId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
