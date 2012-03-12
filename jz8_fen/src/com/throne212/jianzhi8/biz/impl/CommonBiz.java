package com.throne212.jianzhi8.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.throne212.jianzhi8.dao.ContentDAO;
import com.throne212.jianzhi8.dao.RegionDAO;
import com.throne212.jianzhi8.dao.TypeDAO;
import com.throne212.jianzhi8.dao.UserDAO;

@Service("commonBiz")
@Transactional
public class CommonBiz {
	
	private TypeDAO typeDAO;
	private UserDAO userDAO;
	private RegionDAO regionDAO;
	private ContentDAO contentDAO;

	@Autowired
	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}
	
	@Autowired
	public void setRegionDAO(RegionDAO regionDAO) {
		this.regionDAO = regionDAO;
	}
	
	@Autowired
	public void setContentDAO(ContentDAO contentDAO) {
		this.contentDAO = contentDAO;
	}
	
	@Autowired
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public UserDAO getUserDAO() {
		return userDAO;
	}

	public RegionDAO getRegionDAO() {
		return regionDAO;
	}

	public ContentDAO getContentDAO() {
		return contentDAO;
	}
	
}
