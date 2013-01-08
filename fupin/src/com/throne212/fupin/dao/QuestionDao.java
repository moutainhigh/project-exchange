package com.throne212.fupin.dao;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.dataobject.State;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public interface QuestionDao extends BaseDao {
	
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId,Long cunId,Integer pageIndex, int year);
	
	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId,Long cunId,String familyName,Integer pageIndex, int year);
	
	public QuestionStatDO statQuestion1(Long areaId, Long zhenId, int year);
	
	public QuestionStatDO statQuestion2(Long areaId, Long zhenId, Long cunId, int year);
	
	public PageBean<Family> getFamilyList(String familyName, Integer pageIndex, int year);
	
	public List<State> state1(int year);
	
	public List<State> state2(int year);

}
