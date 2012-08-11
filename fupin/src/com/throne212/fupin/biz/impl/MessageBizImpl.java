package com.throne212.fupin.biz.impl;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.throne212.fupin.biz.MessageBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.dao.MessageDao;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.BatchSMS;
import com.throne212.fupin.domain.Message;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.SMS;
import com.throne212.fupin.domain.ShiWorkOrg;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class MessageBizImpl extends BaseBizImpl implements MessageBiz {
	private MessageDao messageDao;
	
	
	public PageBean<SMS> getAllSMS(Integer pageIndex,String loginName){
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return messageDao.getAllSMS(pageIndex, loginName);
	}
	public boolean sendSMS(String tel,String content){
		return false;
	}
	
	public PageBean<Message> getAllMessageToUser(Integer pageIndex,
			String loginName) {
		if(pageIndex==null || pageIndex<1)
			pageIndex = 1;
		return messageDao.getAllMessageToUser(pageIndex, loginName);
	}
	public MessageDao getMessageDao() {
		return messageDao;
	}
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}
	public boolean deleteMessage(Long[] ids) {
		if(ids==null || ids.length<1)
			return false;
		for(Long id : ids){
			messageDao.deleteById(Message.class, id);
		}
		return true;
	}
	
	public Map<String,String> getUserTreeList(){
		Map<String,String> map = new TreeMap<String, String>();
		List<ShiWorkOrg> shiList = messageDao.getAll(ShiWorkOrg.class);
		int i = 0;
		map.put(get3Num(i++)+"-0-", "广州市");
		for(ShiWorkOrg shi : shiList){
			map.put(get3Num(i++)+"-1-"+shi.getId(), "--"+shi.getOrgName());//添加市用户数据
			List<AreaWorkOrg> areaList = messageDao.getAll(AreaWorkOrg.class);
			for(AreaWorkOrg area : areaList){
				map.put(get3Num(i++)+"-2-"+area.getId(), "--"+area.getOrgName());//添加区县用户数据
				//驻扎镇得工作组
				WorkTeam team = messageDao.getEntityByUniqueColumn(WorkTeam.class, "area", area.getArea());
				if(team != null)
					map.put(get3Num(i++)+"-3-"+team.getId(), "----"+team.getOrgName());//添加该区的工作组
				//获得直属单位
				List<Org> orgList = messageDao.getEntitiesByColumn(Org.class, "area", area.getArea());
				for(Org org : orgList){
					map.put(get3Num(i++)+"-4-"+org.getId(), "----"+org.getOrgName());//添加直属单位数据
				}
				//获得zhen列表
				List<ZhenWorkOrg> zhenList = messageDao.getEntitiesByColumn(ZhenWorkOrg.class, "zhen.area", area.getArea());
				for(ZhenWorkOrg zhen : zhenList){
					map.put(get3Num(i++)+"-4-"+zhen.getId(), "----"+zhen.getOrgName());//添加镇用户数据
				}
			}
		}
		return map;
	}
	private String get3Num(int i){
		if(i < 10)
			return "00"+i;
		if(i < 100)
			return "0"+i;
		return i+"";
	}
	public Map<String,String> getUserTelTreeList(){
		Map<String,String> map = new TreeMap<String, String>();
		List<ShiWorkOrg> shiList = messageDao.getAll(ShiWorkOrg.class);
		int i = 0;
		map.put(get3Num(i++)+"-0-", "广州市");
		for(ShiWorkOrg shi : shiList){
			map.put(get3Num(i++)+"-1-"+shi.getId(), "--"+shi.getOrgName());//添加市用户数据
			List<AreaWorkOrg> areaList = messageDao.getAll(AreaWorkOrg.class);
			for(AreaWorkOrg area : areaList){
				map.put(get3Num(i++)+"-2-"+area.getId(), "--"+area.getOrgName());//添加区县用户数据
				//驻扎镇得工作组
				WorkTeam team = messageDao.getEntityByUniqueColumn(WorkTeam.class, "area", area.getArea());
				if(team != null)
					map.put(get3Num(i++)+"-3-"+team.getId(), "----"+team.getOrgName());//添加该区的工作组
				//获得直属单位
				List<Org> orgList = messageDao.getEntitiesByColumn(Org.class, "area", area.getArea());
				for(Org org : orgList){
					map.put(get3Num(i++)+"-4-"+org.getId(), "----"+org.getOrgName());//添加直属单位数据
				}
				//获得zhen列表
				List<ZhenWorkOrg> zhenList = messageDao.getEntitiesByColumn(ZhenWorkOrg.class, "zhen.area", area.getArea());
				for(ZhenWorkOrg zhen : zhenList){
					map.put(get3Num(i++)+"-4-"+zhen.getId(), "----"+zhen.getOrgName());//添加镇用户数据
				}
			}
		}
		return map;
	}
	
	public PageBean<BatchSMS> getAllBatchSMS(Integer pageIndex){
		return messageDao.getAllBatchSMS(pageIndex);
	}
}
