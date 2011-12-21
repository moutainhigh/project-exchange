package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.PicCun;

public interface CunBFBiz extends BaseBiz {
	////村帮扶措施
	public PageBean<CuoshiCun> getAllCuoshiCunByCunId(CuoshiCun condition,Long cunId,Integer pageIndex);
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Integer pageIndex);
	public PageBean<CuoshiCun> getAllCuoshiCun(CuoshiCun condition,Long areaId,Long zhenId,Long cunId,Integer pageIndex);
	public CuoshiCun saveOrUpdateCuoshiCun(CuoshiCun cuoshi);
	
	////村帮扶成效
	public PageBean<ChengxiaoCun> getAllChengxiaoCunByCunId(ChengxiaoCun condition,Long cunId,Integer pageIndex);
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Integer pageIndex);
	public PageBean<ChengxiaoCun> getAllChengxiaoCun(ChengxiaoCun condition,Long areaId,Long zhenId,Long cunId,Integer pageIndex);
	public ChengxiaoCun saveOrUpdateChengxiaoCun(ChengxiaoCun chengxiao);
	
	
////村帮扶图片
	public PageBean<PicCun> getAllPicCunByCunId(PicCun condition,Long cunId,Integer pageIndex);
	public PageBean<PicCun> getAllPicCun(PicCun condition,Integer pageIndex);
	public PicCun saveOrUpdatePicCun(PicCun pic);
	public PageBean<PicCun> getAllPicCun(PicCun condition,Long areaId ,Long zhenId, Long cunId, Integer pageIndex);

}
