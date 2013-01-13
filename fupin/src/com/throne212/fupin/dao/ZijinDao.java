package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.domain.Zijin;

public interface ZijinDao extends BaseDao {
	
	public PageBean<Zijin> listZijin(Long areaId, Long zhenId,Long cunId,Integer pageIndex, int type, int year, int month);
	

}
