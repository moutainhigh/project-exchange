package com.throne212.siliao.dao;

import java.util.Collection;
import java.util.List;

import com.throne212.siliao.domain.Log;
import com.throne212.siliao.domain.MyEntity;

//通用的基础DAO
public interface BaseDao {

	public <T> List<T> getAll(Class<T> clazz);

	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style);

	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style, int startIndex, int length);

	public <T> long getEntitySum(Class<T> clazz);

	public <T> T getEntityById(Class<T> clazz, Long id);

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Long[] ids);

	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids);

	public <T> T getEntityByUniqueColumn(Class<T> clazz, String colName, Object value);

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value);

	public <T> List<T> getEntitiesOrderByColumns(Class<T> clazz, String orderType, String... colNames);

	public <T> void saveOrUpdate(T entity);

	public <T> void merge(T entity);

	public <T> void delete(T entity);

	public <T> void deleteById(Class<T> clazz, Long id);

	public void clear();

	public void fluch();

	public void commit();

	public int loadRecordCount(final String hql, final Object[] cols);
	
	public <T> List<T> getAllLike(Class<T> clazz,String colName,String likeValue);
	
	public <T extends Log> List<T> getLogList(MyEntity entity,String refName);

}
