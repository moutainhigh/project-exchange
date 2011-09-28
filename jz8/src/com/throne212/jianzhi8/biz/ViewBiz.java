package com.throne212.jianzhi8.biz;

import com.throne212.jianzhi8.common.PageBean;
import com.throne212.jianzhi8.dataobject.ContentDO;
import com.throne212.jianzhi8.domain.Content;

public interface ViewBiz {

	public Content getContentByNo(int ctNo);
	
	//���Ӳ鿴����
	public void addLoonum(int ctNo);
	
	//��ȡ�б�����
	public PageBean<ContentDO> listContent(String kind, String ctClass, String cityCode, String typeId, int pageIndex);
	
	//��ȡʵϰ�б�
	public PageBean<ContentDO> listShixiContent(String cityCode, int pageIndex);
	
	//ȫ������
	public PageBean<ContentDO> searchContent(String key, String cityCode,int pageIndex, String kind);
	
	//��ȡ�Ѿ���֤����Ƹ��Ϣ
	public PageBean<ContentDO> listYzContent(String ctClass, String cityCode, String typeId, int pageIndex);
	
}
