package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Zhen;




public interface ZhenBFBiz extends BaseBiz {
	
	public List getShiAndAreaAccounts();
	
	public PageBean<Zhen> getAllZhen(Long areaId,Integer pageIndex);
	
}
