package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.ContactGroupBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ContactGroupDao;
import com.throne212.fupin.domain.ContactGroup;
import com.throne212.fupin.domain.Diqu;

public class ContactGroupBizImpl extends BaseBizImpl implements ContactGroupBiz {
	private ContactGroupDao groupDao;
	
	public PageBean getGroupOfUser(String queryKey,String userName, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return groupDao.getGroupOfUser(queryKey,userName, pageIndex);
	}

	public ContactGroup saveGroup(String loginName,Long parentGroupId,ContactGroup group) {
		if (group.getId() == null) {
			group.setCreateDate(new Date());
			
			group.setUserName(loginName);
			if (parentGroupId!=null) {
				ContactGroup parentContactGroup=baseDao.getEntityById(ContactGroup.class, parentGroupId);
				parentContactGroup.setIsLeaf(false);
				baseDao.saveOrUpdate(parentContactGroup);
				group.setParentGroup(parentContactGroup);
				
			} 
			
			baseDao.saveOrUpdate(group);
			
			logger.info("添加通讯组【" + group.getGroupName() + "】成功");
		} else {
			ContactGroup contactGroupInDB = baseDao.getEntityById(ContactGroup.class, group.getId());
			String oldName=contactGroupInDB.getGroupName();
			if (parentGroupId!=null) {
				ContactGroup parentContactGroup=baseDao.getEntityById(ContactGroup.class, parentGroupId);
				parentContactGroup.setIsLeaf(false);
				baseDao.saveOrUpdate(parentContactGroup);
				contactGroupInDB.setParentGroup(parentContactGroup);
			} 
			contactGroupInDB.setGroupName(group.getGroupName());
			baseDao.saveOrUpdate(contactGroupInDB);
			logger.info("更新通讯组【" + oldName+ "】成功");
		}
		return group;
	}

	public ContactGroupDao getGroupDao() {
		return groupDao;
	}

	public void setGroupDao(ContactGroupDao groupDao) {
		this.groupDao = groupDao;
	}

}
