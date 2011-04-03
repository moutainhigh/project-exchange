package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Discuss;

public interface DiscussDao extends BaseDao {

	public PageBean<Discuss> getAllDiscuss(Integer pageIndex);
	public PageBean<Discuss> getAllReplyOfDiscuss(Integer pageIndex,Long id );
	
	//public Discuss getDiscussByPid(Long id);
}
