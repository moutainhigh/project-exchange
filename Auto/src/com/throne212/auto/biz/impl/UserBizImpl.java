package com.throne212.auto.biz.impl;

import java.util.List;

import com.throne212.auto.biz.UserBiz;
import com.throne212.auto.common.EncryptUtil;
import com.throne212.auto.common.PageBean;
import com.throne212.auto.common.WebConstants;
import com.throne212.auto.dao.SaleDao;
import com.throne212.auto.dao.UserDao;
import com.throne212.auto.domain.Admin;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.User;

public class UserBizImpl extends BaseBizImpl implements UserBiz {

	private UserDao userDao;
	private SaleDao saleDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void setSaleDao(SaleDao saleDao) {
		this.saleDao = saleDao;
	}

	public User login(String loginName, String password) {
		User user = userDao.getUserByLoginName(loginName);
		logger.debug("user=" + user);
		if (user != null && user.getPassword()!=null && 
				(user.getPassword().equals(password) || user.getPassword().equals(EncryptUtil.md5Encode(password)))) {
			return user;
		}
		return null;
	}

	public boolean changePwd(Long userId, String oldPwd, String newPwd) {
		User user = userDao.getEntityById(User.class, userId);
		if(user.getPassword().equals(oldPwd) || user.getPassword().equals(EncryptUtil.md5Encode(oldPwd))){
			user.setPassword(EncryptUtil.md5Encode(newPwd));
			if(user instanceof Admin)
				userDao.saveOrUpdate((Admin)user);
			else
				userDao.saveOrUpdate((Sale)user);
			return true;
		}
		return false;
	}

	public PageBean<Sale> getSales(int pageIndex) {
		if(pageIndex == 0){
			pageIndex = 1;
		}
		int startIndex = (pageIndex-1) * WebConstants.maxRowPerPage;
		List<Sale> sales = saleDao.getSaleList(startIndex, WebConstants.maxRowPerPage);
		PageBean<Sale> bean = new PageBean<Sale>();
		bean.setPageIndex(pageIndex);
		bean.setResultList(sales);
		bean.setRowPerPage(WebConstants.maxRowPerPage);
		bean.setTotalRow((int)saleDao.getSaleListCount());
		return bean;
	}

	
}
