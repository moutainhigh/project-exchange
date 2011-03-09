package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.AreaWorkOrg;

public interface AreaWorkOrgBiz extends BaseBiz {
	//区县级账号管理
	public PageBean<AreaWorkOrg> getAreaWorkOrgBean(Integer page,Long shiWorkOrgId);
	public AreaWorkOrg saveOrUpdateAreaWorkOrg(AreaWorkOrg areaWorkOrg);

}
