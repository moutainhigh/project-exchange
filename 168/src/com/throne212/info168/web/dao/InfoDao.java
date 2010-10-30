package com.throne212.info168.web.dao;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.domain.Info;

public interface InfoDao extends BaseDao{
	// 根据栏目找信息
	public PageBean<Info> getInfoByCate(Long cateId, int pageIndex);

	// 根据栏目和地区找信息
	public PageBean<Info> getInfoByCateArea(Long cateId, Long areaId, int pageIndex);

	// 根据栏目和关键字找信息
	public PageBean<Info> getInfoByCateKeywords(Long cateId, String keywords, int pageIndex);

	// 根据栏目和地区和关键字找信息
	public PageBean<Info> getInfoByCateAreaKeywords(Long cateId, Long areaId, String keywords, int pageIndex);
	
	//user info
	public PageBean<Info> getInfoByUser(Long userId, int pageIndex);

}
