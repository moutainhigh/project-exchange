package com.throne212.fupin.dao;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.User;

public interface BaoSongDao extends BaseDao {

	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status);

}
