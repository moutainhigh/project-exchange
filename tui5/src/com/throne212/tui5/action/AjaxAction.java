package com.throne212.tui5.action;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Finance;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Score;
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
		} else if (!Util.isEmpty(username) && !Util.isEmpty(email) && !Util.isEmpty(password)
				&& !Util.isEmpty(password2) && password.equals(password2)) {
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
			user.setUserAccount(BigDecimal.valueOf(Const.USER_REG_MONEY));
			user.setUserScore(Const.USER_REG_SCORE);
			System.out.println(ActionContext.getContext().getSession());
			// 是否为推客推荐过来的用户
			if (ActionContext.getContext().getSession().get(Const.SESS_ALLIANCE_USER_ID) != null) {
				String allianceUserId = (String) ActionContext.getContext().getSession()
						.get(Const.SESS_ALLIANCE_USER_ID);
				User u = baseBiz.getEntityByUnique(User.class, "userId", allianceUserId);
				if (u != null)
					user.setAllianceUser(u);
			}
			try {
				logger.debug("try to add user: " + username);
				baseBiz.saveOrUpdateEntity(user);
				// 积分记录
				Score s = new Score();
				s.setContent("新用户注册奖励积分");
				s.setMount(Const.USER_REG_SCORE);
				s.setTime(new Date());
				s.setType(Const.RECORD_TYPE_1);
				s.setUser(user);
				baseBiz.saveOrUpdateEntity(s);
				// 加入记录
				Finance f = new Finance();
				f.setContent("新用户注册奖励现金");
				f.setMoney(BigDecimal.valueOf(Const.USER_REG_MONEY));
				f.setTime(new Date());
				f.setType(Const.RECORD_TYPE_1);
				f.setUser(user);
				baseBiz.saveOrUpdateEntity(f);
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
	private Integer price123;// 那种计价模式的
	private Integer fs;// 粉丝

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
		if ("weibo".equals(gj.getTask().getType().getPinyin()) && fs == null) {
			msg = "请选择该稿件所发微博的粉丝数量";
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
			if (task.getStatus() == Const.TASK_STATUS_COMPLETE) {
				msg = "任务已经完成，不能再审核稿件了";
				return "msg";
			}
			int mount = 0;
			if (price123 != null && price123 > 0) {// 除开weibo，要检查份数
				mount = task.getGaojianMount() == null ? 0 : task.getGaojianMount();
				long currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status",
						Const.GAOJIAN_STATUS_SUCC);
				if (currMount >= mount) {
					msg = "提交的稿件份数已经足够了";
					return "msg";
				}
			}
			// 检查金额是否已经大于任务的总金额
			List<Gaojian> gjList = baseBiz.getEntitiesByTwoColumn(Gaojian.class, "task", task, "status", Const.GAOJIAN_STATUS_SUCC);
			BigDecimal allMoney = BigDecimal.valueOf(0);
			int allSum = 0;
			for (Gaojian g : gjList) {
				allMoney = allMoney.add(g.getMoney());
				allSum++;
			}
			task.setPassMoney(allMoney);
			task.setPassGaojian(allSum);
			if (fs != null && fs > 0) {
				if (allMoney.add(task.getFs(fs)).doubleValue() > task.getMoney().doubleValue()) {
					msg = "你的任务的剩余金额，不足以支付该稿件的酬劳了，请增加任务预算金额，然后再试";
					return "msg";
				}
			}

			// 多人中标
			if (task.getPriceClass() != null && task.getPriceClass() == 3 && price123 != null && price123 > 0) {
				long sum = baseBiz.getEntityCountByThreeColumn(Gaojian.class, "task", task, "price123", price123,
						"status", Const.GAOJIAN_STATUS_SUCC);
				if (sum >= task.getPeople(price123)) {
					msg = price123 + "等奖提交的稿件份数已经足够了";
					return "msg";
				}
				gj.setPrice123(price123);
				BigDecimal money = BigDecimal.valueOf(task.getRate(price123)).multiply(task.getMoney());
				gj.setMoney(money);
			} else if (task.getGaojianPrice() != null && task.getGaojianPrice().doubleValue() > 0) {// 单人中标和几件
				gj.setMoney(task.getGaojianPrice());
			} else if (fs != null && fs > 0) {// 微博类型
				gj.setMoney(gj.getTask().getFs(fs));
			}

			// 保存
			gj.setCheckDate(new Timestamp(new Date().getTime()));
			baseBiz.saveOrUpdateEntity(gj);

			//通过以后的一些处理
			if (status == Const.GAOJIAN_STATUS_SUCC) {
				
				//计算稿件已经通过的稿件数目和金额
				task.setPassMoney(task.getPassMoney().add(gj.getMoney()));
				task.setPassGaojian(task.getPassGaojian() + 1);
				
				if (price123 != null && price123 > 0) {// 按件算的,//任务是否该结束了
					long currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status",Const.GAOJIAN_STATUS_SUCC);
					if (task.getPriceClass() == 1 && currMount >= mount) {
						msg += "\n已经收齐合格的稿件，任务结束";
						task.setStatus(Const.TASK_STATUS_COMPLETE);
					}
				}
				baseBiz.saveOrUpdateEntity(task);

				// 计算酬劳
				User gjUser = baseBiz.getEntityById(User.class, gj.getUser().getUserNo());
				BigDecimal userAcct = gj.getMoney().multiply(Const.TUI_PERCENTAGE).abs();
				double dMoney = Math.floor(userAcct.doubleValue() * 100);
				userAcct = BigDecimal.valueOf(dMoney).divide(BigDecimal.valueOf(100));
				gjUser.setUserAccount(gjUser.getUserAccount().add(userAcct));
				baseBiz.saveOrUpdateEntity(gjUser);
				// 财务记录
				Finance f = new Finance();
				f.setContent("稿件通过，计入酬劳");
				f.setMoney(userAcct);
				f.setType(Const.RECORD_TYPE_1);
				f.setUser(gj.getUser());
				f.setTime(new Date());
				baseBiz.saveOrUpdateEntity(f);
			}
			msg = "Y";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "服务器内部错误，请稍候再试";
		}
		return "msg";
	}

	public static void main(String[] args) {
		// System.out.println(BigDecimal.valueOf(0.1123).multiply(Const.TUI_PERCENTAGE));
		double dMoney = Math.floor(0.12322 * 100);
		System.out.println(BigDecimal.valueOf(dMoney).divide(BigDecimal.valueOf(100)));
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

	public Integer getPrice123() {
		return price123;
	}

	public void setPrice123(Integer price123) {
		this.price123 = price123;
	}

	public Integer getFs() {
		return fs;
	}

	public void setFs(Integer fs) {
		this.fs = fs;
	}

}
