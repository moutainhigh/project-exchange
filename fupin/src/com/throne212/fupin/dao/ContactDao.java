package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Contact;

public interface ContactDao extends BaseDao {
	
	public PageBean<Contact> getContactOfUser(Contact condition,String userName,Integer pageIndex);

}
