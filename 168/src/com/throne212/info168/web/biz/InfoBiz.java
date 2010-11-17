package com.throne212.info168.web.biz;

import java.util.List;

import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Info;

public interface InfoBiz extends BaseBiz {

	// 根据栏目找信息
	public PageBean<Info> getInfoByCate(Long cateId,int pageIndex);

	// 根据栏目和地区找信息
	public PageBean<Info> getInfoByCateArea(Long cateId, int pageIndex);
	public PageBean<Info> getInfoByCateArea(Long cateId, int pageIndex, Area city);

	// 根据栏目和关键字找信息
	public PageBean<Info> getInfoByCateKeywords(Long cateId, String keywords,int pageIndex);

	// 根据栏目和地区和关键字找信息
	public PageBean<Info> getInfoByCateAreaKeywords(Long cateId, String keywords,int pageIndex);
	
	// 根据关键字找信息
	public PageBean<Info> getInfoByKey(String keywords,int pageIndex);

	public List<Info> getTop10RecommendInfo();
	public List<Info> getTop10NewestInfo();
	public List<Info> getRelateInfos(Info info);
	
	//admin
	public PageBean<Info> getAllInfo(int pageIndex);
	public PageBean<Info> getAllUncheckInfo(int pageIndex);
	public Info modifyInfo(Info newInfo);
}
