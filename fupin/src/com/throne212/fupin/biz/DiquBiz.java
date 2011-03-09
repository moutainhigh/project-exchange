package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Diqu;



public interface DiquBiz extends BaseBiz {
	
	public PageBean getAllDiqu(Integer pageIndex);
	
	public PageBean getAllDiqu(String type,Integer pageIndex);
	
	public PageBean getAllDiquByName(String name,Integer pageIndex);
	
	public Diqu saveDiqu(Diqu diqu);
	
}
