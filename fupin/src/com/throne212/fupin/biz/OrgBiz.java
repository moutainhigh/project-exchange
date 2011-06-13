package com.throne212.fupin.biz;

import java.util.List;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Zhen;

public interface OrgBiz extends BaseBiz {
	
	public Org saveOrUpdateOrg(Org org);
	
	public PageBean getAllOrg(String name,Integer pageIndex);
	
	public PageBean getAllCun(String name,Integer pageIndex);
	
	public PageBean getAllCun(Zhen zhen,String name,Integer pageIndex);
	
	public List getAllOrg();
	
	public void deleteFamily(Long familyId); 
	
	//贫困户
	public PageBean getAllFamily(String name,Integer pageIndex);
	public PageBean getAllFamily(String name,Integer pageIndex,Long areaId,Long zhenId,Long cunId);
	public PageBean getAllFamily(Org org,String name,Integer pageIndex);
	
	//干部
	public PageBean getAllLeader(Org org,String name,Integer pageIndex);
	public void deleteNonLeaderData();
	
	public String uploadFamilyData(String fileName) throws Exception;
	public String uploadFamilyData2(String fileName) throws Exception;//调查表导入
	public String uploadFamilyData3(String fileName) throws Exception;//模板2导入
	public String uploadCunData(String fileName) throws Exception;
	public String getFamilyExcelDownloadFile(String name) throws Exception;

}
