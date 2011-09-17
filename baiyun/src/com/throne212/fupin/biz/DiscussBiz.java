package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Discuss;
import com.throne212.fupin.domain.User;

public interface DiscussBiz extends BaseBiz {
	
	
	//发表新帖
	public Discuss publishDiscuss(Discuss discuss);
	
	//回复帖子
	public Discuss reply(Long id, String reply,User user);
	//获取所有主题帖
	public PageBean<Discuss> getAllDiscuss(Integer pageIndex);
	
	//删除主题帖
	public Boolean deleteDiscuss(Long[] ids);
	

	//获取某主题帖所有回复帖
	public PageBean<Discuss> getAllReplyOfDiscuss(Integer pageIndex,Long id );
}
