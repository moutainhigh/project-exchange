package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Record;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public interface FrontDao extends BaseDao {
	//根据cunId获取所有贫困户
	public PageBean<Family> getAllFamilyByCunId(Long cunId,Integer pageIndex);
	//根据familyId获取所有帮扶记录
	public PageBean<Record> getAllRecordByFamilyId(Long familyId,Integer pageIndex);
	
	//获取所有村列表
	public PageBean<Cun> getAllCunUnderShi(Long shiId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderArea(Long areaId,Integer pageIndex);
	public PageBean<Cun> getAllCunUnderZhen(Long zhenId,Integer pageIndex);
	
	public Long getMappingCunSum(Shi shi);
	public Long getNotMappingCunSum(Shi shi);
	public Long getMappingFamilySum(Shi shi);
	public Long getNotMappingFamilySum(Shi shi);
	public Long getOrgSumInArea(Area z);

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
