package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;

public interface FamilyDao extends BaseDao {
	
	//户帮扶措施
	public PageBean<CuoshiFamily> getAllCuoshiFamilyByCunId(CuoshiFamily condition,Long cunId,Integer pageIndex);
	public PageBean<CuoshiFamily> getAllCuoshiFamily(CuoshiFamily condition,Integer pageIndex);
	//户帮扶成效
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByCunId(ChengxiaoFamily condition,Long cunId,Integer pageIndex);
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamily(ChengxiaoFamily condition,Integer pageIndex);
	
	//贫困原因
	public PageBean<Reason> getAllReasonByCunId(Reason condition,Long cunId,Integer pageIndex);
	public PageBean<Reason> getAllReason(Reason condition,Integer pageIndex);
	
	//村图片管理
	public PageBean<PicFamily> getAllPicFamilyByCunId(PicFamily condition,Long CunId,Integer pageIndex);
	public PageBean<PicFamily> getAllPicFamily(PicFamily condition,Integer pageIndex);

}
