package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ShiWorkOrg;

public interface AdminBiz extends BaseBiz {

	public PageBean<ShiWorkOrg> getShiWorkOrgBean(Integer page);
	
	public ShiWorkOrg saveOrUpdateShiWorkOrg(ShiWorkOrg shiWorkOrg);
	
	
}
