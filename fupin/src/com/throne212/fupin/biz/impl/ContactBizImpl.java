package com.throne212.fupin.biz.impl;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.ContactBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.ContactDao;
import com.throne212.fupin.dao.ContactGroupDao;
import com.throne212.fupin.domain.Contact;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.User;

public class ContactBizImpl extends BaseBizImpl implements ContactBiz {
	private ContactDao contactDao;
	private ContactGroupDao groupDao;

	public PageBean getContactOfUser(Contact condition, String userName, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return contactDao.getContactOfUser(condition, userName, pageIndex);
	}

	public Contact saveContact(String loginName, Long groupId, Contact contact) {

		if (contact.getId() == null) {
			contact.setCreateDate(new Date());
			contact.setOwner(loginName);
			if (groupId!=null) {
				ContactGroup contactGroup=baseDao.getEntityById(ContactGroup.class, groupId);
			    contact.setGroup(contactGroup);
			} 
			
			baseDao.saveOrUpdate(contact);
			
			logger.info("添加通讯人【" + contact.getContactName() + "】成功");
		} else {
			Contact contactInDB = baseDao.getEntityById(Contact.class, contact.getId());
			String oldName=contactInDB.getContactName();
			
			
			contactInDB.setContactName(contact.getContactName());
			contactInDB.setOrgName(contact.getOrgName());
			contactInDB.setDuty(contact.getDuty());
			contactInDB.setTelNo(contact.getTelNo());
			baseDao.saveOrUpdate(contactInDB);
			contact=contactInDB;
			logger.info("更新通讯人【" + oldName+ "】成功");
		}
		return contact;
	
	}
	
	
	public List<ContactGroup> getAllContactTree(){
		User user = (User) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		return groupDao.getAllContactTree(user.getLoginName());
	}

	public ContactDao getContactDao() {
		return contactDao;
	}

	public void setContactDao(ContactDao contactDao) {
		this.contactDao = contactDao;
	}

	public ContactGroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(ContactGroupDao groupDao) {
		this.groupDao = groupDao;
	}

}
