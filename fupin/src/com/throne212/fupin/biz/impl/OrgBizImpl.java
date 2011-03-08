package com.throne212.fupin.biz.impl;


import java.util.Date;

import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.domain.Org;


public class OrgBizImpl extends BaseBizImpl implements OrgBiz {
	public Org saveOrUpdateOrg(Org org){
		
		if (org.getId() == null) {
			org.setCreateDate(new Date());
			baseDao.saveOrUpdate(org);
			logger.info("添加扶贫单位【" + org.getOrgName() + "】成功");
		} else {
			Org orgInDB = baseDao.getEntityById(Org.class, org.getId());
			org.setCreateDate(orgInDB.getCreateDate());
			baseDao.saveOrUpdate(org);
			logger.info("更新扶贫单位【" + org.getOrgName()+ "】成功");
		}
		return org;
		
		
	}
	
	

}
