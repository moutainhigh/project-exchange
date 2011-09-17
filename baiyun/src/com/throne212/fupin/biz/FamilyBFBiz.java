package com.throne212.fupin.biz;

import java.util.Date;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ChengxiaoFamily;
import com.throne212.fupin.domain.CuoshiFamily;
import com.throne212.fupin.domain.PicFamily;
import com.throne212.fupin.domain.Reason;
import com.throne212.fupin.domain.Record;

public interface FamilyBFBiz extends BaseBiz {
	//户帮扶措施
	public PageBean<CuoshiFamily> getAllCuoshiFamilyByCunId(CuoshiFamily condition,Long cunId,Integer pageIndex);
	public PageBean<CuoshiFamily> getAllCuoshiFamily(CuoshiFamily condition,Integer pageIndex);
	public CuoshiFamily saveOrUpdateCuoshiFamily(CuoshiFamily cuoshi);
	
	////户帮扶成效
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByCunId(ChengxiaoFamily condition,Long cunId,Integer pageIndex);
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamily(ChengxiaoFamily condition,Integer pageIndex);
	public ChengxiaoFamily saveOrUpdateChengxiaoFamily(ChengxiaoFamily chengxiao);
	
	
////户贫困原因
	public PageBean<Reason> getAllReasonByCunId(Reason condition,Long cunId,Integer pageIndex);
	public PageBean<Reason> getAllReason(Reason condition,Integer pageIndex);
	public Reason saveOrUpdateReason(Reason reason);
	
	//图片
	public PageBean<PicFamily> getAllPicFamilyByCunId(PicFamily condition,Long cunId,Integer pageIndex);
	public PageBean<PicFamily> getAllPicFamily(PicFamily condition,Integer pageIndex);
	public PicFamily saveOrUpdatePicFamily(PicFamily pic);
	
////户帮扶记录
	public PageBean<Record> getAllRecordByCunId(Record condition,Long cunId,Integer pageIndex,Date fromDate,Date toDate);
	public PageBean<Record> getAllRecord(Record condition,Integer pageIndex,Date fromDate,Date toDate);
	public Record saveOrUpdateRecord(Record record);
}
