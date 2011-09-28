package com.throne212.jianzhi8.biz;

import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.domain.Content;

public interface ViewBiz {

	public Content getContentByNo(int ctNo);
	
	//增加查看次数
	public void addLoonum(int ctNo);
	
	//获取列表数据
	public PageBean<ContentDO> listContent(String kind, String ctClass, String cityCode, String typeId, int pageIndex);
	
	//获取实习列表
	public PageBean<ContentDO> listShixiContent(String cityCode, int pageIndex);
	
	//全局搜索
	public PageBean<ContentDO> searchContent(String key, String cityCode,int pageIndex, String kind);
	
	//获取已经验证的招聘信息
	public PageBean<ContentDO> listYzContent(String ctClass, String cityCode, String typeId, int pageIndex);
	
}
