package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public interface QuestionDao extends BaseDao {
	
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId,Long cunId,Integer pageIndex);
	
	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId,Long cunId,String familyName,Integer pageIndex);

}
