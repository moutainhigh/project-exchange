package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.DiscussBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.DiscussDao;
import com.throne212.fupin.domain.Discuss;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.Zixun;

public class DiscussBizImpl extends BaseBizImpl implements DiscussBiz {
	private DiscussDao discussDao;

	public DiscussDao getDiscussDao() {
		return discussDao;
	}

	public void setDiscussDao(DiscussDao discussDao) {
		this.discussDao = discussDao;
	}

	public PageBean<Discuss> getAllDiscuss(Integer pageIndex) {
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return discussDao.getAllDiscuss(pageIndex);
	}

	public Discuss publishDiscuss(Discuss discuss) {
		discussDao.saveOrUpdate(discuss);
		return discuss;
	}

	public Discuss reply(Long id, String reply,User user) {
		Discuss rootDiscuss =discussDao.getEntityById(Discuss.class, id);
		Discuss discuss =new Discuss();
		
		discuss.setPid(id);
		discuss.setContent(reply);
		discuss.setCreateDate(new Date());
		discuss.setRootId(rootDiscuss.getId());
		discuss.setPublisher(user);
		rootDiscuss.setLastReplyDate(new Date());
		discussDao.saveOrUpdate(discuss);
		discussDao.saveOrUpdate(rootDiscuss);
		return discuss;
	}

	public Boolean deleteDiscuss(Long[] ids) {
		if(ids==null || ids.length<1)
			return false;
		for(Long id : ids){
			discussDao.deleteById(Discuss.class, id);
		}
		return true;
	}

	public PageBean<Discuss> getAllReplyOfDiscuss(Integer pageIndex, Long id) {
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return discussDao.getAllReplyOfDiscuss(pageIndex,id);
	}
	
	
	
	

}
