package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Diqu;



public interface DiquBiz extends BaseBiz {
	
	public PageBean getAllDiqu(String type,String name,Integer pageIndex);
	
	public Diqu saveDiqu(Diqu diqu);
	
}
