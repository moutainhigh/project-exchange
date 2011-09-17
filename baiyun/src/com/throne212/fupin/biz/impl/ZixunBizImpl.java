package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.ZixunBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ZixunDao;
import com.throne212.fupin.domain.Zixun;

public class ZixunBizImpl extends BaseBizImpl implements ZixunBiz {
	
	private ZixunDao zixunDao;
	public ZixunDao getZixunDao() {
		return zixunDao;
	}
	public void setZixunDao(ZixunDao zixunDao) {
		this.zixunDao = zixunDao;
	}

	public boolean deleteZixun(Long[] ids) {
		if(ids==null || ids.length<1)
			return false;
		for(Long id : ids){
			zixunDao.deleteById(Zixun.class, id);
		}
		return true;
	}

	public Zixun passZixun(Long id, boolean passOrNot) {
		Zixun z = zixunDao.getEntityById(Zixun.class, id);
		if(z==null)
			return null;
		z.setPass(passOrNot);
		zixunDao.saveOrUpdate(z);
		return z;
	}

	public Zixun publicZixun(Zixun z) {
		zixunDao.saveOrUpdate(z);
		return z;
	}

	public Zixun replyZixun(Long id,String reply) {
		Zixun z = zixunDao.getEntityById(Zixun.class, id);
		if(z==null)
			return null;
		z.setReply(reply);
		z.setReplyDate(new Date());
		return z;
	}
	
	public PageBean<Zixun> getAllZixun(Integer pageIndex){
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return zixunDao.getAllZixun(pageIndex);
	}
	public PageBean<Zixun> getAllZixunPass(Integer pageIndex) {
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return zixunDao.getAllZixunByPass(pageIndex,true);
	}

}
