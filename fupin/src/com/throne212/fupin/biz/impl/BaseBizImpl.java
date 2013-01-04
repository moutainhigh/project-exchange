package com.throne212.fupin.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.throne212.fupin.biz.BaseBiz;
import com.throne212.fupin.dao.BaseDao;

public class BaseBizImpl implements BaseBiz {

	protected BaseDao baseDao;

	protected Logger logger = Logger.getLogger(this.getClass());

	public void saveOrUpdateEntity(Object e) {
		baseDao.saveOrUpdate(e);
	}

	public <T> List<T> getAll(Class<T> clazz) {
		List<T> list = baseDao.getAll(clazz);
		return list == null ? new ArrayList<T>() : list;
	}

	public <T> List<T> getAll(Class<T> clazz, String col, String orderType) {
		List<T> list = baseDao.getAll(clazz, col, orderType);
		return list == null ? new ArrayList<T>() : list;
	}

	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	public <T> T getEntityById(Class<T> clazz, Long id) {
		return baseDao.getEntityById(clazz, id);
	}

	public <T> boolean checkUnique(Class<T> clazz, String colName, Object value) {
		Object obj = baseDao.getEntityByUniqueColumn(clazz, colName, value);
		if (obj == null)
			return true;
		else
			return false;
	}

	public <T> void deleteEntity(Class<T> clazz, Long id) {
		baseDao.deleteById(clazz, id);
	}

	public <T> T getEntityByUnique(Class<T> clazz, String colName, Object value) {
		return baseDao.getEntityByUniqueColumn(clazz, colName, value);
	}
	public <T> long getEntitySum(Class<T> clazz){
		
		return baseDao.getEntitySum(clazz);
	}
	public int loadRecordCount(final String hql, final Object[] cols){
		
		return baseDao.loadRecordCount(hql, cols);
		
	}
	
	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style, int startIndex, int length){
		
		
		
		return baseDao.getAll(clazz, orderBy, style, startIndex, length);
	}
	
	public <T> void merge(T entity){
		
		baseDao.merge(entity);
	}

	public <T> List<T> getAllLike(Class<T> clazz, String colName, String likeValue) {
		return baseDao.getAllLike(clazz,colName,likeValue);
	}

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value) {
		// TODO Auto-generated method stub
		return baseDao.getEntitiesByColumn(clazz, colName, value);
	}
	public <T> List<T> getEntitiesByTwoColumn(Class<T> clazz, String colOneName, Object oneValue,String colTwoName,Object twoValue){
		return baseDao.getEntitiesByTwoColumn(clazz, colOneName, oneValue, colTwoName, twoValue);
	}
	public <T> List<T> getEntitiesSecondColIsNull(Class<T> clazz, String colOneName, Object oneValue,String colTwoName){
		return baseDao.getEntitiesSecondColIsNull(clazz, colOneName, oneValue, colTwoName);
	}
	public <T> List<T> getEntitiesByThreeColumn(Class<T> clazz, String colOneName, Object oneValue,String colTwoName,Object twoValue,String colThreeName,Object threeValue){
		return baseDao.getEntitiesByThreeColumn(clazz, colOneName, oneValue, colTwoName,twoValue, colThreeName,threeValue);
	}
	public <T> List<T> getEntitiesByForeColumn(Class<T> clazz, String colOneName, Object oneValue,String colTwoName,Object twoValue,String colThreeName,Object threeValue,String colFourName,Object fourValue){
		return baseDao.getEntitiesByForeColumn(clazz, colOneName, oneValue, colTwoName,twoValue, colThreeName,threeValue, colFourName,fourValue);
	}
}
