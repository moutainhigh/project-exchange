package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;

public interface BaoSongBiz extends BaseBiz {

	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status);
	
	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status, Long orgId);
	
}
