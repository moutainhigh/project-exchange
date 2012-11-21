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
			msg = "�û����Ѿ���ע��";
		return "msg";
	}

	public String checkEmail() {
		User user = baseBiz.getEntityByUnique(User.class, "userEmail", email);
		if (user == null)
			msg = "Y";
		else
			msg = "�����ַ�Ѿ���ע��";
		return "msg";
	}

	public String addUser() {
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if (rand == null || !rand.equals(randInSess)) {
			msg = "��֤�����";
		} else if (!Util.isEmpty(username) && !Util.isEmpty(email) && !Util.isEmpty(password)
				&& !Util.isEmpty(password2) && password.equals(password2)) {
			if (baseBiz.getEntityByUnique(User.class, "userId", username) != null) {
				msg = "�û����Ѿ���ע�ᣬ��������д";
				return "msg";
			}
			if (baseBiz.getEntityByUnique(User.class, "userEmail", email) != null) {
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
			user.setUserAccount(BigDecimal.valueOf(Const.USER_REG_MONEY));
			user.setUserScore(Const.USER_REG_SCORE);
			System.out.println(ActionContext.getContext().getSession());
			// �Ƿ�Ϊ�ƿ��Ƽ��������û�
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
				// ���ּ�¼
				Score s = new Score();
				s.setContent("���û�ע�ά������");
				s.setMount(Const.USER_REG_SCORE);
				s.setTime(new Date());
				s.setType(Const.RECORD_TYPE_1);
				s.setUser(user);
				baseBiz.saveOrUpdateEntity(s);
				// �����¼
				Finance f = new Finance();
				f.setContent("���û�ע�ά���ֽ�");
				f.setMoney(BigDecimal.valueOf(Const.USER_REG_MONEY));
				f.setTime(new Date());
				f.setType(Const.RECORD_TYPE_1);
				f.setUser(user);
				baseBiz.saveOrUpdateEntity(f);
				msg = "Y";
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		} else {
			msg = "���ݴ�������";
		}
		return "msg";
	}

	public String loginUser() {
		String randInSess = (String) ActionContext.getContext().getSession().get(Const.SESS_RAND);
		if (rand == null || !rand.equals(randInSess)) {
			msg = "��֤�����";
		} else if (!Util.isEmpty(username) && !Util.isEmpty(password)) {
			try {
				User user = baseBiz.getEntityByUnique(User.class, "userId", username);
				if (user == null)
					msg = "��¼�����������";
				else if (!user.getUserPassword().equals(EncryptUtil.md5Encode(password))) {
					msg = "��¼�����������";
				} else {
					msg = "Y";
					ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
					user.setUserLastdate(new Timestamp(System.currentTimeMillis()));
					baseBiz.saveOrUpdateEntity(user);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		} else {
			msg = "���ݴ�������";
		}
		return "msg";
	}

	private Long gjId;
	private Integer status;
	private Integer price123;// ���ּƼ�ģʽ��
	private Integer fs;// ��˿

	public String checkGaojian() {
		if (gjId == null || status == null) {
			msg = "����ȱʧ";
			return "msg";
		}
		Gaojian gj = baseBiz.getEntityById(Gaojian.class, gjId);
		if (gj == null) {
			msg = "���δ�ҵ�";
			return "msg";
		}
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (user == null) {
			msg = "�û���δ��¼�����ȵ�¼";
			return "msg";
		}
		if (!user.getUserNo().equals(gj.getTask().getPublisher().getUserNo())) {
			msg = "����û�������ķ����߲�һ��";
			return "msg";
		}
		if ("weibo".equals(gj.getTask().getType().getPinyin()) && fs == null) {
			msg = "��ѡ��ø������΢���ķ�˿����";
			return "msg";
		}
		if (status == Const.GAOJIAN_STATUS_FAIL || status == Const.GAOJIAN_STATUS_SUCC)
			gj.setStatus(status);
		else {
			msg = "״̬��ֵ����ȷ";
			return "msg";
		}
		try {
			Task task = gj.getTask();
			if (task.getStatus() == Const.TASK_STATUS_COMPLETE) {
				msg = "�����Ѿ���ɣ���������˸����";
				return "msg";
			}
			int mount = 0;
			if (price123 != null && price123 > 0) {// ����weibo��Ҫ������
				mount = task.getGaojianMount() == null ? 0 : task.getGaojianMount();
				long currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status",
						Const.GAOJIAN_STATUS_SUCC);
				if (currMount >= mount) {
					msg = "�ύ�ĸ�������Ѿ��㹻��";
					return "msg";
				}
			}
			// ������Ƿ��Ѿ�����������ܽ��
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
					msg = "��������ʣ���������֧���ø���ĳ����ˣ�����������Ԥ���Ȼ������";
					return "msg";
				}
			}

			// �����б�
			if (task.getPriceClass() != null && task.getPriceClass() == 3 && price123 != null && price123 > 0) {
				long sum = baseBiz.getEntityCountByThreeColumn(Gaojian.class, "task", task, "price123", price123,
						"status", Const.GAOJIAN_STATUS_SUCC);
				if (sum >= task.getPeople(price123)) {
					msg = price123 + "�Ƚ��ύ�ĸ�������Ѿ��㹻��";
					return "msg";
				}
				gj.setPrice123(price123);
				BigDecimal money = BigDecimal.valueOf(task.getRate(price123)).multiply(task.getMoney());
				gj.setMoney(money);
			} else if (task.getGaojianPrice() != null && task.getGaojianPrice().doubleValue() > 0) {// �����б�ͼ���
				gj.setMoney(task.getGaojianPrice());
			} else if (fs != null && fs > 0) {// ΢������
				gj.setMoney(gj.getTask().getFs(fs));
			}

			// ����
			gj.setCheckDate(new Timestamp(new Date().getTime()));
			baseBiz.saveOrUpdateEntity(gj);

			//ͨ���Ժ��һЩ����
			if (status == Const.GAOJIAN_STATUS_SUCC) {
				
				//�������Ѿ�ͨ���ĸ����Ŀ�ͽ��
				task.setPassMoney(task.getPassMoney().add(gj.getMoney()));
				task.setPassGaojian(task.getPassGaojian() + 1);
				
				if (price123 != null && price123 > 0) {// �������,//�����Ƿ�ý�����
					long currMount = baseBiz.getEntityCountByTwoColumn(Gaojian.class, "task", task, "status",Const.GAOJIAN_STATUS_SUCC);
					if (task.getPriceClass() == 1 && currMount >= mount) {
						msg += "\n�Ѿ�����ϸ�ĸ�����������";
						task.setStatus(Const.TASK_STATUS_COMPLETE);
					}
				}
				baseBiz.saveOrUpdateEntity(task);

				// �������
				User gjUser = baseBiz.getEntityById(User.class, gj.getUser().getUserNo());
				BigDecimal userAcct = gj.getMoney().multiply(Const.TUI_PERCENTAGE).abs();
				double dMoney = Math.floor(userAcct.doubleValue() * 100);
				userAcct = BigDecimal.valueOf(dMoney).divide(BigDecimal.valueOf(100));
				gjUser.setUserAccount(gjUser.getUserAccount().add(userAcct));
				baseBiz.saveOrUpdateEntity(gjUser);
				// �����¼
				Finance f = new Finance();
				f.setContent("���ͨ�����������");
				f.setMoney(userAcct);
				f.setType(Const.RECORD_TYPE_1);
				f.setUser(gj.getUser());
				f.setTime(new Date());
				baseBiz.saveOrUpdateEntity(f);
			}
			msg = "Y";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "�������ڲ��������Ժ�����";
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
