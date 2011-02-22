package com.throne212.siliao.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.BaseBiz;
import com.throne212.siliao.biz.DataBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.domain.Admin;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.MailSetting;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.ProviderAccount;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class DataAction extends BaseAction {

	private BaseBiz baseBiz;
	private DataBiz dataBiz;

	private List list;
	private PageBean pageBean;
	private Integer page;
	private InputStream downloadFile;

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

	public String mailSetting() {
		List<MailSetting> list = baseBiz.getAll(MailSetting.class);
		if (list.size() == 0) {
			mailSetting = null;
		} else {
			mailSetting = list.get(0);
		}
		return "mail_setting";
	}

	public String updateMailSetting() {
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);

		if (Util.isEmpty(username) || Util.isEmpty(password) || Util.isEmpty(smtp)) {
			this.setMsg("请填入完整信息！");
			return "fail";
		}

		List<MailSetting> list = baseBiz.getAll(MailSetting.class);
		if (list.size() == 0) {
			mailSetting = null;
		} else {
			mailSetting = list.get(0);
		}

		if (mailSetting == null) {
			mailSetting = new MailSetting();
		}
		mailSetting.setUsername(username);
		mailSetting.setPassword(password);
		mailSetting.setSmtp(smtp);
		mailSetting.setEnable(on);
		mailSetting.setCreateName(user.getLoginName());
		mailSetting.setCreateDate(new Date());
		baseBiz.saveOrUpdateEntity(mailSetting);

		UserLog log = new UserLog();
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

	// 农户
	private Farmer farmer;

	public String saveFarmer() {
		if (farmer == null) {
			this.setMsg("农户保存失败，请检查数据是否录入完整");
			return "farmer_edit";
		}
		if (farmer != null && !Util.isEmpty(farmer.getName())) {// 添加或更新农户信息
			farmer = dataBiz.saveFarmer(farmer);
			this.setMsg("农户【" + farmer.getName() + "】保存成功");
			farmer = null;
			return farmerList();
		} else if (farmer != null && farmer.getId() != null) {// 查看农户详情
			farmer = dataBiz.getEntityById(Farmer.class, farmer.getId());
			return "farmer_edit";
		}
		return "farmer_edit";
	}

	private Date fromDate;
	private Date toDate;

	public String farmerList() {
		pageBean = dataBiz.getFarmList(farmer, fromDate, toDate, page);
		return "farmer_list";
	}

	public String deleteFarmer() {
		if (farmer != null && farmer.getId() != null) {
			dataBiz.deleteFarmer(farmer);
			this.setMsg("农户删除成功");
		} else {
			this.setMsg("农户删除失败，参数不完整");
		}
		return farmerList();
	}

	public String exportFarmerExcel() {
		String path = dataBiz.getFarmerExcelDownloadFile(farmer, fromDate, toDate);
		if (path != null) {
			try {
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}

	// 用户管理
	private User user;
	private String role;

	public String saveUser() {
		if (user == null) {
			this.setMsg("用户保存失败，请检查数据是否录入完整");
			return "user_edit";
		}
		if (user != null && !Util.isEmpty(user.getLoginName())) {// 添加或更新用户信息
			if (user.getId() == null) {
				User userInDB = dataBiz.getEntityByUnique(User.class, "loginName", user.getLoginName());
				if (userInDB != null) {
					this.setMsg("已存在此用户,请重新输入用户名!");
					return "user_edit";
				}
			}
			User newUser = null;
			if (!Util.isEmpty(role)) {
				if (WebConstants.USER_NAME_ADMIN.endsWith(role)) {// 添加或更新系统管理员
					newUser = new Admin();
				} else if (WebConstants.USER_NAME_AREA.endsWith(role)) {
					newUser = new AreaAccount();
				} else if (WebConstants.USER_NAME_MANAGER.endsWith(role)) {
					newUser = new ManagerAccount();
				} else if (WebConstants.USER_NAME_PROVIDER.endsWith(role)) {
					newUser = new ProviderAccount();
				}
				newUser.setLoginName(user.getLoginName());
				newUser.setId(user.getId());
				newUser.setPassword(user.getPassword());
				newUser.setRemark(user.getRemark());
				newUser.setEmail(user.getEmail());
				newUser.setTel(user.getTel());
				newUser.setName(user.getName());

				user = dataBiz.saveUser(newUser);
				this.setMsg("用户保存成功【" + user.getName() + "】");
				this.setUser(null);
				this.setRole(null);
				return userList();
			}else{
				this.setMsg("用户角色参数缺失");
			}
		} else if (user != null && user.getId() != null) {// 查看用户户详情
			user = dataBiz.getEntityById(User.class, user.getId());
			return "user_edit";
		}
		return "user_edit";
	}

	// 条件字段
	public String userList() {
		pageBean = dataBiz.getUserList(user, fromDate, toDate, page, role);
		return "user_list";
	}

	public String deleteUser() {
		if (user != null && user.getId() != null) {
			dataBiz.deleteUser(user);
			this.setMsg("用户删除成功");
		} else {
			this.setMsg("用户删除失败，参数不完整");
		}
		return userList();
	}

	public String exportUserExcel() {
		String path = dataBiz.getUserExcelDownloadFile(user, fromDate, toDate, role);
		if (path != null) {
			try {
				this.setMsg("用户列表");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
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

	public DataBiz getDataBiz() {
		return dataBiz;
	}

	public void setDataBiz(DataBiz dataBiz) {
		this.dataBiz = dataBiz;
	}

	public Farmer getFarmer() {
		return farmer;
	}

	public void setFarmer(Farmer farmer) {
		this.farmer = farmer;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
