package com.throne212.tg.web.dao;

import java.util.Collection;
import java.util.List;

public interface BaseDao {

	public <T> List<T> getAll(Class<T> clazz);
	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style);
	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style, int startIndex, int length);
	public <T> long getEntitySum(Class<T> clazz);
	public <T> long getEntitySumByColValue(Class<T> clazz,String col,String value);
	public <T> long getEntitySumByColsValue(Class<T> clazz,String colOne,String colTwo, String value);

	public <T> T getEntityById(Class<T> clazz, Long id);

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Long[] ids);
	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids);
	
	public <T> T getEntityByUniqueColumn(Class<T> clazz, String colName, Object value);

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value);
	
	public <T> List<T> getEntitiesOrderByColumns(Class<T> clazz,String orderType, String... colNames);

	public <T> void saveOrUpdate(T entity);

	public <T> void merge(T entity);
	
	public <T> void delete(T entity);

	public <T> void deleteById(Class<T> clazz, Long id);
	
	public void clear();
	public void fluch();
	public void commit();
	
	public int loadRecordCount(final String hql, final Object[] cols);
	
}
