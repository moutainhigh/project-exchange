package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Zhen;

public interface ManagerDao extends BaseDao {

	public PageBean getAllManager(Integer pageIndex);
	
	public PageBean getAllManager(String name,Integer pageIndex);
	
	public PageBean getAllCun(Integer pageIndex);
	
	public PageBean getAllCun(Zhen zhen,Integer pageIndex);
	
	public PageBean getAllCun(String name,Integer pageIndex);
	
	//贫困户
	public PageBean getAllFamily(Integer pageIndex);
	
	public PageBean getAllFamily(String name,Integer pageIndex);
	
	public PageBean getAllFamily(Org org, Integer pageIndex);
	public PageBean getAllFamily(Org org,String name,Integer pageIndex);
	
	//干部
	public PageBean getAllLeader(Long orgId,Integer pageIndex);
	
	public PageBean getAllLeader(Long orgId,String name,Integer pageIndex);
	
	public Cun getCunByAreaAndName(Area area,String name);
	public Cun getCunByAreaZhenAndName(Area area, Zhen zhen,String name);
}
