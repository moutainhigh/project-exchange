package com.throne212.saishi.dao;

import java.util.Date;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.Music;

public interface MusicDao extends BaseDao {
	public PageBean<Music> getMusicList(Music condition,Date fromDate,Date toDate,int page,String orderBy,String orderType,int pageSize);


}
