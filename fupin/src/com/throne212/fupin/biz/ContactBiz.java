package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;

public interface ContactBiz extends BaseBiz {
	
	public List<ContactGroup> getAllContactTree();
	
	public PageBean getContactOfUser(Contact condition,String userName,Integer pageIndex);
	
	
	public Contact saveContact(String loginName,Long groupId,Contact contact);
	
	public List<Contact> getContactsInGroup(Long gId);

}
