package com.throne212.tui5.action;

import java.sql.Timestamp;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.AppException;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.EncryptUtil;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

public class MemberAction extends BaseAction {

	private BaseBiz baseBiz;
	private TaskBiz taskBiz;

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
		for(Object obj : pageBean.getResultList()){
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
			if(task == null){
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
		}else if (task != null && !Util.isEmpty(task.getTitle())) {// 发布全新的，存储进库
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
			//publisher
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

			// 保存进库
			try {
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
			if (!Const.TASK_STATUS_PUBLISHED.equals(task.getStatus()) || task.getEndDate() == null || System.currentTimeMillis() > task.getEndDate().getTime()) {
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
	
	//积分
	public String myscore(){
		
		return "member/myscore";
	}
	
	//财务
	public String finance(){
		
		return "member/finance";
	}

	public String myTaskList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getMyTaskList(pageIndex, user);
		return "member/my_task_list";
	}

	public String myGaojianList() {
		User user = (User) ActionContext.getContext().getSession().get(Const.SESS_USER_OBJ);
		pageBean = taskBiz.getGaojianList(pageIndex, user);
		return "member/my_gaojian_list";
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

}
