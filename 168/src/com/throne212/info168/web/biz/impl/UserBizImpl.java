package com.throne212.info168.web.biz.impl;

import java.util.Date;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.UserBiz;
import com.throne212.info168.web.common.EncryptUtil;
import com.throne212.info168.web.common.GenHtmlFacade;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.dao.InfoDao;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Info;
import com.throne212.info168.web.domain.User;

public class UserBizImpl extends BaseBizImpl implements UserBiz {

	private InfoDao infoDao;

	public User login(String username, String pwd) {
		User user = baseDao.getEntityByUniqueColumn(User.class, "loginName", username);
		if (user == null) {
			logger.info("登录失败，用户名不存在:" + username);
			return null;
		}
		if (pwd.equals(user.getPassword()) || EncryptUtil.md5Encode(pwd).equals(user.getPassword())) {
			logger.info("登录成功：" + username);
			return user;
		} else {
			logger.info("登录失败，密码错误:" + username + ":" + pwd);
			return null;
		}
	}

	public User regUser(User user, Long topArea) {
		user.setPassword(EncryptUtil.md5Encode(user.getPassword()));// 密码加密
		// 如果用户没有选择城市，则用省份
		if (user.getArea() == null || user.getArea().getId() == null) {
			if (topArea != null) {
				Area top = baseDao.getEntityById(Area.class, topArea);
				user.setArea(top);
			}
		}
		baseDao.saveOrUpdate(user);
		return user;
	}

	public boolean changePwd(User user, String pwd) {
		user.setPassword(EncryptUtil.md5Encode(pwd));
		baseDao.saveOrUpdate(user);
		return true;
	}

	public boolean publishInfo(Info info) {
		info.setPublishDate(new Date());
		info.setIsChecked(false);
		baseDao.saveOrUpdate(info);
		//GenHtmlFacade.getInstance().gen(info);
		return true;
	}

	public PageBean<Info> getInfos(Integer page) {
		if (page == null || page < 1)
			page = 1;
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		return infoDao.getInfoByUser(user.getId(), page);
	}

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

}
