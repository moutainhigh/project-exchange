package com.throne212.fupin.biz;

import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.User;

public interface StatBiz extends BaseBiz {

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Long cunId,Long zhenId,Long areaId,Integer pageIndex);
	
	public String exportFamilyTypeByUser(User user, Long cunId,Long zhenId,Long areaId,Integer pageIndex) throws Exception;

}
