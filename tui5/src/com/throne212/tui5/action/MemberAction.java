package com.throne212.tui5.action;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.AllianceBiz;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.biz.ScoreFinanceBiz;
import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.AppException;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.MoneyRecord;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;
import com.yeepay.Configuration;
import com.yeepay.PaymentForOnlineService;

public class MemberAction extends BaseAction {

	private BaseBiz baseBiz;
	private TaskBiz taskBiz;
	private AllianceBiz allianceBiz;
	private ScoreFinanceBiz sfBiz;

	// ��������
	private int currNav = 1;

	// ��ҳ
	private int taskMount = 0;
	private int gaojianMount = 0;
	private List<Task> myTasks;
	private List<Gaojian> myGaojians;

	public String index() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		taskMount = baseBiz.getEntityCountByColumn(Task.class, "publisher", user).intValue();
		gaojianMount = baseBiz.getEntityCountByColumn(Gaojian.class, "user", user).intValue();
		myTasks = taskBiz.getTaskTop(10, user);
		myGaojians = taskBiz.getGaojianTop(10, user);
		return "member/member";
	}

	// �����������б�
	private PageBean pageBean;
	private Integer pageIndex;
	private Integer status;

	public String taskList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getTaskList(pageIndex, status, user);
		for (Object obj : pageBean.getResultList()) {
			Task t = (Task) obj;
			t.setGjCount(baseBiz.getEntityCountByColumn(Gaojian.class, "task", t).intValue());
		}
		return "member/task_list";
	}

	// ��������
	private Map<String, List<Type>> typeMap;
	private List<Type> topTypeList;
	private String toptypepinyin;
	private String typepinyin;
	private Task task;

	public String publish() {
		// չʾ���ݳ�ʼ��
		currNav = 2;// ��ǰtab�±�
		buildTopTypeList();// ������������
		if (!Util.isEmpty(typepinyin)) {
			Type t = baseBiz.getEntityByUnique(Type.class, "pinyin", typepinyin);
			if (t != null) {
				Type topType = baseBiz.getEntityByUnique(Type.class, "id", t.getParentId());
				toptypepinyin = topType.getPinyin();
			}
		}

		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (task != null && task.getId() != null) {// �������еģ��洢����
			task = taskBiz.getEntityById(Task.class, task.getId());
			if (task == null) {
				this.setMsg("���񲻴�����");
				return "member/publish";
			}
			try {
				if (user.getUserAccount().doubleValue() < task.getMoney().doubleValue()) {
					this.setMsg("�Բ����ʺ����㣬���ȳ�ֵ����ѡ���Ժ��ٷ����ķ�ʽ����");
					return "member/publish";
				}
				long currMill = System.currentTimeMillis();
				task.setPublishDate(new Timestamp(currMill));
				task.setStartDate(new Timestamp(currMill));
				long mill = task.getDays() * 24 * 60 * 60 * 1000;
				task.setEndDate(new Timestamp(currMill + mill));
				task.setStatus(Const.TASK_STATUS_PUBLISHED);
				taskBiz.publishTask(task);
				return "member/publish_succ";
			} catch (AppException e) {
				msg = e.getMessage();
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		} else if (task != null && !Util.isEmpty(task.getTitle())) {// ����ȫ�µģ��洢����
			// У��
			if (Util.chineseLength(task.getTitle()) > 50) {
				this.setMsg("���ⳤ�ȳ���Ҫ��");
				return "member/publish";
			}
			if (!Util.isEmpty(task.getContent()) && Util.chineseLength(task.getContent()) > 1000) {
				this.setMsg("�ƹ�Ҫ�󳤶ȳ���Ҫ��");
				return "member/publish";
			}
			if (!Util.isEmpty(task.getShenhe()) && Util.chineseLength(task.getShenhe()) > 500) {
				this.setMsg("��˱�׼���ȳ���Ҫ��");
				return "member/publish";
			}
			if (task.getMoney() == null) {
				this.setMsg("����Ϊ��");
				return "member/publish";
			}
			if (Util.isEmpty(typepinyin)) {
				this.setMsg("ȱ����������");
				return "member/publish";
			}
			Type type = baseBiz.getEntityByUnique(Type.class, "pinyin", typepinyin);
			if (type == null) {
				this.setMsg("��������û���ҵ�");
				return "member/publish";
			}
			task.setType(type);
			// publisher
			task.setPublisher(user);

			String isGongBu = ServletActionContext.getRequest().getParameter("isGongBu");
			// �Ƿ���������
			if ("1".equals(isGongBu)) {
				if (user.getUserAccount().doubleValue() < task.getMoney().doubleValue()) {
					this.setMsg("�Բ����ʺ����㣬���ȳ�ֵ����ѡ���Ժ��ٷ����ķ�ʽ����");
					return "member/publish";
				}
				long currMill = System.currentTimeMillis();
				task.setPublishDate(new Timestamp(currMill));
				task.setStartDate(new Timestamp(currMill));
				long mill = task.getDays() * 24 * 60 * 60 * 1000;
				task.setEndDate(new Timestamp(currMill + mill));
				task.setStatus(Const.TASK_STATUS_PUBLISHED);
			} else {
				long currMill = System.currentTimeMillis();
				task.setPublishDate(new Timestamp(currMill));
				task.setStatus(Const.TASK_STATUS_WAITING);
			}

			// ����
			String att = task.getAttachment1();
			if (!Util.isEmpty(att)) {
				String[] arr = att.split("\\|");
				int i = 1;
				for (String a : arr) {
					if (!Util.isEmpty(a)) {
						switch (i) {
						case 1:
							task.setAttachment1(a);
							break;
						case 2:
							task.setAttachment2(a);
							break;
						case 3:
							task.setAttachment3(a);
							break;
						case 4:
							task.setAttachment4(a);
							break;
						case 5:
							task.setAttachment5(a);
							break;
						}
						i++;
					}
				}
			}

			// price class
			if (task.getPriceClass() == null)
				task.setPriceClass(1);
			if (task.getPriceClass() != 3) {
				task.setRate1(0.0);
				task.setRate2(0.0);
				task.setRate3(0.0);
				task.setPeople1(0);
				task.setPeople2(0);
				task.setPeople3(0);
			} else if (task.getPriceClass() == 3) {
				task.setRate1(new BigDecimal(task.getRate1()).divide(new BigDecimal(100)).doubleValue());
				task.setRate2(new BigDecimal(task.getRate2()).divide(new BigDecimal(100)).doubleValue());
				task.setRate3(new BigDecimal(task.getRate3()).divide(new BigDecimal(100)).doubleValue());
				int sum = 0;
				if (task.getRate1() > 0 && task.getPeople1() > 0)
					sum += task.getPeople1();
				if (task.getRate2() > 0 && task.getPeople2() > 0)
					sum += task.getPeople2();
				if (task.getRate3() > 0 && task.getPeople3() > 0)
					sum += task.getPeople3();
				task.setGaojianMount(sum);
			}

			if (task.getPriceClass() == 2) {// �����б�
				task.setGaojianMount(1);
				task.setGaojianPrice(task.getMoney());
			}

			// �������
			try {
				task.setPassGaojian(0);
				task.setPassMoney(new BigDecimal(0));
				taskBiz.publishTask(task);
				return "member/publish_succ";
			} catch (AppException e) {
				msg = e.getMessage();
			} catch (Exception e) {
				e.printStackTrace();
				msg = "�������ڲ��������Ժ�����";
			}
		}
		return "member/publish";
	}

	private void buildTopTypeList() {
		typeMap = new TreeMap<String, List<Type>>(new Comparator<String>() {
			public int compare(String o1, String o2) {
				return o1.compareTo(o2);
			}
		});
		topTypeList = baseBiz.getEntitiesByColumn(Type.class, "parentId", null);
		for (Type t : topTypeList) {
			List<Type> tList = baseBiz.getEntitiesByColumn(Type.class, "parentId", t.getId());
			t.setChilds(tList);
			typeMap.put(t.getPinyin(), tList);
		}
	}

	// �����޸�
	private String userName;
	private String userMobile;
	private String userQq;
	private String userSex;

	public String info() {
		return "member/info";
	}

	public String saveInfo() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		logger.debug("save username=" + userName);
		user.setUserName(userName);
		user.setUserMobile(userMobile);
		user.setUserQq(userQq);
		user.setUserSex(userSex);
		try {
			baseBiz.saveOrUpdateEntity(user);
			ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
			this.setMsg("����ɹ�");
			logger.info("save user info succ");
		} catch (Exception e) {
			e.printStackTrace();
			this.setMsg("����ʧ�ܣ��������ڴ������Ժ�����");
		}
		return info();
	}

	// �޸�����
	private String oldpwd;
	private String pwd;
	private String pwd2;

	public String pwd() {
		if (!Util.isEmpty(oldpwd) && !Util.isEmpty(pwd) && !Util.isEmpty(pwd2) && pwd.equals(pwd2)) {
			oldpwd = oldpwd.trim();
			pwd = pwd.trim();
			pwd2 = pwd2.trim();
			User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
			if (!EncryptUtil.md5Encode(oldpwd).equals(user.getUserPassword())) {
				this.setMsg("ԭ�������");
				return "member/pwd";
			}
			try {
				user.setUserPassword(EncryptUtil.md5Encode(pwd));
				baseBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
				this.setMsg("����ɹ�");
				logger.info("save user pwd succ");
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("����ʧ�ܣ��������ڴ������Ժ�����");
			}
		}
		return "member/pwd";
	}

	private Gaojian gj;

	public String submitGaojian() {
		if (task != null && task.getId() != null) {
			task = taskBiz.getEntityById(Task.class, task.getId());
			if (!Const.TASK_STATUS_PUBLISHED.equals(task.getStatus()) || task.getEndDate() == null
					|| System.currentTimeMillis() > task.getEndDate().getTime()) {
				this.setMsg("�����Ѿ�������رգ��޷�Ͷ��");
				return "member/submit_gaojian_rst";
			}
			if (gj != null && !Util.isEmpty(gj.getContent())) {// ������
				try {
					gj.setTask(task);
					User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
					gj.setUser(user);
					gj.setSubmitDate(new Timestamp(System.currentTimeMillis()));
					gj.setStatus(Const.GAOJIAN_STATUS_INIT);
					taskBiz.saveOrUpdateEntity(gj);
					this.setMsg("����ύ�ɹ�");
					return "member/submit_gaojian_rst";
				} catch (Exception e) {
					e.printStackTrace();
					this.setMsg("����ύʧ�ܣ����Ժ�����");
					return "member/submit_gaojian_rst";
				}
			}
		} else {
			this.setMsg("����ȱʧ");
		}
		return "member/submit_gaojian";
	}

	// ����
	public String myscore() {
		// չʾ���ݳ�ʼ��
		currNav = 3;// ��ǰtab�±�
		return "member/myscore";
	}

	public String myscoreList() {
		// չʾ���ݳ�ʼ��
		currNav = 3;// ��ǰtab�±�
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = sfBiz.getMyScore(pageIndex, user);
		return "member/myscore_list";
	}

	// ����
	public String finance() {
		// չʾ���ݳ�ʼ��
		currNav = 4;// ��ǰtab�±�
		return "member/finance";
	}

	public String financeList() {
		// չʾ���ݳ�ʼ��
		currNav = 4;// ��ǰtab�±�
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		String type = ServletActionContext.getRequest().getParameter("type");
		if (Util.isEmpty(type))
			pageBean = sfBiz.getMyFinance(pageIndex, user);
		else if (type.matches("\\d"))
			pageBean = sfBiz.getMyFinance(pageIndex, user, Integer.valueOf(type));
		return "member/finance_list";
	}

	// ��ֵ��ҳ
	public String payIndex() {

		return "member/pay_index";
	}

	private String keyValue;
	private String nodeAuthorizationURL;
	private String p0_Cmd;
	private String p1_MerId;
	private String p2_Order;
	private String p3_Amt;
	private String p4_Cur;
	private String p5_Pid;
	private String p6_Pcat;
	private String p7_Pdesc;
	private String p8_Url;
	private String p9_SAF;
	private String pa_MP;
	private String pd_FrpId;
	private String pr_NeedResponse;
	private String hmac;
	
	public String repay() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		HttpServletRequest request = ServletActionContext.getRequest();
		
		String money = request.getParameter("p3_Amt");
		int m = 0;
		try {
			m = Integer.parseInt(money);
			m = Math.abs(m);
			if(m < 5){
				msg = "��ͳ�ֵ���Ϊ5Ԫ";
				return payIndex();
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			msg = "��ֵ�����Ϊ������";
			return payIndex();
		}
		
		try {
			request.setCharacterEncoding("GBK");
			keyValue = formatString(Configuration.getInstance().getValue("keyValue")); // �̼���Կ
			nodeAuthorizationURL = formatString(Configuration.getInstance().getValue("yeepayCommonReqURL")); // ���������ַ
			// �̼������û�������Ʒ��֧����Ϣ
			p0_Cmd = formatString("Buy"); // ����֧�����󣬹̶�ֵ ��Buy��
			p1_MerId = formatString(Configuration.getInstance().getValue("p1_MerId")); // �̻����
			p2_Order = formatString(request.getParameter("p2_Order")); // �̻�������
			p2_Order = Const.ORDER_PRE_CHONG + Util.generateOrderNo();
			p3_Amt = formatString(request.getParameter("p3_Amt")); // ֧�����
			p4_Cur = formatString("CNY"); // ���ױ���
			p5_Pid = formatString(request.getParameter("p5_Pid")); // ��Ʒ����
			p5_Pid = "��Ա��ֵ";
			p6_Pcat = formatString(request.getParameter("p6_Pcat")); // ��Ʒ����
			p6_Pcat = "��Ա��ֵ";
			p7_Pdesc = formatString(request.getParameter("p7_Pdesc")); // ��Ʒ����
			p7_Pdesc = "��Ա��ֵ" + p3_Amt;
			p8_Url = formatString(request.getParameter("p8_Url")); // �̻�����֧���ɹ����ݵĵ�ַ
			p8_Url = "http://www.tui5.com/callback.jsp";
			p9_SAF = formatString(request.getParameter("p9_SAF")); // ��Ҫ��д�ͻ���Ϣ
																			// 0������Ҫ
																			// 1:��Ҫ
			p9_SAF = "0";
			pa_MP = formatString(request.getParameter("pa_MP")); // �̻���չ��Ϣ
			pa_MP = user.getUserId();
			pd_FrpId = formatString(request.getParameter("pd_FrpId")); // ֧��ͨ������
			// ���б�ű����д
			pd_FrpId = pd_FrpId.toUpperCase();
			pr_NeedResponse = formatString("1"); // Ĭ��Ϊ"1"����ҪӦ�����
			hmac = formatString(""); // ����ǩ����

			// ���MD5-HMACǩ��
			hmac = PaymentForOnlineService.getReqMd5HmacForOnlinePayment(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur,
					p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
			return "member/repay";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "֧���ӿڴ������Ժ�����";
			return payIndex();
		}

	}
	
	private String formatString(String text) {
		if (text == null) {
			return "";
		}
		return text;
	}
	
	public String callback(){
		try {
			User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
			HttpServletRequest request = ServletActionContext.getRequest();
			String keyValue   = formatString(Configuration.getInstance().getValue("keyValue"));   // �̼���Կ
			String r0_Cmd 	  = formatString(request.getParameter("r0_Cmd")); // ҵ������
			String p1_MerId   = formatString(Configuration.getInstance().getValue("p1_MerId"));   // �̻����
			String r1_Code    = formatString(request.getParameter("r1_Code"));// ֧�����
			String r2_TrxId   = formatString(request.getParameter("r2_TrxId"));// �ױ�֧��������ˮ��
			String r3_Amt     = formatString(request.getParameter("r3_Amt"));// ֧�����
			String r4_Cur     = formatString(request.getParameter("r4_Cur"));// ���ױ���
			String r5_Pid     = new String(formatString(request.getParameter("r5_Pid")).getBytes("iso-8859-1"),"gbk");// ��Ʒ����
			String r6_Order   = formatString(request.getParameter("r6_Order"));// �̻�������
			String r7_Uid     = formatString(request.getParameter("r7_Uid"));// �ױ�֧����ԱID
			String r8_MP      = new String(formatString(request.getParameter("r8_MP")).getBytes("iso-8859-1"),"gbk");// �̻���չ��Ϣ
			String r9_BType   = formatString(request.getParameter("r9_BType"));// ���׽����������
			String hmac       = formatString(request.getParameter("hmac"));// ǩ������
			boolean isOK = false;
			// У�鷵�����ݰ�
			isOK = PaymentForOnlineService.verifyCallback(hmac,p1_MerId,r0_Cmd,r1_Code, 
					r2_TrxId,r3_Amt,r4_Cur,r5_Pid,r6_Order,r7_Uid,r8_MP,r9_BType,keyValue);
			if(isOK) {
				//�ڽ��յ�֧�����֪ͨ���ж��Ƿ���й�ҵ���߼�������Ҫ�ظ�����ҵ���߼�����
				if(r1_Code.equals("1")) {
					// ��Ʒͨ�ýӿ�֧���ɹ�����-������ض���
					if(r9_BType.equals("1")) {
						//out.println("callback��ʽ:��Ʒͨ�ýӿ�֧���ɹ�����-������ض���");
						// ��Ʒͨ�ýӿ�֧���ɹ�����-��������Ե�ͨѶ
					} else if(r9_BType.equals("2")) {
						// ����ڷ���������ʱ	����ʹ��Ӧ�����ʱ������Ӧ����"success"��ͷ���ַ�������Сд������
						//out.println("SUCCESS");
					  // ��Ʒͨ�ýӿ�֧���ɹ�����-�绰֧������		
					}
					// ����ҳ������ǲ���ʱ�۲���ʹ��
					msg = "���׳ɹ�!\n�̼Ҷ�����:" + r6_Order + "<br>֧�����:" + r3_Amt + "<br>�ױ�֧��������ˮ��:" + r2_TrxId;
					user = baseBiz.getEntityById(User.class, user.getUserNo());
					BigDecimal m = user.getUserAccount().add(new BigDecimal(r3_Amt).abs());
					user.setUserAccount(m);
					baseBiz.saveOrUpdateEntity("user");
					ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
					logger.info("user [" + user.getUserId() + "] pay money " + r3_Amt + "success");
					//�����¼
					MoneyRecord mr = new MoneyRecord();
					mr.setMoney(new BigDecimal(r3_Amt).abs());
					mr.setApplyTime(new Date());
					mr.setContent("��Ա��ֵ:" + r3_Amt);
					mr.setCompleteTime(new Date());
					mr.setStatus(Const.MONEY_RECORD_SUCC);
					mr.setUser(user);
					mr.setType(Const.RECORD_TYPE_1);
					mr.setOrderNo(r6_Order);
					baseBiz.saveOrUpdateEntity(mr);
					return "member/pay_callback";
				}
			} else {
				msg = "����ǩ�����۸�!";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "��ֵ������������ϵ�ͷ����";
		}
		return payIndex();
	}

	public String applyMoney() {
		// չʾ���ݳ�ʼ��
		currNav = 4;// ��ǰtab�±�
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		user = baseBiz.getEntityById(User.class, user.getUserNo());
		ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);

		String money = ServletActionContext.getRequest().getParameter("money");
		if (!Util.isEmpty(money)) {
			if (!money.matches("^\\d+(\\.\\d+)?$")) {
				msg = "����ʽ����ȷ";
				return "member/apply_money";
			}
			double m = Double.parseDouble(money);
			if (m < 30) {
				msg = "��������30Ԫ";
				return "member/apply_money";
			}
			BigDecimal acct = user.getUserAccount();
			if (acct.doubleValue() < m) {
				msg = "���ֽ���Ѿ�����������";
				return "member/apply_money";
			}
			try {
				sfBiz.applyMoney(new BigDecimal(m), user);
				this.setMsg("�������ֳɹ�����ȴ��ͷ�����");
				return this.applyMoneyList();
			} catch (AppException e) {
				e.printStackTrace();
				this.setMsg(e.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("�������ڲ��������Ժ�����");
			}
		}
		return "member/apply_money";
	}

	public String applyMoneyList() {
		// չʾ���ݳ�ʼ��
		currNav = 4;// ��ǰtab�±�
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = sfBiz.getMyMoneyRecords(pageIndex, user);
		return "member/apply_money_list";
	}

	// �ҷ���������
	public String myTaskList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getMyTaskList(pageIndex, user);
		return "member/my_task_list";
	}

	// �ҵĸ��
	public String myGaojianList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getGaojianList(pageIndex, user);
		return "member/my_gaojian_list";
	}

	// �ƿ�����
	private Alliance a;

	public String addAlliance() {
		// չʾ���ݳ�ʼ��
		currNav = 5;// ��ǰtab�±�
		if (a != null && !Util.isEmpty(a.getSiteName()) && !Util.isEmpty(a.getSiteURL())) {
			String url = a.getSiteURL();
			if (!url.matches("http:\\/\\/[A-Za-z0-9]+\\.([A-Za-z0-9]+\\.)*[A-Za-z0-9]+")) {
				this.setMsg("URL��ʽ��������http://��ͷ");
				return "member/add_alliance";
			}
			Alliance a2 = baseBiz.getEntityByUnique(Alliance.class, "siteURL", a.getSiteURL());
			if (a2 != null) {
				this.setMsg("��URL�Ѿ�������ϵͳ�ˣ������ظ����");
				return "member/add_alliance";
			} else {
				try {
					User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
					a.setUser(user);
					a.setDate(new Date());
					baseBiz.saveOrUpdateEntity(a);
					this.setMsg("��ӳɹ�");
					logger.info("add alliance site succ," + a.getSiteURL());
					return allianceList();
				} catch (Exception e) {
					e.printStackTrace();
					this.setMsg("�������ڲ��������Ժ�����");
				}
			}
		}
		return "member/add_alliance";
	}

	public String allianceCode() {
		// չʾ���ݳ�ʼ��
		currNav = 5;// ��ǰtab�±�
		return "member/alliance_code";
	}

	public String allianceList() {
		// չʾ���ݳ�ʼ��
		currNav = 5;// ��ǰtab�±�
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = allianceBiz.getTaskList(pageIndex, user);
		return "member/alliance_list";
	}

	public int getCurrNav() {
		return currNav;
	}

	public void setCurrNav(int currNav) {
		this.currNav = currNav;
	}

	public BaseBiz getBaseBiz() {
		return baseBiz;
	}

	public void setBaseBiz(BaseBiz baseBiz) {
		this.baseBiz = baseBiz;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserQq() {
		return userQq;
	}

	public void setUserQq(String userQq) {
		this.userQq = userQq;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPwd2() {
		return pwd2;
	}

	public void setPwd2(String pwd2) {
		this.pwd2 = pwd2;
	}

	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public Map<String, List<Type>> getTypeMap() {
		return typeMap;
	}

	public void setTypeMap(Map<String, List<Type>> typeMap) {
		this.typeMap = typeMap;
	}

	public List<Type> getTopTypeList() {
		return topTypeList;
	}

	public void setTopTypeList(List<Type> topTypeList) {
		this.topTypeList = topTypeList;
	}

	public String getToptypepinyin() {
		return toptypepinyin;
	}

	public void setToptypepinyin(String toptypepinyin) {
		this.toptypepinyin = toptypepinyin;
	}

	public String getTypepinyin() {
		return typepinyin;
	}

	public void setTypepinyin(String typepinyin) {
		this.typepinyin = typepinyin;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public TaskBiz getTaskBiz() {
		return taskBiz;
	}

	public void setTaskBiz(TaskBiz taskBiz) {
		this.taskBiz = taskBiz;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public int getTaskMount() {
		return taskMount;
	}

	public void setTaskMount(int taskMount) {
		this.taskMount = taskMount;
	}

	public Gaojian getGj() {
		return gj;
	}

	public void setGj(Gaojian gj) {
		this.gj = gj;
	}

	public int getGaojianMount() {
		return gaojianMount;
	}

	public void setGaojianMount(int gaojianMount) {
		this.gaojianMount = gaojianMount;
	}

	public List<Task> getMyTasks() {
		return myTasks;
	}

	public void setMyTasks(List<Task> myTasks) {
		this.myTasks = myTasks;
	}

	public List<Gaojian> getMyGaojians() {
		return myGaojians;
	}

	public void setMyGaojians(List<Gaojian> myGaojians) {
		this.myGaojians = myGaojians;
	}

	public Alliance getA() {
		return a;
	}

	public void setA(Alliance a) {
		this.a = a;
	}

	public AllianceBiz getAllianceBiz() {
		return allianceBiz;
	}

	public void setAllianceBiz(AllianceBiz allianceBiz) {
		this.allianceBiz = allianceBiz;
	}

	public ScoreFinanceBiz getSfBiz() {
		return sfBiz;
	}

	public void setSfBiz(ScoreFinanceBiz sfBiz) {
		this.sfBiz = sfBiz;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

	public String getNodeAuthorizationURL() {
		return nodeAuthorizationURL;
	}

	public void setNodeAuthorizationURL(String nodeAuthorizationURL) {
		this.nodeAuthorizationURL = nodeAuthorizationURL;
	}

	public String getP0_Cmd() {
		return p0_Cmd;
	}

	public void setP0_Cmd(String p0_Cmd) {
		this.p0_Cmd = p0_Cmd;
	}

	public String getP1_MerId() {
		return p1_MerId;
	}

	public void setP1_MerId(String p1_MerId) {
		this.p1_MerId = p1_MerId;
	}

	public String getP2_Order() {
		return p2_Order;
	}

	public void setP2_Order(String p2_Order) {
		this.p2_Order = p2_Order;
	}

	public String getP3_Amt() {
		return p3_Amt;
	}

	public void setP3_Amt(String p3_Amt) {
		this.p3_Amt = p3_Amt;
	}

	public String getP4_Cur() {
		return p4_Cur;
	}

	public void setP4_Cur(String p4_Cur) {
		this.p4_Cur = p4_Cur;
	}

	public String getP5_Pid() {
		return p5_Pid;
	}

	public void setP5_Pid(String p5_Pid) {
		this.p5_Pid = p5_Pid;
	}

	public String getP6_Pcat() {
		return p6_Pcat;
	}

	public void setP6_Pcat(String p6_Pcat) {
		this.p6_Pcat = p6_Pcat;
	}

	public String getP7_Pdesc() {
		return p7_Pdesc;
	}

	public void setP7_Pdesc(String p7_Pdesc) {
		this.p7_Pdesc = p7_Pdesc;
	}

	public String getP8_Url() {
		return p8_Url;
	}

	public void setP8_Url(String p8_Url) {
		this.p8_Url = p8_Url;
	}

	public String getP9_SAF() {
		return p9_SAF;
	}

	public void setP9_SAF(String p9_SAF) {
		this.p9_SAF = p9_SAF;
	}

	public String getPa_MP() {
		return pa_MP;
	}

	public void setPa_MP(String pa_MP) {
		this.pa_MP = pa_MP;
	}

	public String getPd_FrpId() {
		return pd_FrpId;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public String getPr_NeedResponse() {
		return pr_NeedResponse;
	}

	public void setPr_NeedResponse(String pr_NeedResponse) {
		this.pr_NeedResponse = pr_NeedResponse;
	}

	public String getHmac() {
		return hmac;
	}

	public void setHmac(String hmac) {
		this.hmac = hmac;
	}

}
