package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Zhen;

public interface ZhenDao extends BaseDao {

	public PageBean<Zhen> getAllZhen(Area area,Integer pageIndex);

}
