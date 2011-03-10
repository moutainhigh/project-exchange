package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Zhen;

public interface ZhenDao extends BaseDao {

	public PageBean<Zhen> getAllZhen(Area area,Integer pageIndex);
	
	//镇帮扶措施
	public PageBean<CuoshiZhen> getAllCuoshiZhenByZhenId(CuoshiZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<CuoshiZhen> getAllCuoshiZhen(CuoshiZhen condition,Integer pageIndex);

	//镇帮扶成效
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByZhenId(ChengxiaoZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhen(ChengxiaoZhen condition,Integer pageIndex);
	
	//镇图片管理
	public PageBean<PicZhen> getAllPicZhenByZhenId(PicZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<PicZhen> getAllPicZhen(PicZhen condition,Integer pageIndex);
	
}
