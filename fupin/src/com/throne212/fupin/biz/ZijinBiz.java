package com.throne212.fupin.biz;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Zijin;

public interface ZijinBiz extends BaseBiz {

	public PageBean<Zijin> listZijin(Long areaId, Long zhenId, Long cunId, Integer pageIndex, int type, Integer year, Integer month);


}
