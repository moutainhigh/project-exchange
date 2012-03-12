package com.throne212.jianzhi8.biz;

import java.util.List;

import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.dataobject.ResumeDO;
import com.throne212.jianzhi8.domain.Content;
import com.throne212.jianzhi8.domain.User;

public interface ViewBiz {

	public Content getContentByNo(int ctNo);
	
	//���Ӳ鿴����
	public void addLoonum(int ctNo);
	public void addResumeLoonum(int ctNo);
	
	//��ȡ�б�����
	public PageBean<ContentDO> listContent(String kind, String ctClass, String cityCode, String typeId, String jobdate,String unitype,boolean yz,String key, int pageIndex);
	public PageBean<ResumeDO> listResume(String cityCode, String typeId, String jobdate, String key, int pageIndex);
	public PageBean<ContentDO> search(String cityCode,String key, int pageIndex);
	
	//fen,index����ְ�б�
	public List<ContentDO> indexZhaopinRegdateListContent(String cityCode);
	public List<ContentDO> indexZhaopinEnddateListContent(String cityCode);
	public List<ContentDO> indexQiuzhiUpdateListContent(String cityCode);
	public List<User> indexRencaiUpdateListContent(String cityCode);
	
}
