package com.throne212.fupin.biz.impl;

import java.util.List;

import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.FrontDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.Zhen;

public class FrontBizImpl extends BaseBizImpl implements FrontBiz {
	private FrontDao frontDao;

	
	
	public PageBean<Family> getAllFamilyByCunId(Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllFamilyByCunId(cunId,pageIndex);
	}
	
	public PageBean<Cun> getAllCunUnderArea(Long areaId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderArea(areaId,pageIndex);
	}

	public PageBean<Cun> getAllCunUnderShi(Long shiId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderShi(shiId,pageIndex);
	}

	public PageBean<Cun> getAllCunUnderZhen(Long zhenId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return frontDao.getAllCunUnderZhen(zhenId,pageIndex);
	}

	public FrontDao getFrontDao() {
		return frontDao;
	}

	public void setFrontDao(FrontDao frontDao) {
		this.frontDao = frontDao;
	}

	public Long getMappingCunSum(Shi shi){
		return frontDao.getMappingCunSum(shi);
	}
	public Long getNotMappingCunSum(Shi shi){
		return frontDao.getNotMappingCunSum(shi);
	}
	public Long getMappingFamilySum(Shi shi){
		return frontDao.getMappingFamilySum(shi);
	}
	public Long getNotMappingFamilySum(Shi shi){
		return frontDao.getNotMappingFamilySum(shi);
	}
	public Long getOrgSumInArea(Area z){
		return frontDao.getOrgSumInArea(z);
	}
	
	
	public Long getMappingCunSum(Area area){
		return frontDao.getMappingCunSum(area);
	}
	public Long getNotMappingCunSum(Area area){
		return frontDao.getNotMappingCunSum(area);
	}
	public Long getMappingFamilySum(Area area){
		return frontDao.getMappingFamilySum(area);
	}
	public Long getNotMappingFamilySum(Area area){
		return frontDao.getNotMappingFamilySum(area);
	}
	public Long getOrgSumInZhen(Zhen z){
		return frontDao.getOrgSumInZhen(z);
	}
	
	public Long getMappingCunSum(Zhen zhen){
		return frontDao.getMappingCunSum(zhen);
	}
	public Long getNotMappingCunSum(Zhen zhen){
		return frontDao.getNotMappingCunSum(zhen);
	}
	public Long getMappingFamilySum(Zhen zhen){
		return frontDao.getMappingFamilySum(zhen);
	}
	public Long getNotMappingFamilySum(Zhen zhen){
		return frontDao.getNotMappingFamilySum(zhen);
	}
	
	public Long getOrgSumInCun(Cun c){
		return frontDao.getOrgSumInCun(c);
	}

}
