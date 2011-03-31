package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Zixun;

public interface ZixunDao extends BaseDao{
	
	public PageBean<Zixun> getAllZixun(Integer pageIndex);

}
