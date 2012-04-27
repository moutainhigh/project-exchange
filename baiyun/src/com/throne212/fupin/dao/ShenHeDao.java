package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
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

public interface ShenHeDao extends BaseDao {
	//镇审核
	public PageBean<CuoshiZhen> getAllCuoshiZhenByStatus(String status,Integer pageIndex);
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByStatus(String status,Integer pageIndex);
	public PageBean<PicZhen> getAllPicZhenByStatus(String status,Integer pageIndex);
	//村审核
	public PageBean<CuoshiCun> getAllCuoshiCunByStatus(String status,Integer pageIndex);
	public PageBean<ChengxiaoCun> getAllChengxiaoCunByStatus(String status,Integer pageIndex);
	public PageBean<PicCun> getAllPicCunByStatus(String status,Integer pageIndex);
	
	//户审核
	public PageBean<CuoshiFamily> getAllCuoshiFamilyByStatus(String status,Integer pageIndex);
	public PageBean<ChengxiaoFamily> getAllChengxiaoFamilyByStatus(String status,Integer pageIndex);
	public PageBean<PicFamily> getAllPicFamilyByStatus(String status,Integer pageIndex);
	public PageBean<Reason> getAllReasonByStatus(String status,Integer pageIndex);
	public PageBean<Record> getAllRecordByStatus(String status,Integer pageIndex);
	
	//重审
	public PageBean<Recheck> getAllRecheck(String module,String state,Integer pageIndex);
	public PageBean<Recheck> getAllRecheck(Long recordId,Integer pageIndex);
	public PageBean<Recheck> getAllRecheck(String module, Long recordId,Integer pageIndex);
	
}
