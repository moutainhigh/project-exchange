package com.throne212.info168.web.biz;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.domain.Finance;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public interface UserBiz extends BaseBiz{
	//登录
	public User login(String username,String pwd);
	//注册新用户
	public User regUser(User user, Long topArea);
	//修改密码
	public boolean changePwd(User user, String pwd);
	//发布信息
	public boolean publishInfo(Info info);
	//信息列表
	public PageBean<Info> getInfos(Integer page);
	
	//所有用户列表
	public PageBean<User> getAllUsers(Integer page);
	public PageBean<User> getAllUsers(Integer page,String key);
	public PageBean<Info> getInfosByUser(Integer page,User user);
	
	//去所用户的财务信息
	public PageBean<Finance> getFinanceByUser(Integer page,User user);
	
}
