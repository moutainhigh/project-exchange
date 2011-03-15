package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Zhen;

public interface FrontBiz extends BaseBiz {
	public PageBean<Family> getAllFamilyByCunId(Long cunId, Integer pageIndex);

	public PageBean<Cun> getAllCunUnderShi(Long shiId, Integer pageIndex);

	public PageBean<Cun> getAllCunUnderArea(Long areaId, Integer pageIndex);

	public PageBean<Cun> getAllCunUnderZhen(Long zhenId, Integer pageIndex);

	// 区县和镇

	public Long getMappingCunSum(Area area);
	public Long getNotMappingCunSum(Area area);
	public Long getMappingFamilySum(Area area);
	public Long getNotMappingFamilySum(Area area);
	
	public Long getOrgSumInZhen(Zhen z);
	
	public Long getMappingCunSum(Zhen area);
	public Long getNotMappingCunSum(Zhen area);
	public Long getMappingFamilySum(Zhen area);
	public Long getNotMappingFamilySum(Zhen area);
	
	public Long getOrgSumInCun(Cun c);
}
