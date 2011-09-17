package com.throne212.fupin.dao;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ContactGroup;

public interface ContactGroupDao extends BaseDao {
	
	public PageBean<ContactGroup> getGroupOfUser(String queryKey,String userName,Integer pageIndex);
	
	public List<ContactGroup> getAllContactTree(String userName);

}
