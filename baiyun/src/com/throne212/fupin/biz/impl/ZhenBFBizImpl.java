package com.throne212.fupin.biz.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.throne212.fupin.biz.ZhenBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ZhenDao;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Shi;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.Zhen;


public class ZhenBFBizImpl extends BaseBizImpl implements ZhenBFBiz {
	
	private ZhenDao zhenDao;
	
	public ZhenDao getZhenDao() {
		return zhenDao;
	}

	public void setZhenDao(ZhenDao zhenDao) {
		this.zhenDao = zhenDao;
	}

	public List getShiAndAreaAccounts(){
		List list = new ArrayList();
		list.addAll(zhenDao.getAll(ShiWorkOrg.class));
		list.addAll(zhenDao.getAll(AreaWorkOrg.class));
		return list;
	}
	public List getShiAndArea(){
		List list = new ArrayList();
		list.addAll(zhenDao.getAll(Shi.class));
		list.addAll(zhenDao.getAll(Area.class));
		return list;
	}
	public List getAllArea(){
		return zhenDao.getAll(Area.class);
	}
	public PageBean<Zhen> getAllZhen(Long areaId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		Area area = null;
		if(areaId != null)
			area = zhenDao.getEntityById(Area.class, areaId);
		return zhenDao.getAllZhen(area,pageIndex);
	}
	public PageBean<CuoshiZhen> getAllCuoshiZhenByZhenId(CuoshiZhen condition,Long zhenId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllCuoshiZhenByZhenId(condition,zhenId, pageIndex);
		
	}
	
	public PageBean<CuoshiZhen> getAllCuoshiZhen(CuoshiZhen condition,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllCuoshiZhen(condition,pageIndex);
		
	}
	
	public CuoshiZhen saveOrUpdateCuoshiZhen(CuoshiZhen cuoshi){
		
		if (cuoshi.getId() == null) {
			cuoshi.setCreateDate(new Date());
			zhenDao.saveOrUpdate(cuoshi);
			logger.info("添加成功");
		} else {
			zhenDao.saveOrUpdate(cuoshi);
			logger.info("更新成功");
		}
		return cuoshi;
	}
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByZhenId(ChengxiaoZhen condition,Long zhenId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllChengxiaoZhenByZhenId(condition,zhenId, pageIndex);
		
	}
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhen(ChengxiaoZhen condition,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllChengxiaoZhen(condition,pageIndex);
		
	}
	
	public ChengxiaoZhen saveOrUpdateChengxiaoZhen(ChengxiaoZhen chengxiao){
		if (chengxiao.getId() == null) {
			chengxiao.setCreateDate(new Date());
			zhenDao.saveOrUpdate(chengxiao);
			logger.info("添加成功");
		} else {
			zhenDao.saveOrUpdate(chengxiao);
			logger.info("更新成功");
		}
		return chengxiao;
		
	}
	
	public PageBean<PicZhen> getAllPicZhenByZhenId(PicZhen condition,Long zhenId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllPicZhenByZhenId(condition,zhenId, pageIndex);
		
	}
	public PageBean<PicZhen> getAllPicZhen(PicZhen condition,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return zhenDao.getAllPicZhen(condition,pageIndex);
	}
	public PicZhen saveOrUpdatePicZhen(PicZhen pic){
		if (pic.getId() == null) {
			pic.setCreateDate(new Date());
			zhenDao.saveOrUpdate(pic);
			logger.info("上传成功");
		} else {
			zhenDao.saveOrUpdate(pic);
			logger.info("更新成功");
		}
		return pic;
		
	}
}
