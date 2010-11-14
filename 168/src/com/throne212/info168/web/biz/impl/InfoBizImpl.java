package com.throne212.info168.web.biz.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.info168.web.biz.InfoBiz;
import com.throne212.info168.web.common.PageBean;
import com.throne212.info168.web.common.WebConstants;
import com.throne212.info168.web.dao.InfoDao;
import com.throne212.info168.web.domain.Area;
import com.throne212.info168.web.domain.Info;

public class InfoBizImpl extends BaseBizImpl implements InfoBiz {

	private InfoDao infoDao;

	public InfoDao getInfoDao() {
		return infoDao;
	}

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}

	public PageBean<Info> getInfoByCate(Long cateId, int pageIndex) {
		return infoDao.getInfoByCate(cateId, pageIndex);
	}

	public PageBean<Info> getInfoByCateArea(Long cateId, int pageIndex) {
		Area area = (Area) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		if (area == null) {
			return infoDao.getInfoByCateArea(cateId, null, pageIndex);
		} else {
			return infoDao.getInfoByCateArea(cateId, area.getId(), pageIndex);
		}
	}

	public PageBean<Info> getInfoByCateAreaKeywords(Long cateId, String keywords, int pageIndex) {
		return infoDao.getInfoByCateKeywords(cateId, keywords, pageIndex);
	}

	public PageBean<Info> getInfoByCateKeywords(Long cateId, String keywords, int pageIndex) {
		Area area = (Area) ActionContext.getContext().getSession().get(WebConstants.SESS_CITY);
		if (area == null) {
			return infoDao.getInfoByCateAreaKeywords(cateId, null, keywords, pageIndex);
		} else {
			return infoDao.getInfoByCateAreaKeywords(cateId, area.getId(), keywords, pageIndex);
		}
	}

	public PageBean<Info> getAllInfo(int page) {
		return infoDao.getAllInfo(page);
	}

	public PageBean<Info> getAllUncheckInfo(int pageIndex) {
		return infoDao.getAllUncheckInfo(pageIndex);
	}

	public PageBean<Info> getInfoByKey(String keywords, int pageIndex) {
		return infoDao.getInfoByKey(keywords, pageIndex);
	}
	
	public List<Info> getTop10RecommendInfo(){
		return infoDao.getTop10RecommendInfo();
	}
	
	public List<Info> getTop10NewestInfo(){
		return infoDao.getTop10NewestInfo();
	}
	
	public List<Info> getRelateInfos(Info info){
		if(info == null || info.getId() == null)
			return null;
		return infoDao.getRelateInfos(info.getId());
	}

}
