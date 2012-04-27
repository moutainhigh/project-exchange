package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.ShenHeBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.ShenHeDao;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Recheck;
import com.throne212.fupin.domain.Record;

public class ShenHeBizImpl extends BaseBizImpl implements ShenHeBiz {
private ShenHeDao shenHeDao;

	public PageBean<ChengxiaoCun> getAllChengxiaoCunByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllChengxiaoCunByStatus(status,pageIndex);
	}

	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllChengxiaoZhenByStatus(status,pageIndex);
	}

	public PageBean<CuoshiCun> getAllCuoshiCunByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllCuoshiCunByStatus(status,pageIndex);
	}

	public PageBean<CuoshiZhen> getAllCuoshiZhenByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllCuoshiZhenByStatus(status,pageIndex);
	}

	public PageBean<PicCun> getAllPicCunByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllPicCunByStatus(status,pageIndex);
	}

	public PageBean<PicZhen> getAllPicZhenByStatus(String status,Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllPicZhenByStatus(status,pageIndex);
	}



	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByStatus(String status, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllChengxiaoFamilyByStatus(status, pageIndex);
	}

	public PageBean<CuoshiFamily> getAllCuoshiFamilyByStatus(String status, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllCuoshiFamilyByStatus(status, pageIndex);
	}

	public PageBean<PicFamily> getAllPicFamilyByStatus(String status, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllPicFamilyByStatus(status, pageIndex);
	}

	public PageBean<Reason> getAllReasonByStatus(String status, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllReasonByStatus(status, pageIndex);
	}

	public PageBean<Record> getAllRecordByStatus(String status, Integer pageIndex) {
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllRecordByStatus(status, pageIndex);
	}

	public ShenHeDao getShenHeDao() {
		return shenHeDao;
	}

	public void setShenHeDao(ShenHeDao shenHeDao) {
		this.shenHeDao = shenHeDao;
	}
	
	public PageBean<Recheck> getAllRecheck(String module,String state,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllRecheck(module, state, pageIndex);
	}
	public PageBean<Recheck> getAllRecheck(Long recordId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllRecheck(recordId, pageIndex);
	}
	public PageBean<Recheck> getAllRecheck(String module, Long recordId,Integer pageIndex){
		if(pageIndex == null || pageIndex < 1)
			pageIndex = 1;
		return shenHeDao.getAllRecheck(module, recordId, pageIndex);
	}

}
