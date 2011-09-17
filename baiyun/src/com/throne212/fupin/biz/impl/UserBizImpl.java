package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.UserBiz;
import com.throne212.fupin.common.EncryptUtil;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.User;


public class UserBizImpl extends BaseBizImpl implements UserBiz {
	public User login(String username, String pwd) {
		User user = baseDao.getEntityByUniqueColumn(User.class, "loginName", username);
		if (user == null) {
			user = baseDao.getEntityByUniqueColumn(AreaWorkOrg.class, "loginName2", username);//查找工作队
			if(user == null){
				logger.info("登录失败，用户名不存在:" + username);
				return null;
			}
		}
		if (pwd.equals(user.getPassword()) || EncryptUtil.md5Encode(pwd).equals(user.getPassword()) ) {
			logger.info("登录成功：" + username);
			return user;
		} else {
			if(user instanceof AreaWorkOrg){
				AreaWorkOrg a = (AreaWorkOrg) user;
				if (pwd.equals(a.getPassword2()) || EncryptUtil.md5Encode(pwd).equals(a.getPassword2()) ) {
					logger.info("登录成功：" + username);
					return user;
				}
			}
			logger.info("登录失败，密码错误:" + username + ":" + pwd);
			return null;
		}
	}
	public boolean changePwd(User user, String pwd) {
		user.setPassword(EncryptUtil.md5Encode(pwd));
		baseDao.saveOrUpdate(user);
		return true;
	}
}
