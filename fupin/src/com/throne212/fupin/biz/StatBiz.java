package com.throne212.fupin.biz;

import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.User;

public interface StatBiz extends BaseBiz {

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user,Integer pageIndex);

}
