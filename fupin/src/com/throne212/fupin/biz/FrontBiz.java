package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Record;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public interface FrontBiz extends BaseBiz {
	public PageBean<Family> getAllFamilyByCunId(Long cunId, Integer pageIndex);
	public PageBean<Record> getAllRecordByFamilyId(Long familyId,Integer pageIndex);

	public PageBean<Cun> getAllCunUnderShi(Long shiId, Integer pageIndex);

	public PageBean<Cun> getAllCunUnderArea(Long areaId, Integer pageIndex);

	public PageBean<Cun> getAllCunUnderZhen(Long zhenId, Integer pageIndex);

	public Long getMappingCunSum(Shi shi);
	public Long getNotMappingCunSum(Shi shi);
	public Long getMappingFamilySum(Shi shi);
	public Long getNotMappingFamilySum(Shi shi);
	public Long getOrgSumInArea(Area z);
	
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
	
	//获取只有贫困村的区县
	public List<Area> getAreaWithPoor();
	public List<Zhen> getZhenWithPoor(Area area);
	public List<Cun> getCunWithPoor(Zhen zhen);
	public List<Cun> getCunWithPoor();
}
