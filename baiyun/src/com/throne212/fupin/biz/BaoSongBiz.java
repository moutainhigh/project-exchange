package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.ChengxiaoCun;
import com.throne212.fupin.domain.CuoshiCun;
import com.throne212.fupin.domain.PicCun;
import com.throne212.fupin.domain.User;

public interface BaoSongBiz extends BaseBiz {

	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status);
	
}
