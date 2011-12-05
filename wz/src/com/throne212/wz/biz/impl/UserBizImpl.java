package com.throne212.wz.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.wz.biz.UserBiz;
import com.throne212.wz.dao.UserDAO;
import com.throne212.wz.domain.User;

@Service("userBiz")
@Transactional
public class UserBizImpl implements UserBiz{
	
	private UserDAO userDAO;

	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public User login(String username, String password) {
		List<User> userList = userDAO.findByUserId(username);
		if(userList == null || userList.size() == 0){
			return null;
		}
		User user = userList.get(0);
		if(!password.equals(user.getUserPassword())){
			return null;
		}else
			return user;
	}

	public User reg(User user) {
		List<User> userList = userDAO.findByUserId(user.getUserId());
		if(userList != null && userList.size() > 0){
			return null;
		}
		userList = userDAO.findByUserId(user.getUserEmail());
		if(userList != null && userList.size() > 0){
			return null;
		}
		userDAO.save(user);
		return user;
	}
	
	public boolean changePwd(String userId, String oldPwd, String newPwd) {
		List<User> userList = userDAO.findByUserId(userId);
		if(userList != null && userList.size() > 0){
			User user = userList.get(0);
			if (user.getUserPassword().equals(oldPwd)) {
				user.setUserPassword(newPwd);
				userDAO.save(user);
				return true;
			}
		}
		return false;
	}
	public User changeUserInfo(String userId, String nickName, String email, String qq, String tel) {
		List<User> userList = userDAO.findByUserId(userId);
		if(userList != null && userList.size() > 0){
			User user = userList.get(0);
			user.setUserEmail(email);
			user.setUserQq(qq);
			user.setUserPhone(tel);
			user.setUserName(nickName);
			userDAO.save(user);
			return user;
		}
		return null;
	}
}
