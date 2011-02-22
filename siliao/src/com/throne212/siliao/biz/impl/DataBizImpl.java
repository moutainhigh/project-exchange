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
import com.throne212.siliao.dao.FarmerDao;
import com.throne212.siliao.dao.UserDao;
import com.throne212.siliao.domain.Farmer;
import com.throne212.siliao.domain.FarmerLog;
import com.throne212.siliao.domain.User;
import com.throne212.siliao.domain.UserLog;

public class DataBizImpl extends BaseBizImpl implements DataBiz {
	
	private FarmerDao farmerDao;
	private UserDao userDao;
	
	//农户
	public Farmer saveFarmer(Farmer farmer) {
		//判断是否为新的农户
		if(farmer.getId() == null){
			farmer.setEnable(true);
			farmer.setCreateDate(new Date());
			farmer.setCreateName(((User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(farmer);
			//保存日志
			FarmerLog log = Util.getBaseLog(FarmerLog.class, WebConstants.OP_CREATE);
			log.setFarmer(farmer);
			baseDao.saveOrUpdate(log);
			logger.info("添加农户【"+farmer.getName()+"】成功");
		}else{
			baseDao.saveOrUpdate(farmer);
			//保存日志
			FarmerLog log = Util.getBaseLog(FarmerLog.class, WebConstants.OP_UPDATE);
			log.setFarmer(farmer);
			baseDao.saveOrUpdate(log);
			logger.info("更新农户【"+farmer.getName()+"】成功");
		}
		return farmer;
	}
	
	public Farmer deleteFarmer(Farmer farmer){
		farmer = baseDao.getEntityById(Farmer.class, farmer.getId());
		farmer.setEnable(false);
		baseDao.saveOrUpdate(farmer);
		logger.info("逻辑删除农户【"+farmer.getName()+"】成功");
		return farmer;
	}	
	public PageBean<Farmer> getFarmList(Farmer condition,Date fromDate,Date toDate,Integer page){
		int pageIndex = 1;
		if(page != null){
			pageIndex = page.intValue();
		}
		return farmerDao.getFarmList(condition,fromDate,toDate,pageIndex);
	}
	
	public String getFarmerExcelDownloadFile(Farmer condition,Date fromDate,Date toDate){
		List<Farmer> farmerList = farmerDao.getFarmList(condition, fromDate, toDate);
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		//String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("养殖户列表", 0);
			
			//加表头
			WritableFont font=new WritableFont(WritableFont.TIMES,12,WritableFont.BOLD); 
			WritableCellFormat format=new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号",format));
			sheet.addCell(new Label(1, 0, "姓名",format));
			sheet.addCell(new Label(2, 0, "塘口号",format));
			sheet.addCell(new Label(3, 0, "所属管区",format));
			sheet.addCell(new Label(4, 0, "手机号码",format));
			sheet.addCell(new Label(5, 0, "邮箱地址",format));
			sheet.addCell(new Label(6, 0, "备注",format));
			
			//加内容
			int i = 1;
			for(Farmer f : farmerList){
				sheet.addCell(new Number(0,i,f.getId()));
				sheet.addCell(new Label(1,i,f.getName()));
				sheet.addCell(new Label(2,i,f.getNo()));
				sheet.addCell(new Label(3,i,f.getArea().getName()));
				sheet.addCell(new Label(4,i,f.getTel()));
				sheet.addCell(new Label(5,i,f.getEmail()));
				sheet.addCell(new Label(6,i++,f.getRemark()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally{
			if(rw!=null)
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
	
	//用户
	
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public <T extends User> T saveUser(T user){
		//判断是否为新的用户
		if(user.getId() == null){
			user.setEnable(true);
			user.setCreateDate(new Date());
			user.setCreateName(((User)ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ)).getName());
			baseDao.saveOrUpdate(user);
			//保存日志
			UserLog log = Util.getBaseLog(UserLog.class, WebConstants.OP_CREATE);
			log.setUser(user);
			baseDao.saveOrUpdate(log);
			logger.info("添加用户【"+user.getLoginName()+"】成功");
		}else{
			baseDao.saveOrUpdate(user);
			//保存日志
			UserLog log = Util.getBaseLog(UserLog.class, WebConstants.OP_UPDATE);
			log.setUser(user);
			baseDao.saveOrUpdate(log);
			logger.info("更新用户【"+user.getLoginName()+"】成功");
		}
		return user;
	}
	
	public User deleteUser(User user){
		user = baseDao.getEntityById(User.class, user.getId());
		user.setEnable(false);
		baseDao.saveOrUpdate(user);
		logger.info("逻辑删除用户【"+user.getLoginName()+"】成功");
		return user;
	}	
	
	public PageBean<User> getUserList(User condition,Date fromDate,Date toDate,Integer page,String role){
		int pageIndex = 1;
		if(page != null){
			pageIndex = page.intValue();
		}
		return userDao.getUserList(condition,fromDate,toDate,pageIndex,role);
	}
	
	public String getUserExcelDownloadFile(User condition,Date fromDate,Date toDate,String role){
		List<User> userList = userDao.getUserList(condition, fromDate, toDate,role);
		
		String path = Thread.currentThread().getContextClassLoader().getResource("/").getPath();
		path = path.substring(0, path.indexOf("WEB-INF"));
		path += "excel";
		System.out.println("excel saved path : " + path);
		//String sourceFile = path + File.separator + "template.xls";
		String targetFile = path + File.separator + System.currentTimeMillis() + ".xls";
		Workbook rw = null;
		try {
			WritableWorkbook workbook = Workbook.createWorkbook(new File(targetFile));
			WritableSheet sheet = workbook.createSheet("用户列表", 0);
			
			//加表头
			WritableFont font=new WritableFont(WritableFont.TIMES,12,WritableFont.BOLD); 
			WritableCellFormat format=new WritableCellFormat(font);
			sheet.addCell(new Label(0, 0, "编号",format));
			sheet.addCell(new Label(1, 0, "姓名",format));
			sheet.addCell(new Label(2, 0, "密码",format));
			sheet.addCell(new Label(3, 0, "角色",format));
			sheet.addCell(new Label(4, 0, "手机号码",format));
			sheet.addCell(new Label(5, 0, "邮箱地址",format));
			sheet.addCell(new Label(6, 0, "备注",format));
			
			//加内容
			int i = 1;
			for(User f : userList){
				sheet.addCell(new Number(0,i,f.getId()));
				sheet.addCell(new Label(1,i,f.getLoginName()));
				sheet.addCell(new Label(2,i,f.getPassword()));
				sheet.addCell(new Label(3,i,f.getUserRole()));
				sheet.addCell(new Label(4,i,f.getTel()));
				sheet.addCell(new Label(5,i,f.getEmail()));
				sheet.addCell(new Label(6,i++,f.getRemark()));
			}

			workbook.write();
			workbook.close();
			return targetFile;
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally{
			if(rw!=null)
				rw.close();
		}
		return null;
	}


}
