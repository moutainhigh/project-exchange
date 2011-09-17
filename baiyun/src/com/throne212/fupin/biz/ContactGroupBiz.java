package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ContactGroup;

public interface ContactGroupBiz extends BaseBiz {
	
	public PageBean getGroupOfUser(String queryKey,String userName,Integer pageIndex);
	
	
	public ContactGroup saveGroup(String loginName,Long parentGroupId,ContactGroup group);

}
