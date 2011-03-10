package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Org;

public interface OrgBiz extends BaseBiz {
	
	public Org saveOrUpdateOrg(Org org);
	
	public PageBean getAllOrg(String name,Integer pageIndex);
	
	public PageBean getAllCun(String name,Integer pageIndex);
	
	public List getAllOrg();
	
	
	//贫困户
	public PageBean getAllFamily(String name,Integer pageIndex);
	
	//干部
	public PageBean getAllLeader(Org org,String name,Integer pageIndex);

}
