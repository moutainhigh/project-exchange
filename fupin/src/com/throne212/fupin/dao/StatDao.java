package com.throne212.fupin.dao;

import com.throne212.fupin.common.FamilyTypeStatDO;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.User;

public interface StatDao extends BaseDao {

	public PageBean<FamilyTypeStatDO> getFamilyTypeByUser(User user, Integer pageIndex);
}
