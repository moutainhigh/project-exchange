package com.throne212.tui5.biz;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.Alliance;
import com.throne212.tui5.domain.User;


public interface AllianceBiz extends BaseBiz {

	public PageBean<Alliance> getTaskList(Integer pageIndex, User user);
	
}
