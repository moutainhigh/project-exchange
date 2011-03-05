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
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaAccount;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.FactoryAbs;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmAbs;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.MailSetting;
import com.throne212.siliao.domain.ManagerAccount;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderAccount;
import com.throne212.siliao.domain.Rate;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class DataAction extends BaseAction {

	private BaseBiz baseBiz;
	private DataBiz dataBiz;

	private List list;
	private PageBean pageBean;
	private Integer pageIndex;
	private int pageSize;
	private InputStream downloadFile;
	private List<Log> logList;
	private String orderBy;
	private String orderType;

	private Boolean on;
	private String username;
	private String password;
	private String smtp;
	private String from;

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
		mailSetting.setFrom(from);
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
			
			//检查农户姓名是否重复
			if(farmer.getId() == null){
				List<Farmer> farmerList = baseBiz.getEntitiesByColumn(Farmer.class, "name", farmer.getName());
				if(farmerList != null && farmerList.size() > 0){
					this.setMsg("农户姓名重复【"+farmer.getName()+"】，请重新输入");
					return "farmer_edit";
				}
			}
			
			farmer = dataBiz.saveFarmer(farmer);
			this.setMsg("农户【" + farmer.getName() + "】保存成功");
			farmer = null;
			return farmerList();
		} else if (farmer != null && farmer.getId() != null) {// 查看农户详情
			farmer = dataBiz.getEntityById(Farmer.class, farmer.getId());
			logList = dataBiz.getFarmerLogList(farmer);
			return "farmer_edit";
		}
		return "farmer_edit";
	}

	private Date fromDate;
	private Date toDate;

	public String farmerList() {
		//查看管区负责人和饲料经理是否已经制定管区或农场
		User userInsess =(User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		if (userInsess instanceof AreaAccount) {
			userInsess=(AreaAccount) userInsess;
			List<Area> areaList=baseBiz.getEntitiesByColumn(Area.class, "account", userInsess);
			if (areaList.size()==0 || ((AreaAccount) userInsess).getArea() == null) {
				this.setMsg("账户没关联任何管区,无权进行操作！");
				return "error";
			}
		}else if (userInsess instanceof ManagerAccount) {
			userInsess=(ManagerAccount) userInsess;
			List<Farm> farmList=baseBiz.getEntitiesByColumn(Farm.class, "manager", userInsess);
			if (farmList.size()==0 || ((ManagerAccount) userInsess).getFarm() == null) {
				this.setMsg("账户没关联任何农场,无权进行操作！");
				return "error";
				
			}
		}
		
		pageBean = dataBiz.getFarmerList(farmer, fromDate, toDate, pageIndex,orderBy,orderType,pageSize);
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
		String path = dataBiz.getFarmerExcelDownloadFile(farmer, fromDate, toDate,orderBy,orderType);
		if (path != null) {
			try {
				this.setMsg("farmer");
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
			if(user.getName()!=null&&user.getId()==null&&!"".equals(user.getName())){
				User userInDB=dataBiz.getEntityByUnique(User.class, "name", user.getName());
				if (userInDB!=null) {
					this.setMsg("姓名重复，请重新填入！");
					return "user_edit";
				}	
			}
			
			
			if (user.getId() == null) {
				User userInDB = dataBiz.getEntityByUnique(User.class, "loginName", user.getLoginName());
				if (userInDB != null) {
					this.setMsg("已存在此用户,请重新输入用户名!");
					return "user_edit";
				}
			}
			if(user.getEmail()!=null&&user.getId()==null&&!"".equals(user.getEmail())){
				User userEmail=dataBiz.getEntityByUnique(User.class, "email", user.getEmail());
				if (userEmail!=null) {
					this.setMsg("此邮箱已被占用，请更换可用邮箱！");
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
			} else {
				this.setMsg("用户角色参数缺失");
			}
		} else if (user != null && user.getId() != null) {// 查看用户户详情
			user = dataBiz.getEntityById(User.class, user.getId());
			logList = dataBiz.getUserLogList(user);
			return "user_edit";
		}
		return "user_edit";
	}

	// 条件字段
	public String userList() {
		pageBean = dataBiz.getUserList(user, fromDate, toDate, pageIndex, role,orderBy,orderType,pageSize);
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
		String path = dataBiz.getUserExcelDownloadFile(user, fromDate, toDate, role,orderBy,orderType);
		if (path != null) {
			try {
				this.setMsg("user");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}

	// 利率
	private Rate rate;

	public String saveRate() {
		if (rate == null) {
			this.setMsg("利率保存失败，请检查数据是否录入完整");
			return "rate_edit";
		}
		if (rate != null && rate.getValue() != null) {// 添加或更新利率记录
			if (rate.getFromDate().getTime()>rate.getEndDate().getTime()) {
				this.setMsg("起始时间必须小于结束时间！");
				return "rate_edit";
			}
			if (rate.getRateType()!=null&&!"".equals(rate.getRateType())) {
				List<Rate> rateList=null;
				if ("f".equals(rate.getRateType())&&rate.getFarm().getId()!=null) {
					Farm farm = dataBiz.getEntityById(Farm.class, rate.getFarm().getId());
					rateList=	dataBiz.getEntitiesByColumn(Rate.class, "farm", farm);
				}else if ("p".equals(rate.getRateType())&&rate.getProvider().getId()!=null) {
					Provider provider = dataBiz.getEntityById(Provider.class, rate.getProvider().getId());
					rateList=	dataBiz.getEntitiesByColumn(Rate.class, "provider", provider);
				}else {
					this.setMsg("请选择目标主体");
					return "rate_edit";
				}
				if (rateList!=null) {
					for (Rate rateExs : rateList) {
						if ((rateExs.getFromDate().getTime()<rate.getFromDate().getTime()&&rate.getFromDate().getTime()<rateExs.getEndDate().getTime())
								||(rateExs.getFromDate().getTime()<rate.getEndDate().getTime()&&rate.getEndDate().getTime()<rateExs.getEndDate().getTime())
								||(rate.getFromDate().getTime()<rateExs.getFromDate().getTime())&&(rate.getEndDate().getTime()>rateExs.getEndDate().getTime())) {
							this.setMsg("时间段重复，请重新设置！");
							return "rate_edit";
						}
					}
				}
			
				
			} else {
				this.setMsg("请选择利率主体类型");
				return "rate_edit";
			}
			rate = dataBiz.saveRate(rate);
			this.setMsg("利率保存成功");
			rate = null;
			return rateList();
		} else if (rate != null && rate.getId() != null) {// 查看利率详情
			rate = dataBiz.getEntityById(Rate.class, rate.getId());
			logList = dataBiz.getRateLogList(rate);
			return "rate_edit";
		}
		return "rate_edit";
	}

	private Date fromDate2;
	private Date toDate2;
	private String rateName;

	public String rateList() {
		pageBean = dataBiz.getRateList(rate, fromDate, toDate, fromDate2, toDate2, rateName, pageIndex,orderBy,orderType,pageSize);
		return "rate_list";
	}

	public String deleteRate() {
		if (rate != null && rate.getId() != null) {
			dataBiz.deleteRate(rate);
			this.setMsg("利率删除成功");
		} else {
			this.setMsg("利率删除失败，参数不完整");
		}
		return rateList();
	}

	public String exportRateExcel() {
		String path = dataBiz.getRateExcelDownloadFile(rate, fromDate, toDate, fromDate2, toDate2, rateName,orderBy,orderType);
		if (path != null) {
			try {
				this.setMsg("rate");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}

	// 农场
	private Long farmManagerId;
	private Long farmId;
	private String farmType;

	private FarmAbs farmAbs;

	public String saveFarmAbs() {
		if (farmAbs == null) {
			this.setMsg("农场管区保存失败，请检查数据是否录入完整");
			return "farmabs_edit";
		}
		if (farmAbs != null && !Util.isEmpty(farmAbs.getName())) {// 添加或更新用户信息
			if (farmAbs.getId() == null) {
				FarmAbs farmInDB = dataBiz.getEntityByUnique(FarmAbs.class, "name", farmAbs.getName());
				if (farmInDB != null) {
					this.setMsg("已存在此农场或管区,请重新输入!");
					return "farmabs_edit";
				}
			}
			// FarmAbs newfarmAbs = null;
			if (!Util.isEmpty(farmType)) {
				if (WebConstants.FARM_TYPE_FARM.endsWith(farmType)) {// 添加或更新农场或管区
					Farm newfarmAbs = new Farm();
					ManagerAccount managerAccount = baseBiz.getEntityById(ManagerAccount.class, farmManagerId);
					newfarmAbs.setId(farmAbs.getId());
					newfarmAbs.setName(farmAbs.getName());
					newfarmAbs.setManager(managerAccount);
					newfarmAbs.setRemark(farmAbs.getRemark());
					newfarmAbs.setCreateName(farmAbs.getCreateName());
					newfarmAbs.setCreateDate(farmAbs.getCreateDate());
					newfarmAbs = dataBiz.saveFarmAbs(newfarmAbs);
					
					//设置farm到account
					managerAccount.setFarm(newfarmAbs);
					baseBiz.saveOrUpdateEntity(managerAccount);
					
					this.setMsg("农场或管区保存成功【" + newfarmAbs.getName() + "】");
					this.setFarmAbs(null);
					this.setFarmType(null);

					return farmAbsList();

				} else if (WebConstants.FARM_TYPE_AREA.endsWith(farmType)) {
					Area newfarmAbs = new Area();
					Farm farm = baseBiz.getEntityById(Farm.class, farmId);
					AreaAccount account = baseBiz.getEntityById(AreaAccount.class, farmManagerId);

					newfarmAbs.setId(farmAbs.getId());
					newfarmAbs.setAccount(account);
					newfarmAbs.setName(farmAbs.getName());
					newfarmAbs.setFarm(farm);
					newfarmAbs.setRemark(farmAbs.getRemark());
					newfarmAbs.setCreateName(farmAbs.getCreateName());
					newfarmAbs.setCreateDate(farmAbs.getCreateDate());
					newfarmAbs = dataBiz.saveFarmAbs(newfarmAbs);
					
					//设置area到account
					account.setArea(newfarmAbs);
					baseBiz.saveOrUpdateEntity(account);
					
					this.setMsg("农场或管区保存成功【" + newfarmAbs.getName() + "】");
					this.setFarmAbs(null);
					this.setFarmType(null);
					return farmAbsList();
				}

			} else {
				this.setMsg("类型参数缺失");
			}
		} else if (farmAbs != null && farmAbs.getId() != null) {// 查看农场详情
			farmAbs = dataBiz.getEntityById(FarmAbs.class, farmAbs.getId());
			logList = (farmAbs instanceof Farm) ? dataBiz.getFarmLogList((Farm) farmAbs) : dataBiz.getAreaLogList((Area) farmAbs);
			return "farmabs_edit";
		}
		return "farmabs_edit";
	}

	private String accountName;

	public String farmAbsList() {
		pageBean = dataBiz.getFarmAbsList(farmAbs, fromDate, toDate, pageIndex, farmType, farmId, accountName,orderBy,orderType,pageSize);
		return "farmabs_list";
	}

	public String deleteFarmAbs() {
		if (farmAbs != null && farmAbs.getId() != null) {
			dataBiz.deleteFarmAbs(farmAbs);
			this.setMsg("农场或管区删除成功");
		} else {
			this.setMsg("农场或管区删除失败，参数不完整");
		}
		return farmAbsList();
	}

	public String exportFarmAbsExcel() {
		String path = dataBiz.getFarmAbsExcelDownloadFile(farmAbs, fromDate, toDate, farmType, farmId, accountName,orderBy,orderType);
		if (path != null) {
			try {
				this.setMsg("farm");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}

	// 厂商维护
	private FactoryAbs factoryAbs;
	private String factoryType; // 类别
	private Long factoryId; // 所属厂商ID
	private Long accountId; // 负责人ID

	public String saveFactory() {
		if (factoryAbs == null) {
			this.setMsg("厂商保存失败，请检查数据是否录入完整");
			return "factory_edit";
		}
		if (factoryAbs != null && !Util.isEmpty(factoryAbs.getName())) {// 添加或更新厂商信息
			if (factoryAbs.getId() == null) {
				FactoryAbs factoryInDB = dataBiz.getEntityByUnique(FactoryAbs.class, "name", factoryAbs.getName());
				if (factoryInDB != null) {
					this.setMsg("已存在此供应厂或厂商,请重新输入!");
					return "factory_edit";
				}
			}
			// FactoryAbs new factoryAbs = null;
			if (!Util.isEmpty(factoryType)) {
				if (WebConstants.FACTORY_TYPE_FACTORY.endsWith(factoryType)) {
					Factory f = new Factory();
					f.setId(factoryAbs.getId());
					f.setName(factoryAbs.getName());
					f.setRemark(factoryAbs.getRemark());
					f.setCreateName(factoryAbs.getCreateName());
					f.setCreateDate(factoryAbs.getCreateDate());
					f = dataBiz.saveFactoryAbs(f);
					this.setMsg("厂商或饲料供应厂保存成功【" + f.getName() + "】");
					this.setFactoryAbs(null);
					this.setFactoryType(null);
					return factoryList();

				} else if (WebConstants.FACTORY_TYPE_PROVIDER.endsWith(factoryType)) {
					Provider p = new Provider();
					Factory f = baseBiz.getEntityById(Factory.class, factoryId);
					ProviderAccount account = baseBiz.getEntityById(ProviderAccount.class, accountId);

					p.setId(factoryAbs.getId());
					p.setAccount(account);
					p.setName(factoryAbs.getName());
					p.setFactory(f);
					p.setRemark(factoryAbs.getRemark());
					p.setCreateName(factoryAbs.getCreateName());
					p.setCreateDate(factoryAbs.getCreateDate());
					p = dataBiz.saveFactoryAbs(p);
					
					account.setProvider(p);
					baseBiz.saveOrUpdateEntity(account);
					
					this.setMsg("厂商或饲料供应厂保存成功【" + f.getName() + "】");
					this.setFactoryAbs(null);
					this.setFactoryType(null);
					return factoryList();
				}
			} else {
				this.setMsg("类型参数缺失");
			}

		} else if (factoryAbs != null && factoryAbs.getId() != null) {// 
			factoryAbs = dataBiz.getEntityById(FactoryAbs.class, factoryAbs.getId());
			logList = (factoryAbs instanceof Factory) ? dataBiz.getFactoryLogList((Factory) factoryAbs) : dataBiz.getProviderLogList((Provider) factoryAbs);
			return "factory_edit";
		}
		return "factory_edit";
	}

	public String factoryList() {
		pageBean = dataBiz.getFactoryAbsList(factoryAbs, fromDate, toDate, pageIndex, factoryType, factoryId, accountName,orderBy,orderType,pageSize);
		return "factory_list";
	}
	public String exportFactoryExcel() {
		String path = dataBiz.getFactoryExcelDownloadFile(factoryAbs, fromDate, toDate, factoryType, factoryId, accountName,orderBy,orderType);
		if (path != null) {
			try {
				this.setMsg("factory");
				this.setDownloadFile(new FileInputStream(path));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			}
		} else {
			this.setMsg("文件下载失败");
		}
		return "excel";
	}
	public String deleteFactory() {
		if (factoryAbs != null && factoryAbs.getId() != null) {
			dataBiz.deleteFactory(factoryAbs);
			this.setMsg("厂商删除成功");
		} else {
			this.setMsg("厂商删除失败，参数不完整");
		}
		return factoryList();
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

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
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

	public List<Log> getLogList() {
		return logList;
	}

	public void setLogList(List<Log> logList) {
		this.logList = logList;
	}

	public Rate getRate() {
		return rate;
	}

	public void setRate(Rate rate) {
		this.rate = rate;
	}

	public Date getFromDate2() {
		return fromDate2;
	}

	public void setFromDate2(Date fromDate2) {
		this.fromDate2 = fromDate2;
	}

	public Date getToDate2() {
		return toDate2;
	}

	public void setToDate2(Date toDate2) {
		this.toDate2 = toDate2;
	}

	public String getRateName() {
		return rateName;
	}

	public void setRateName(String rateName) {
		this.rateName = rateName;
	}

	public Long getFarmManagerId() {
		return farmManagerId;
	}

	public void setFarmManagerId(Long farmManagerId) {
		this.farmManagerId = farmManagerId;
	}

	public Long getFarmId() {
		return farmId;
	}

	public void setFarmId(Long farmId) {
		this.farmId = farmId;
	}

	public String getFarmType() {
		return farmType;
	}

	public void setFarmType(String farmType) {
		this.farmType = farmType;
	}

	public FarmAbs getFarmAbs() {
		return farmAbs;
	}

	public void setFarmAbs(FarmAbs farmAbs) {
		this.farmAbs = farmAbs;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public FactoryAbs getFactoryAbs() {
		return factoryAbs;
	}

	public void setFactoryAbs(FactoryAbs factoryAbs) {
		this.factoryAbs = factoryAbs;
	}

	public String getFactoryType() {
		return factoryType;
	}

	public void setFactoryType(String factoryType) {
		this.factoryType = factoryType;
	}

	public Long getFactoryId() {
		return factoryId;
	}

	public void setFactoryId(Long factoryId) {
		this.factoryId = factoryId;
	}

	public Long getAccountId() {
		return accountId;
	}

	public void setAccountId(Long accountId) {
		this.accountId = accountId;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

}
