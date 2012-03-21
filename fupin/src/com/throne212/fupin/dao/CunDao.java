package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.PicFamily;

public interface CunDao extends BaseDao {
	//村帮扶措施
	public PageBean<CuoshiCun> getAllCuoshiCunByCunId(CuoshiCun condition,Long cunId,Integer pageIndex);
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Integer pageIndex);
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Long areaId,Long zhenId,Long cunId,Integer pageIndex);

	//村帮扶成效
	public PageBean<ChengxiaoCun> getAllChengxiaoCunByCunId(ChengxiaoCun condition,Long cunId,Integer pageIndex);
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Integer pageIndex);
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Long areaId,Long zhenId,Long cunId,Integer pageIndex);
	
	//村图片管理
	public PageBean<PicCun> getAllPicCunByCunId(PicCun condition,Long CunId,Integer pageIndex);
	public PageBean<PicCun> getAllPicCun(PicCun condition,Integer pageIndex);
	public PageBean<PicCun> getAllPicCun(PicCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex);
	
	public Cun getCunByFullName(String fullName);
	
}
