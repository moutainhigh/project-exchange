package com.throne212.tui5.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.BaseBiz;
import com.throne212.tui5.dao.BaseDao;

@Service("baseBiz")
public class BaseBizImpl implements BaseBiz {

	@Autowired
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

	public <T> T getEntityById(Class<T> clazz, Object id) {
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

	public <T> long getEntitySum(Class<T> clazz) {

		return baseDao.getEntitySum(clazz);
	}

	public int loadRecordCount(final String hql, final Object[] cols) {

		return baseDao.loadRecordCount(hql, cols);

	}

	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style, int startIndex, int length) {

		return baseDao.getAll(clazz, orderBy, style, startIndex, length);
	}

	public <T> void merge(T entity) {

		baseDao.merge(entity);
	}

	public <T> List<T> getAllLike(Class<T> clazz, String colName, String likeValue) {
		return baseDao.getAllLike(clazz, colName, likeValue);
	}

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value) {
		return baseDao.getEntitiesByColumn(clazz, colName, value);
	}

	public <T> List<T> getEntitiesByTwoColumn(Class<T> clazz, String colOneName, Object oneValue, String colTwoName, Object twoValue) {
		return baseDao.getEntitiesByTwoColumn(clazz, colOneName, oneValue, colTwoName, twoValue);
	}

	public <T> List<T> getEntitiesSecondColIsNull(Class<T> clazz, String colOneName, Object oneValue, String colTwoName) {
		return baseDao.getEntitiesSecondColIsNull(clazz, colOneName, oneValue, colTwoName);
	}
	
	public Long getEntityCountByColumn(Class clazz, String colName, Object value){
		return baseDao.getEntityCountByColumn(clazz, colName, value);
	}
	
	public Long getEntityCountByTwoColumn(Class clazz, String colName, Object value, String colName2, Object value2){
		return baseDao.getEntityCountByTwoColumn(clazz, colName, value, colName2, value2);
	}
	
	public Long getEntityCountByThreeColumn(Class clazz, String colName, Object value, String colName2, Object value2, String colName3, Object value3){
		return baseDao.getEntityCountByThreeColumn(clazz, colName, value, colName2, value2, colName3, value3);
	}
	
	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value, String orderCol, String orderType){
		return baseDao.getEntitiesByColumn(clazz, colName, value, orderCol, orderType);
	}
	
}
