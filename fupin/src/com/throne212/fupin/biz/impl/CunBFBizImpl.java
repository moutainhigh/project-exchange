package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.CunBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.CunDao;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.PicCun;

public class CunBFBizImpl extends BaseBizImpl implements CunBFBiz {
	private CunDao cunDao;
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllChengxiaoCun(condition,pageIndex);
		
	}

	public PageBean<ChengxiaoCun> getAllChengxiaoCunByCunId(ChengxiaoCun condition, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllChengxiaoCunByCunId(condition,cunId, pageIndex);
	}

	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllCuoshiCun(condition,pageIndex);
	}

	public PageBean<CuoshiCun> getAllCuoshiCunByCunId(CuoshiCun condition, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllCuoshiCunByCunId(condition,cunId, pageIndex);
	}

	public PageBean<PicCun> getAllPicCun(PicCun condition, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllPicCun(condition,pageIndex);
	}

	public PageBean<PicCun> getAllPicCunByCunId(PicCun condition, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllPicCunByCunId(condition,cunId, pageIndex);
	}

	public ChengxiaoCun saveOrUpdateChengxiaoCun(ChengxiaoCun chengxiao) {
		if (chengxiao.getId() == null) {
			chengxiao.setCreateDate(new Date());
			cunDao.saveOrUpdate(chengxiao);
			logger.info("添加成功");
		} else {
			cunDao.saveOrUpdate(chengxiao);
			logger.info("更新成功");
		}
		return chengxiao;
	}

	public CuoshiCun saveOrUpdateCuoshiCun(CuoshiCun cuoshi) {
		if (cuoshi.getId() == null) {
			cuoshi.setCreateDate(new Date());
			cunDao.saveOrUpdate(cuoshi);
			logger.info("添加成功");
		} else {
			cunDao.saveOrUpdate(cuoshi);
			logger.info("更新成功");
		}
		return cuoshi;
	}

	public PicCun saveOrUpdatePicCun(PicCun pic) {
		if (pic.getId() == null) {
			pic.setCreateDate(new Date());
			cunDao.saveOrUpdate(pic);
			logger.info("上传成功");
		} else {
			cunDao.saveOrUpdate(pic);
			logger.info("更新成功");
		}
		return pic;
	}

	public CunDao getCunDao() {
		return cunDao;
	}

	public void setCunDao(CunDao cunDao) {
		this.cunDao = cunDao;
	}
	
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Long areaId, Long zhenId,Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllCuoshiCun(condition,areaId,zhenId,cunId, pageIndex);
	}

	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Long areaId,Long zhenId,Long cunId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllChengxiaoCun(condition,areaId,zhenId,cunId, pageIndex);
	}
	
	public PageBean<PicCun> getAllPicCun(PicCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return cunDao.getAllPicCun(condition,areaId,zhenId,cunId, pageIndex);
	}
}
