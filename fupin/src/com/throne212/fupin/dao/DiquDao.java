package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;

public interface DiquDao extends BaseDao {

	public PageBean getAllDiqu(Integer pageIndex);

	public PageBean getAllDiqu(String type, Integer pageIndex);

	public PageBean getAllDiquByName(String name, Integer pageIndex);

}
