package com.throne212.fupin.biz.impl;

import java.util.Date;

import com.throne212.fupin.biz.FamilyBFBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.FamilyDao;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;

public class FamilyBFBizImpl extends BaseBizImpl implements FamilyBFBiz {
private FamilyDao familyDao;
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamily(
			ChengxiaoFamily condition, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllChengxiaoFamily(condition,pageIndex);
		
	}

	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByCunId(
			ChengxiaoFamily condition, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllChengxiaoFamilyByCunId(condition,cunId, pageIndex);
	}

	public PageBean<CuoshiFamily> getAllCuoshiFamily(CuoshiFamily condition,
			Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllCuoshiFamily(condition,pageIndex);
	}

	public PageBean<CuoshiFamily> getAllCuoshiFamilyByCunId(
			CuoshiFamily condition, Long cunId, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllCuoshiFamilyByCunId(condition,cunId, pageIndex);
	}

	public ChengxiaoFamily saveOrUpdateChengxiaoFamily(ChengxiaoFamily chengxiao) {
		if (chengxiao.getId() == null) {
			chengxiao.setCreateDate(new Date());
			familyDao.saveOrUpdate(chengxiao);
			logger.info("添加成功");
		} else {
			familyDao.saveOrUpdate(chengxiao);
			logger.info("更新成功");
		}
		return chengxiao;
	}

	public CuoshiFamily saveOrUpdateCuoshiFamily(CuoshiFamily cuoshi) {
		if (cuoshi.getId() == null) {
			cuoshi.setCreateDate(new Date());
			familyDao.saveOrUpdate(cuoshi);
			logger.info("添加成功");
		} else {
			familyDao.saveOrUpdate(cuoshi);
			logger.info("更新成功");
		}
		return cuoshi;
	}
	
	
	

	public PageBean<Reason> getAllReason(Reason condition, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllReason(condition,pageIndex);
	}

	public PageBean<Reason> getAllReasonByCunId(Reason condition, Long cunId,
			Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllReasonByCunId(condition,cunId, pageIndex);
	}

	public Reason saveOrUpdateReason(Reason reason) {
		if (reason.getId() == null) {
			reason.setCreateDate(new Date());
			familyDao.saveOrUpdate(reason);
			logger.info("添加成功");
		} else {
			familyDao.saveOrUpdate(reason);
			logger.info("更新成功");
		}
		return reason;
	}

	public FamilyDao getFamilyDao() {
		return familyDao;
	}

	public void setFamilyDao(FamilyDao familyDao) {
		this.familyDao = familyDao;
	}
	
	public PageBean<PicFamily> getAllPicFamilyByCunId(PicFamily condition,Long cunId,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllPicFamilyByCunId(condition,cunId, pageIndex);
	}
	
	public PageBean<PicFamily> getAllPicFamily(PicFamily condition,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return familyDao.getAllPicFamily(condition,pageIndex);
	}

	public ChengxiaoCun saveOrUpdateChengxiaoCun(ChengxiaoCun chengxiao) {
		if (chengxiao.getId() == null) {
			chengxiao.setCreateDate(new Date());
			familyDao.saveOrUpdate(chengxiao);
			logger.info("添加成功");
		} else {
			familyDao.saveOrUpdate(chengxiao);
			logger.info("更新成功");
		}
		return chengxiao;
	}

	public CuoshiCun saveOrUpdateCuoshiCun(CuoshiCun cuoshi) {
		if (cuoshi.getId() == null) {
			cuoshi.setCreateDate(new Date());
			familyDao.saveOrUpdate(cuoshi);
			logger.info("添加成功");
		} else {
			familyDao.saveOrUpdate(cuoshi);
			logger.info("更新成功");
		}
		return cuoshi;
	}

	public PicFamily saveOrUpdatePicFamily(PicFamily pic) {
		if (pic.getId() == null) {
			pic.setCreateDate(new Date());
			familyDao.saveOrUpdate(pic);
			logger.info("上传成功");
		} else {
			familyDao.saveOrUpdate(pic);
			logger.info("更新成功");
		}
		return pic;
	}

}
