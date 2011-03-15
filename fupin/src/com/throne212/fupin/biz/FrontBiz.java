package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;

public interface FrontBiz extends BaseBiz {
	public PageBean<Family> getAllFamilyByCunId(Long cunId,Integer pageIndex);
	
	public PageBean<Cun> getAllCunUnderShi(Long shiId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderArea(Long areaId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderZhen(Long zhenId,Integer pageIndex);
	
}
