package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.ChengxiaoZhen;
import com.throne212.fupin.domain.CuoshiZhen;
import com.throne212.fupin.domain.PicZhen;
import com.throne212.fupin.domain.Zhen;




public interface ZhenBFBiz extends BaseBiz {
	
	public List getShiAndAreaAccounts();
	public List getShiAndArea();
	public List getAllArea();
	
	public PageBean<Zhen> getAllZhen(Long areaId,Integer pageIndex);
	//镇帮扶措施
	public PageBean<CuoshiZhen> getAllCuoshiZhenByZhenId(CuoshiZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<CuoshiZhen> getAllCuoshiZhen(CuoshiZhen condition,Integer pageIndex);
	public CuoshiZhen saveOrUpdateCuoshiZhen(CuoshiZhen cuoshi);
	
	////镇帮扶成效
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhenByZhenId(ChengxiaoZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<ChengxiaoZhen> getAllChengxiaoZhen(ChengxiaoZhen condition,Integer pageIndex);
	public ChengxiaoZhen saveOrUpdateChengxiaoZhen(ChengxiaoZhen chengxiao);
	
	
////镇帮扶图片
	public PageBean<PicZhen> getAllPicZhenByZhenId(PicZhen condition,Long zhenId,Integer pageIndex);
	public PageBean<PicZhen> getAllPicZhen(PicZhen condition,Integer pageIndex);
	public PicZhen saveOrUpdatePicZhen(PicZhen pic);
}
