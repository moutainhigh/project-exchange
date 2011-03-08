package com.throne212.siliao.biz.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.siliao.biz.DataBiz;
import com.throne212.siliao.common.PageBean;
import com.throne212.siliao.common.Util;
import com.throne212.siliao.common.WebConstants;
import com.throne212.siliao.dao.FactoryDao;
import com.throne212.siliao.dao.FarmAbsDao;
import com.throne212.siliao.dao.FarmerDao;
import com.throne212.siliao.dao.RateDao;
import com.throne212.siliao.dao.UserDao;
import com.throne212.siliao.domain.Area;
import com.throne212.siliao.domain.AreaLog;
import com.throne212.siliao.domain.Factory;
import com.throne212.siliao.domain.FactoryAbs;
import com.throne212.siliao.domain.FactoryLog;
import com.throne212.siliao.domain.Farm;
import com.throne212.siliao.domain.FarmAbs;
import com.throne212.siliao.domain.FarmLog;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.FarmerLog;
import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.Provider;
import com.throne212.siliao.domain.ProviderLog;
import com.throne212.siliao.domain.Rate;
import com.throne212.siliao.domain.RateLog;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class DataBizImpl extends BaseBizImpl implements DataBiz {

	private FarmerDao farmerDao;
	private UserDao userDao;
	private RateDao rateDao;
	private FarmAbsDao farmAbsDao;
	private FactoryDao factoryDao;

	// 农户
	public Farmer saveFarmer(Farmer farmer) {
		// 判断是否为新的农户
		if (farmer.getId() == null) {
			farmer.setEnable(true);
			farmer.setCreateDate(new Date());
			farmer.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(farmer);
			// 保存日志
			FarmerLog log = Util.getBaseLog(FarmerLog.class, WebConstants.OP_CREATE);
			log.setFarmer(farmer);
			log.setName(farmer.getName());
			log.setAreaName(farmer.getArea().getName());
			log.setNo(farmer.getNo());
			log.setTel(farmer.getTel());
			log.setEmail(farmer.getEmail());
			log.setRemark(farmer.getRemark());
			baseDao.saveOrUpdate(log);
			logger.info("添加农户【" + farmer.getName() + "】成功");
		} else {
			Farmer farmerInDB = baseDao.getEntityById(Farmer.class, farmer.getId());
			farmer.setEnable(farmerInDB.getEnable());
			farmer.setCreateDate(farmerInDB.getCreateDate());
			farmer.setCreateName(farmerInDB.getCreateName());
			baseDao.saveOrUpdate(farmer);
			// 保存日志
			FarmerLog log = Util.getBaseLog(FarmerLog.class, WebConstants.OP_UPDATE);
			log.setFarmer(farmer);
			log.setName(farmer.getName());
			log.setAreaName(farmer.getArea().getName());
			log.setNo(farmer.getNo());
			log.setTel(farmer.getTel());
			log.setEmail(farmer.getEmail());
			log.setRemark(farmer.getRemark());
			baseDao.saveOrUpdate(log);
			logger.info("更新农户【" + farmer.getName() + "】成功");
		}
		return farmer;
	}

	public Farmer deleteFarmer(Farmer farmer) {
		farmer = baseDao.getEntityById(Farmer.class, farmer.getId());
		farmer.setEnable(false);
		baseDao.saveOrUpdate(farmer);
		logger.info("逻辑删除农户【" + farmer.getName() + "】成功");
		return farmer;
	}

	public PageBean<Farmer> getFarmerList(Farmer condition, Date fromDate, Date toDate, Integer page,String orderBy,String orderType,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return farmerDao.getFarmerList(condition, fromDate, toDate, pageIndex, orderBy, orderType,pageSize);
	}

	public String getFarmerExcelDownloadFile(Farmer condition, Date fromDate, Date toDate,String orderBy,String orderType) {
		List<Farmer> farmerList = farmerDao.getFarmerList(condition, fromDate, toDate, orderBy, orderType);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("养殖户列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "姓名", format));
			sheet.addCell(new Label(2, 0, "塘口号", format));
			sheet.addCell(new Label(3, 0, "所属管区", format));
			sheet.addCell(new Label(4, 0, "手机号码", format));
			sheet.addCell(new Label(5, 0, "邮箱地址", format));
			sheet.addCell(new Label(6, 0, "备注", format));

			// 加内容
			int i = 1;
			for (Farmer f : farmerList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getName()));
				sheet.addCell(new Label(2, i, f.getNo()));
				sheet.addCell(new Label(3, i, f.getArea().getName()));
				sheet.addCell(new Label(4, i, f.getTel()));
				sheet.addCell(new Label(5, i, f.getEmail()));
				sheet.addCell(new Label(6, i++, f.getRemark()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	public FarmerDao getFarmerDao() {
		return farmerDao;
	}

	public void setFarmerDao(FarmerDao farmerDao) {
		this.farmerDao = farmerDao;
	}

	// 用户

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public <T extends User> T saveUser(T user) {
		// 判断是否为新的用户
		if (user.getId() == null) {
			user.setEnable(true);
			user.setCreateDate(new Date());
			user.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(user);
			// 保存日志
			UserLog log = Util.getBaseLog(UserLog.class, WebConstants.OP_CREATE);
			log.setUser(user);
			log.setRemark(user.getRemark());
			log.setEmail(user.getEmail());
			log.setTel(user.getTel());
			log.setName(user.getName());
			baseDao.saveOrUpdate(log);
			logger.info("添加用户【" + user.getLoginName() + "】成功");
		} else {
			User userInDB = baseDao.getEntityById(User.class, user.getId());
			userInDB.setLoginName(user.getLoginName());
			userInDB.setPassword(user.getPassword());
			userInDB.setRemark(user.getRemark());
			userInDB.setEmail(user.getEmail());
			userInDB.setTel(user.getTel());
			userInDB.setName(user.getName());
			baseDao.saveOrUpdate(userInDB);
			// 保存日志
			UserLog log = Util.getBaseLog(UserLog.class, WebConstants.OP_UPDATE);
			log.setUser(userInDB);
			log.setRemark(user.getRemark());
			log.setEmail(user.getEmail());
			log.setTel(user.getTel());
			log.setName(user.getName());
			baseDao.saveOrUpdate(log);
			logger.info("更新用户【" + user.getLoginName() + "】成功");
		}
		return user;
	}

	public User deleteUser(User user) {
		user = baseDao.getEntityById(User.class, user.getId());
		user.setEnable(false);
		baseDao.saveOrUpdate(user);
		logger.info("逻辑删除用户【" + user.getLoginName() + "】成功");
		return user;
	}

	public PageBean<User> getUserList(User condition, Date fromDate, Date toDate, Integer page, String role,String orderBy,String orderType,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return userDao.getUserList(condition, fromDate, toDate, pageIndex, role, orderBy,orderType,pageSize);
	}

	public String getUserExcelDownloadFile(User condition, Date fromDate, Date toDate, String role,String orderBy,String orderType) {
		List<User> userList = userDao.getUserList(condition, fromDate, toDate, role,orderBy, orderType);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("用户列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "姓名", format));
			sheet.addCell(new Label(2, 0, "密码", format));
			sheet.addCell(new Label(3, 0, "角色", format));
			sheet.addCell(new Label(4, 0, "手机号码", format));
			sheet.addCell(new Label(5, 0, "邮箱地址", format));
			sheet.addCell(new Label(6, 0, "备注", format));

			// 加内容
			int i = 1;
			for (User f : userList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getLoginName()));
				sheet.addCell(new Label(2, i, f.getPassword()));
				sheet.addCell(new Label(3, i, f.getUserRole()));
				sheet.addCell(new Label(4, i, f.getTel()));
				sheet.addCell(new Label(5, i, f.getEmail()));
				sheet.addCell(new Label(6, i++, f.getRemark()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	public Rate deleteRate(Rate rate) {
		rate = baseDao.getEntityById(Rate.class, rate.getId());
		rate.setEnable(false);
		baseDao.saveOrUpdate(rate);
		logger.info("逻辑删除利率【" + rate.getId() + "】成功");
		return rate;
	}

	public PageBean<Rate> getRateList(Rate condition, Date fromDate, Date toDate, Date fromDate2, Date toDate2, String rateName, Integer page,String orderBy,String orderType,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return rateDao.getRateList(condition, fromDate, toDate, fromDate2, toDate2, rateName, pageIndex, orderBy, orderType,pageSize);
	}

	public String getRateExcelDownloadFile(Rate condition, Date fromDate, Date toDate, Date fromDate2, Date toDate2, String rateName,String orderBy,String orderType) {
		List<Rate> rateList = rateDao.getRateList(condition, fromDate, toDate, fromDate2, toDate2, rateName, orderBy, orderType);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("利率列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "利率主体", format));
			sheet.addCell(new Label(2, 0, "起始日期", format));
			sheet.addCell(new Label(3, 0, "结束日期", format));
			sheet.addCell(new Label(4, 0, "创建时间", format));
			sheet.addCell(new Label(5, 0, "备注", format));

			// 加内容
			int i = 1;
			for (Rate f : rateList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, "f".equals(f.getRateType()) ? f.getFarm().getName() : f.getProvider().getName()));
				sheet.addCell(new Label(2, i, Util.getDate(f.getFromDate())));
				sheet.addCell(new Label(3, i, Util.getDate(f.getEndDate())));
				sheet.addCell(new Label(4, i, Util.getDate(f.getCreateDate())));
				sheet.addCell(new Label(5, i++, f.getRemark()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	public Rate saveRate(Rate rate) {
		// 判断是否为新的利率
		if (rate.getId() == null) {
			rate.setEnable(true);
			rate.setCreateDate(new Date());
			rate.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			//处理利率的最后一天
			rate.setEndDate(new Date(rate.getEndDate().getTime() + (24*60*60*1000-1)));
			baseDao.saveOrUpdate(rate);
			// 保存日志
			RateLog log = Util.getBaseLog(RateLog.class, WebConstants.OP_CREATE);
			log.setRate(rate);
			log.setValue(rate.getValue());
			log.setFromDate(rate.getFromDate());
			log.setEndDate(rate.getEndDate());
			log.setRemark(rate.getRemark());
			if ("农场".equals(rate.getRateType())) {
				log.setTargetName(rate.getFarm().getName());
				
			} else if("供应厂".equals(rate.getRateType())) {
				log.setTargetName(rate.getProvider().getName());
			}
			baseDao.saveOrUpdate(log);
			logger.info("添加农户【" + rate.getId() + "】成功");
		} else {
			Rate rateInDB = baseDao.getEntityById(Rate.class, rate.getId());
			rate.setEnable(rateInDB.getEnable());
			rate.setCreateDate(rateInDB.getCreateDate());
			rate.setCreateName(rateInDB.getCreateName());
			//处理利率的最后一天
			rate.setEndDate(new Date(rate.getEndDate().getTime() + (24*60*60*1000-1)));
			baseDao.saveOrUpdate(rate);
			// 保存日志
			RateLog log = Util.getBaseLog(RateLog.class, WebConstants.OP_UPDATE);
			log.setRate(rate);
			log.setValue(rate.getValue());
			log.setFromDate(rate.getFromDate());
			log.setEndDate(rate.getEndDate());
			log.setRemark(rate.getRemark());
			if ("农场".equals(rate.getRateType())) {
				log.setTargetName(rate.getFarm().getName());
				
			} else if("供应厂".equals(rate.getRateType())) {
				log.setTargetName(rate.getProvider().getName());
			}
			baseDao.saveOrUpdate(log);
			logger.info("更新利率【" + rate.getId() + "】成功");
		}
		return rate;
	}

	public RateDao getRateDao() {
		return rateDao;
	}

	public void setRateDao(RateDao rateDao) {
		this.rateDao = rateDao;
	}

	public List<Log> getFarmerLogList(Farmer farmer) {
		return baseDao.getLogList(farmer, "farmer");
	}

	public List<Log> getUserLogList(User user) {
		return baseDao.getLogList(user, "user");
	}

	public List<Log> getRateLogList(Rate rate) {
		return baseDao.getLogList(rate, "rate");
	}

	public List<Log> getFarmLogList(Farm farm) {
		return baseDao.getLogList(farm, "farm");
	}

	public List<Log> getAreaLogList(Area area) {
		return baseDao.getLogList(area, "area");
	}
	
	public List<Log> getFactoryLogList(Factory f) {
		return baseDao.getLogList(f, "factory");
	}
	
	public List<Log> getProviderLogList(Provider p) {
		return baseDao.getLogList(p, "provider");
	}

	// 农场
	public <T extends FarmAbs> T saveFarmAbs(T farmAbs) {

		// 判断是否为新的农场或管区
		if (farmAbs.getId() == null) {
			farmAbs.setEnable(true);
			farmAbs.setCreateDate(new Date());
			farmAbs.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(farmAbs);
			// 保存日志
			if (farmAbs instanceof Farm) {
				FarmLog log = Util.getBaseLog(FarmLog.class, WebConstants.OP_CREATE);
				log.setFarm((Farm) farmAbs);
				log.setName(farmAbs.getName());
				log.setType(farmAbs.getFarmType());
				log.setRemark(farmAbs.getRemark());
				log.setManager(farmAbs.getManagerName());
				baseDao.saveOrUpdate(log);
				logger.info("添加农场【" + farmAbs.getName() + "】成功");
			} else if (farmAbs instanceof Area) {

				AreaLog log = Util.getBaseLog(AreaLog.class, WebConstants.OP_CREATE);
				log.setArea((Area) farmAbs);
				log.setName(farmAbs.getName());
				log.setType(farmAbs.getFarmType());
				log.setRemark(farmAbs.getRemark());
				log.setAccount(farmAbs.getManagerName());
				log.setFarmName(farmAbs.getFarmName());
				baseDao.saveOrUpdate(log);
				logger.info("添加管区【" + farmAbs.getName() + "】成功");

			}

		} else {
			baseDao.saveOrUpdate(farmAbs);
			// 保存日志
			if (farmAbs instanceof Farm) {
				FarmLog log = Util.getBaseLog(FarmLog.class, WebConstants.OP_UPDATE);
				log.setFarm((Farm) farmAbs);
				log.setName(farmAbs.getName());
				log.setType(farmAbs.getFarmType());
				log.setRemark(farmAbs.getRemark());
				log.setManager(farmAbs.getManagerName());
				baseDao.saveOrUpdate(log);
				logger.info("更新农场【" + farmAbs.getName() + "】成功");
			} else if (farmAbs instanceof Area) {
				AreaLog log = Util.getBaseLog(AreaLog.class, WebConstants.OP_UPDATE);
				log.setArea((Area) farmAbs);
				log.setName(farmAbs.getName());
				log.setType(farmAbs.getFarmType());
				log.setRemark(farmAbs.getRemark());
				log.setAccount(farmAbs.getManagerName());
				log.setFarmName(farmAbs.getFarmName());
				baseDao.saveOrUpdate(log);
				logger.info("更新管区【" + farmAbs.getName() + "】成功");
			}
		}
		return farmAbs;

	}

	public FarmAbs deleteFarmAbs(FarmAbs farmAbs) {
		farmAbs = baseDao.getEntityById(FarmAbs.class, farmAbs.getId());
		farmAbs.setEnable(false);
		baseDao.saveOrUpdate(farmAbs);
		logger.info("逻辑删除农场或管区【" + farmAbs.getName() + "】成功");
		return farmAbs;

	}

	public PageBean<FarmAbs> getFarmAbsList(FarmAbs condition, Date fromDate, Date toDate, Integer page, String farmType, Long farmId,
			String accountName,String orderBy,String orderType,int pageSize) {

		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return farmAbsDao.getFarmAbsList(condition, fromDate, toDate, pageIndex, farmType, farmId, accountName, orderBy, orderType,pageSize);
	}

	public String getFarmAbsExcelDownloadFile(FarmAbs condition, Date fromDate, Date toDate, String farmType, Long farmId, String accountName,String orderBy,String orderType) {

		List<FarmAbs> farmAbsList = farmAbsDao.getFarmAbsList(condition, fromDate, toDate, farmType, farmId, accountName, orderBy, orderType);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("农场或管区列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "农场管区名", format));
			sheet.addCell(new Label(2, 0, "所属农场名", format));
			sheet.addCell(new Label(3, 0, "负责人", format));
			sheet.addCell(new Label(4, 0, "备注", format));
			sheet.addCell(new Label(5, 0, "创建人", format));
			sheet.addCell(new Label(6, 0, "创建时间", format));
			// 加内容
			int i = 1;
			for (FarmAbs f : farmAbsList) {
				sheet.addCell(new Number(0, i, f.getId()));
				sheet.addCell(new Label(1, i, f.getName()));
				if (f instanceof Area) {
					Area a = (Area) f;
					sheet.addCell(new Label(2, i, a.getFarm().getName()));
					sheet.addCell(new Label(3, i, a.getAccount().getName()));
				} else {
					Farm farm = (Farm) f;
					sheet.addCell(new Label(2, i, ""));
					sheet.addCell(new Label(3, i, farm.getManager().getName()));
				}
				sheet.addCell(new Label(4, i, f.getRemark()));
				sheet.addCell(new Label(5, i, f.getCreateName()));
				sheet.addCell(new Label(6, i++, Util.getDate(f.getCreateDate())));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	public FarmAbsDao getFarmAbsDao() {
		return farmAbsDao;
	}

	public void setFarmAbsDao(FarmAbsDao farmAbsDao) {
		this.farmAbsDao = farmAbsDao;
	}

	public FactoryDao getFactoryDao() {
		return factoryDao;
	}

	public void setFactoryDao(FactoryDao factoryDao) {
		this.factoryDao = factoryDao;
	}
	
	public <T extends FactoryAbs> T saveFactoryAbs(T factoryAbs) {
		// 判断是否为新的厂商
		if (factoryAbs.getId() == null) {
			factoryAbs.setEnable(true);
			factoryAbs.setCreateDate(new Date());
			factoryAbs.setCreateName(((User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(factoryAbs);
			// 保存日志
			if (factoryAbs instanceof Factory) {
				FactoryLog log = Util.getBaseLog(FactoryLog.class, WebConstants.OP_CREATE);
				log.setFactory((Factory) factoryAbs);
				log.setName(factoryAbs.getName());
				log.setType(factoryAbs.getFactoryType());
				log.setRemark(factoryAbs.getRemark());
				baseDao.saveOrUpdate(log);
				logger.info("添加厂商【" + factoryAbs.getName() + "】成功");
			} else if (factoryAbs instanceof Provider) {
				ProviderLog log = Util.getBaseLog(ProviderLog.class, WebConstants.OP_CREATE);
				log.setProvider((Provider) factoryAbs);
				log.setName(factoryAbs.getName());
				log.setType(factoryAbs.getFactoryType());
				log.setRemark(factoryAbs.getRemark());
				log.setFactoryName(factoryAbs.getFactoryName());
				log.setAccount(factoryAbs.getManagerName());
				baseDao.saveOrUpdate(log);
				logger.info("添加供应厂【" + factoryAbs.getName() + "】成功");
			}

		} else {
			baseDao.saveOrUpdate(factoryAbs);
			// 保存日志
			if (factoryAbs instanceof Factory) {
				FactoryLog log = Util.getBaseLog(FactoryLog.class, WebConstants.OP_UPDATE);
				log.setFactory((Factory) factoryAbs);
				log.setName(factoryAbs.getName());
				log.setType(factoryAbs.getFactoryType());
				log.setRemark(factoryAbs.getRemark());
				baseDao.saveOrUpdate(log);
				logger.info("更新农场【" + factoryAbs.getName() + "】成功");
			} else if (factoryAbs instanceof Provider) {
				ProviderLog log = Util.getBaseLog(ProviderLog.class, WebConstants.OP_UPDATE);
				log.setProvider((Provider) factoryAbs);
				log.setName(factoryAbs.getName());
				log.setType(factoryAbs.getFactoryType());
				log.setRemark(factoryAbs.getRemark());
				log.setFactoryName(factoryAbs.getFactoryName());
				log.setAccount(factoryAbs.getManagerName());
				baseDao.saveOrUpdate(log);
				logger.info("更新管区【" + factoryAbs.getName() + "】成功");
			}
		}
		return factoryAbs;

	}

	public FactoryAbs deleteFactory(FactoryAbs factoryAbs) {
		factoryAbs = baseDao.getEntityById(FactoryAbs.class, factoryAbs.getId());
		factoryAbs.setEnable(false);
		baseDao.saveOrUpdate(factoryAbs);
		logger.info("逻辑删除用户【" + factoryAbs.getName() + "】成功");
		return factoryAbs;
	}

	public PageBean<FactoryAbs> getFactoryAbsList(FactoryAbs condition,Date fromDate,Date toDate,Integer page,String type,Long factoryId,String accountName,String orderBy,String orderType,int pageSize) {
		int pageIndex = 1;
		if (page != null) {
			pageIndex = page.intValue();
		}
		return factoryDao.getFactoryAbsList(condition, fromDate, toDate, pageIndex, type, factoryId, accountName, orderBy, orderType,pageSize);
	}

	public String getFactoryExcelDownloadFile(FactoryAbs condition, Date fromDate, Date toDate, String type, Long factoryId, String accountName,String orderBy,String orderType) {
		List<FactoryAbs> factoryList = factoryDao.getFactoryList(condition, fromDate, toDate, type, factoryId, accountName, orderBy, orderType);

		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		// String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("厂商列表", 0);

			// 加表头
			WritableFont font = new WritableFont(WritableFont.TIMES, 12, WritableFont.BOLD);
			WritableCellFormat format = new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号", format));
			sheet.addCell(new Label(1, 0, "供货饲料厂", format));
			sheet.addCell(new Label(2, 0, "所属厂商", format));
			sheet.addCell(new Label(3, 0, "类别", format));
			sheet.addCell(new Label(4, 0, "负责人", format));
			sheet.addCell(new Label(5, 0, "备注", format));
			sheet.addCell(new Label(6, 0, "创建人", format));

			// 加内容
			int i = 1;
			for (FactoryAbs f : factoryList) {
				if (f instanceof Provider) {
					Provider p = (Provider) f;
					sheet.addCell(new Number(0, i, p.getId()));
					sheet.addCell(new Label(1, i, p.getName()));
					sheet.addCell(new Label(2, i, p.getFactory().getName()));
					sheet.addCell(new Label(3, i, WebConstants.FACTORY_TYPE_PROVIDER));
					sheet.addCell(new Label(4, i, p.getAccount().getName()));
					sheet.addCell(new Label(5, i, p.getRemark()));
					sheet.addCell(new Label(6, i++, p.getCreateName()));
				} else if (f instanceof Factory) {
					Factory ff = (Factory) f;
					sheet.addCell(new Number(0, i, f.getId()));
					sheet.addCell(new Label(2, i, f.getName()));
					sheet.addCell(new Label(3, i, WebConstants.FACTORY_TYPE_FACTORY));
					sheet.addCell(new Label(5, i, f.getRemark()));
					sheet.addCell(new Label(6, i++, f.getCreateName()));
				}
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (rw != null)
				rw.close();
		}
		return null;
	}

	
	public List<Farmer> getFarmerByArea(Long areaId){
		Area area = this.getEntityById(Area.class, areaId);
		return baseDao.getEntitiesByColumn(Farmer.class, "area", area);
	}
}
