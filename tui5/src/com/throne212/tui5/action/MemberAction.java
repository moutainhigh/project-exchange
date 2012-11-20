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

	// 公共参数
	private int currNav = 1;

	// 首页
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

	// 发布的任务列表
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

	// 发布任务
	private Map<String, List<Type>> typeMap;
	private List<Type> topTypeList;
	private String toptypepinyin;
	private String typepinyin;
	private Task task;

	public String publish() {
		// 展示数据初始化
		currNav = 2;// 当前tab下标
		buildTopTypeList();// 构建分类类型
		if (!Util.isEmpty(typepinyin)) {
			Type t = baseBiz.getEntityByUnique(Type.class, "pinyin", typepinyin);
			if (t != null) {
				Type topType = baseBiz.getEntityByUnique(Type.class, "id", t.getParentId());
				toptypepinyin = topType.getPinyin();
			}
		}

		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		if (task != null && task.getId() != null) {// 发布已有的，存储进库
			task = taskBiz.getEntityById(Task.class, task.getId());
			if (task == null) {
				this.setMsg("任务不存在了");
				return "member/publish";
			}
			try {
				if (user.getUserAccount().doubleValue() < task.getMoney().doubleValue()) {
					this.setMsg("对不起，帐号余额不足，请先充值。或选择“稍后再发布的方式”。");
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
				msg = "服务器内部错误，请稍后再试";
			}
		} else if (task != null && !Util.isEmpty(task.getTitle())) {// 发布全新的，存储进库
			// 校验
			if (Util.chineseLength(task.getTitle()) > 50) {
				this.setMsg("标题长度超过要求");
				return "member/publish";
			}
			if (!Util.isEmpty(task.getContent()) && Util.chineseLength(task.getContent()) > 1000) {
				this.setMsg("推广要求长度超过要求");
				return "member/publish";
			}
			if (!Util.isEmpty(task.getShenhe()) && Util.chineseLength(task.getShenhe()) > 500) {
				this.setMsg("审核标准长度超过要求");
				return "member/publish";
			}
			if (task.getMoney() == null) {
				this.setMsg("金额不能为空");
				return "member/publish";
			}
			if (Util.isEmpty(typepinyin)) {
				this.setMsg("缺少任务类型");
				return "member/publish";
			}
			Type type = baseBiz.getEntityByUnique(Type.class, "pinyin", typepinyin);
			if (type == null) {
				this.setMsg("任务类型没有找到");
				return "member/publish";
			}
			task.setType(type);
			// publisher
			task.setPublisher(user);

			String isGongBu = ServletActionContext.getRequest().getParameter("isGongBu");
			// 是否立即发布
			if ("1".equals(isGongBu)) {
				if (user.getUserAccount().doubleValue() < task.getMoney().doubleValue()) {
					this.setMsg("对不起，帐号余额不足，请先充值。或选择“稍后再发布的方式”。");
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

			// 附件
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

			if (task.getPriceClass() == 2) {// 单人中标
				task.setGaojianMount(1);
				task.setGaojianPrice(task.getMoney());
			}

			// 保存进库
			try {
				task.setPassGaojian(0);
				task.setPassMoney(new BigDecimal(0));
				taskBiz.publishTask(task);
				return "member/publish_succ";
			} catch (AppException e) {
				msg = e.getMessage();
			} catch (Exception e) {
				e.printStackTrace();
				msg = "服务器内部错误，请稍后再试";
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

	// 资料修改
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
			this.setMsg("保存成功");
			logger.info("save user info succ");
		} catch (Exception e) {
			e.printStackTrace();
			this.setMsg("保存失败，服务器内错误，请稍候再试");
		}
		return info();
	}

	// 修改密码
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
				this.setMsg("原密码错误");
				return "member/pwd";
			}
			try {
				user.setUserPassword(EncryptUtil.md5Encode(pwd));
				baseBiz.saveOrUpdateEntity(user);
				ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
				this.setMsg("保存成功");
				logger.info("save user pwd succ");
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("保存失败，服务器内错误，请稍候再试");
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
				this.setMsg("任务已经结束或关闭，无法投稿");
				return "member/submit_gaojian_rst";
			}
			if (gj != null && !Util.isEmpty(gj.getContent())) {// 保存稿件
				try {
					gj.setTask(task);
					User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
					gj.setUser(user);
					gj.setSubmitDate(new Timestamp(System.currentTimeMillis()));
					gj.setStatus(Const.GAOJIAN_STATUS_INIT);
					taskBiz.saveOrUpdateEntity(gj);
					this.setMsg("稿件提交成功");
					return "member/submit_gaojian_rst";
				} catch (Exception e) {
					e.printStackTrace();
					this.setMsg("稿件提交失败，请稍候再试");
					return "member/submit_gaojian_rst";
				}
			}
		} else {
			this.setMsg("参数缺失");
		}
		return "member/submit_gaojian";
	}

	// 积分
	public String myscore() {
		// 展示数据初始化
		currNav = 3;// 当前tab下标
		return "member/myscore";
	}

	public String myscoreList() {
		// 展示数据初始化
		currNav = 3;// 当前tab下标
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = sfBiz.getMyScore(pageIndex, user);
		return "member/myscore_list";
	}

	// 财务
	public String finance() {
		// 展示数据初始化
		currNav = 4;// 当前tab下标
		return "member/finance";
	}

	public String financeList() {
		// 展示数据初始化
		currNav = 4;// 当前tab下标
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		String type = ServletActionContext.getRequest().getParameter("type");
		if (Util.isEmpty(type))
			pageBean = sfBiz.getMyFinance(pageIndex, user);
		else if (type.matches("\\d"))
			pageBean = sfBiz.getMyFinance(pageIndex, user, Integer.valueOf(type));
		return "member/finance_list";
	}

	// 充值首页
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
				msg = "最低充值金额为5元";
				return payIndex();
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			msg = "充值金额须为正整数";
			return payIndex();
		}
		
		try {
			request.setCharacterEncoding("GBK");
			keyValue = formatString(Configuration.getInstance().getValue("keyValue")); // 商家密钥
			nodeAuthorizationURL = formatString(Configuration.getInstance().getValue("yeepayCommonReqURL")); // 交易请求地址
			// 商家设置用户购买商品的支付信息
			p0_Cmd = formatString("Buy"); // 在线支付请求，固定值 ”Buy”
			p1_MerId = formatString(Configuration.getInstance().getValue("p1_MerId")); // 商户编号
			p2_Order = formatString(request.getParameter("p2_Order")); // 商户订单号
			p2_Order = Const.ORDER_PRE_CHONG + Util.generateOrderNo();
			p3_Amt = formatString(request.getParameter("p3_Amt")); // 支付金额
			p4_Cur = formatString("CNY"); // 交易币种
			p5_Pid = formatString(request.getParameter("p5_Pid")); // 商品名称
			p5_Pid = "会员充值";
			p6_Pcat = formatString(request.getParameter("p6_Pcat")); // 商品种类
			p6_Pcat = "会员充值";
			p7_Pdesc = formatString(request.getParameter("p7_Pdesc")); // 商品描述
			p7_Pdesc = "会员充值" + p3_Amt;
			p8_Url = formatString(request.getParameter("p8_Url")); // 商户接收支付成功数据的地址
			p8_Url = "http://www.tui5.com/callback.jsp";
			p9_SAF = formatString(request.getParameter("p9_SAF")); // 需要填写送货信息
																			// 0：不需要
																			// 1:需要
			p9_SAF = "0";
			pa_MP = formatString(request.getParameter("pa_MP")); // 商户扩展信息
			pa_MP = user.getUserId();
			pd_FrpId = formatString(request.getParameter("pd_FrpId")); // 支付通道编码
			// 银行编号必须大写
			pd_FrpId = pd_FrpId.toUpperCase();
			pr_NeedResponse = formatString("1"); // 默认为"1"，需要应答机制
			hmac = formatString(""); // 交易签名串

			// 获得MD5-HMAC签名
			hmac = PaymentForOnlineService.getReqMd5HmacForOnlinePayment(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur,
					p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
			return "member/repay";
		} catch (Exception e) {
			e.printStackTrace();
			msg = "支付接口错误，请稍候再试";
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
			String keyValue   = formatString(Configuration.getInstance().getValue("keyValue"));   // 商家密钥
			String r0_Cmd 	  = formatString(request.getParameter("r0_Cmd")); // 业务类型
			String p1_MerId   = formatString(Configuration.getInstance().getValue("p1_MerId"));   // 商户编号
			String r1_Code    = formatString(request.getParameter("r1_Code"));// 支付结果
			String r2_TrxId   = formatString(request.getParameter("r2_TrxId"));// 易宝支付交易流水号
			String r3_Amt     = formatString(request.getParameter("r3_Amt"));// 支付金额
			String r4_Cur     = formatString(request.getParameter("r4_Cur"));// 交易币种
			String r5_Pid     = new String(formatString(request.getParameter("r5_Pid")).getBytes("iso-8859-1"),"gbk");// 商品名称
			String r6_Order   = formatString(request.getParameter("r6_Order"));// 商户订单号
			String r7_Uid     = formatString(request.getParameter("r7_Uid"));// 易宝支付会员ID
			String r8_MP      = new String(formatString(request.getParameter("r8_MP")).getBytes("iso-8859-1"),"gbk");// 商户扩展信息
			String r9_BType   = formatString(request.getParameter("r9_BType"));// 交易结果返回类型
			String hmac       = formatString(request.getParameter("hmac"));// 签名数据
			boolean isOK = false;
			// 校验返回数据包
			isOK = PaymentForOnlineService.verifyCallback(hmac,p1_MerId,r0_Cmd,r1_Code, 
					r2_TrxId,r3_Amt,r4_Cur,r5_Pid,r6_Order,r7_Uid,r8_MP,r9_BType,keyValue);
			if(isOK) {
				//在接收到支付结果通知后，判断是否进行过业务逻辑处理，不要重复进行业务逻辑处理
				if(r1_Code.equals("1")) {
					// 产品通用接口支付成功返回-浏览器重定向
					if(r9_BType.equals("1")) {
						//out.println("callback方式:产品通用接口支付成功返回-浏览器重定向");
						// 产品通用接口支付成功返回-服务器点对点通讯
					} else if(r9_BType.equals("2")) {
						// 如果在发起交易请求时	设置使用应答机制时，必须应答以"success"开头的字符串，大小写不敏感
						//out.println("SUCCESS");
					  // 产品通用接口支付成功返回-电话支付返回		
					}
					// 下面页面输出是测试时观察结果使用
					msg = "交易成功!\n商家订单号:" + r6_Order + "<br>支付金额:" + r3_Amt + "<br>易宝支付交易流水号:" + r2_TrxId;
					user = baseBiz.getEntityById(User.class, user.getUserNo());
					BigDecimal m = user.getUserAccount().add(new BigDecimal(r3_Amt).abs());
					user.setUserAccount(m);
					baseBiz.saveOrUpdateEntity("user");
					ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);
					logger.info("user [" + user.getUserId() + "] pay money " + r3_Amt + "success");
					//加入记录
					MoneyRecord mr = new MoneyRecord();
					mr.setMoney(new BigDecimal(r3_Amt).abs());
					mr.setApplyTime(new Date());
					mr.setContent("会员充值:" + r3_Amt);
					mr.setCompleteTime(new Date());
					mr.setStatus(Const.MONEY_RECORD_SUCC);
					mr.setUser(user);
					mr.setType(Const.RECORD_TYPE_1);
					mr.setOrderNo(r6_Order);
					baseBiz.saveOrUpdateEntity(mr);
					return "member/pay_callback";
				}
			} else {
				msg = "交易签名被篡改!";
			}
		} catch (Exception e) {
			e.printStackTrace();
			msg = "充值发生错误，请联系客服解决";
		}
		return payIndex();
	}

	public String applyMoney() {
		// 展示数据初始化
		currNav = 4;// 当前tab下标
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		user = baseBiz.getEntityById(User.class, user.getUserNo());
		ActionContext.getContext().getSession().put(Const.SESS_USER_OBJ, user);

		String money = ServletActionContext.getRequest().getParameter("money");
		if (!Util.isEmpty(money)) {
			if (!money.matches("^\\d+(\\.\\d+)?$")) {
				msg = "金额格式不正确";
				return "member/apply_money";
			}
			double m = Double.parseDouble(money);
			if (m < 30) {
				msg = "金额不能少于30元";
				return "member/apply_money";
			}
			BigDecimal acct = user.getUserAccount();
			if (acct.doubleValue() < m) {
				msg = "提现金额已经超过你的余额";
				return "member/apply_money";
			}
			try {
				sfBiz.applyMoney(new BigDecimal(m), user);
				this.setMsg("申请提现成功，请等待客服处理");
				return this.applyMoneyList();
			} catch (AppException e) {
				e.printStackTrace();
				this.setMsg(e.getMessage());
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("服务器内部错误，请稍候再试");
			}
		}
		return "member/apply_money";
	}

	public String applyMoneyList() {
		// 展示数据初始化
		currNav = 4;// 当前tab下标
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = sfBiz.getMyMoneyRecords(pageIndex, user);
		return "member/apply_money_list";
	}

	// 我发布的任务
	public String myTaskList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getMyTaskList(pageIndex, user);
		return "member/my_task_list";
	}

	// 我的稿件
	public String myGaojianList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getGaojianList(pageIndex, user);
		return "member/my_gaojian_list";
	}

	// 推客联盟
	private Alliance a;

	public String addAlliance() {
		// 展示数据初始化
		currNav = 5;// 当前tab下标
		if (a != null && !Util.isEmpty(a.getSiteName()) && !Util.isEmpty(a.getSiteURL())) {
			String url = a.getSiteURL();
			if (!url.matches("http:\\/\\/[A-Za-z0-9]+\\.([A-Za-z0-9]+\\.)*[A-Za-z0-9]+")) {
				this.setMsg("URL格式错误，请以http://开头");
				return "member/add_alliance";
			}
			Alliance a2 = baseBiz.getEntityByUnique(Alliance.class, "siteURL", a.getSiteURL());
			if (a2 != null) {
				this.setMsg("此URL已经存在于系统了，请勿重复添加");
				return "member/add_alliance";
			} else {
				try {
					User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
					a.setUser(user);
					a.setDate(new Date());
					baseBiz.saveOrUpdateEntity(a);
					this.setMsg("添加成功");
					logger.info("add alliance site succ," + a.getSiteURL());
					return allianceList();
				} catch (Exception e) {
					e.printStackTrace();
					this.setMsg("服务器内部错误，请稍候再试");
				}
			}
		}
		return "member/add_alliance";
	}

	public String allianceCode() {
		// 展示数据初始化
		currNav = 5;// 当前tab下标
		return "member/alliance_code";
	}

	public String allianceList() {
		// 展示数据初始化
		currNav = 5;// 当前tab下标
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
