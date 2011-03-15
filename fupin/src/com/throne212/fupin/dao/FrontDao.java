package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;

public interface FrontDao extends BaseDao {
	//根据cunId获取所有贫困户
	public PageBean<Family> getAllFamilyByCunId(Long cunId,Integer pageIndex);
	
	//获取所有村列表
	public PageBean<Cun> getAllCunUnderShi(Long shiId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderArea(Long areaId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderZhen(Long zhenId,Integer pageIndex);
	

}
