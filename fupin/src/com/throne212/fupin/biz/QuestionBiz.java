package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public interface QuestionBiz extends BaseBiz {

	// 调查表一
	public PageBean<Question1> listQuestion1(Long areaId, Long zhenId, Long cunId, Integer pageIndex);

	public String importQuestion1(String fileName) throws Exception;

	// 调查表二
	public PageBean<Question2> listQuestion2(Long areaId, Long zhenId, Long cunId, String familyName, Integer pageIndex);

	public String importQuestion2(String fileName) throws Exception;

}
