package com.throne212.fupin.biz.impl;

import com.throne212.fupin.biz.BaoSongBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.BaoSongDao;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

public class BaoSongBizImpl extends BaseBizImpl implements BaoSongBiz {

	private BaoSongDao baoSongDao;

	public BaoSongDao getBaoSongDao() {
		return baoSongDao;
	}

	public void setBaoSongDao(BaoSongDao baoSongDao) {
		this.baoSongDao = baoSongDao;
	}

	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status) {
		return baoSongDao.getBaoSongList(pageIndex, user, status);
	}
	
	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status, Long orgId) {
		return baoSongDao.getBaoSongList(pageIndex, user, status, orgId);
	}

}
