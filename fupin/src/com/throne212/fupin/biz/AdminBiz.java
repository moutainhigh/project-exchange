package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.ZhenWorkOrg;

public interface AdminBiz extends BaseBiz {
	//市级账号管理
	public PageBean<ShiWorkOrg> getShiWorkOrgBean(Integer page);
	public ShiWorkOrg saveOrUpdateShiWorkOrg(ShiWorkOrg shiWorkOrg);
	//区县级账号管理
	public PageBean<AreaWorkOrg> getAreaWorkOrgBean(Integer page,Long shiWorkOrgId);
	public AreaWorkOrg saveOrUpdateAreaWorkOrg(AreaWorkOrg areaWorkOrg);
	public PageBean<AreaWorkOrg> getAreaWorkOrgBean(Integer page);
	
	
	//镇级账号管理
	public PageBean<ZhenWorkOrg> getZhenWorkOrgBean(Integer page,Long areaWorkOrgId);
	public ZhenWorkOrg saveOrUpdateZhenWorkOrg(ZhenWorkOrg zhenWorkOrg);
	public PageBean<ZhenWorkOrg> getZhenWorkOrgBean(Integer page);
	
}
