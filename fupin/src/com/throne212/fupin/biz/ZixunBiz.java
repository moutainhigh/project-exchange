package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Zixun;

public interface ZixunBiz extends BaseBiz{
	
	public Zixun publicZixun(Zixun zixun);
	
	public boolean deleteZixun(Long[] ids);
	
	public Zixun passZixun(Long id, boolean passOrNot);
	
	public Zixun replyZixun(Long id, String reply);
	
	public PageBean<Zixun> getAllZixun(Integer pageIndex);
	public PageBean<Zixun> getAllZixunPass(Integer pageIndex);

}
