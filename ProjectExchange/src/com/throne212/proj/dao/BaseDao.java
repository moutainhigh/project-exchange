package com.throne212.proj.dao;

import java.util.Collection;
import java.util.List;

/**
 * 通用的DAO对象，提供基本的增删查改操作
 * */
public interface BaseDao {

	/* 查询多个 */
	// 简单获取全部
	public <T> List<T> getAll(Class<T> clazz);

	// 排序查询一个实体的全部实例
	public <T> List<T> getAll(Class<T> clazz, String orderBy, String style);

	// 根据多个id获取多个同类型的实体
	public <T> List<T> getEntitiesByIds(Class<T> clazz, Collection<Long> ids);

	// 根据某一个列的名字和值来获取实体
	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value);

	// 根据若干列实现排序
	public <T> List<T> getEntitiesOrderByColumns(Class<T> clazz, String orderType, String... colNames);

	/* 查询单个 */
	// 根据id查询实体
	public <T> T getEntityById(Class<T> clazz, Long id);

	// 根据实体的unique字段查询实体
	public <T> T getEntityByUniqueColumn(Class<T> clazz, String colName, Object value);

	// 保存或更新一个实体
	public <T> void saveOrUpdate(T entity);

	// 合并实体
	public <T> void merge(T entity);

	// 删除实体
	public <T> void delete(T entity);

	public <T> void deleteById(Class<T> clazz, Long id);

	// 通用方法
	public void clear();

	public void fluch();

	public void commit();

	// 动态HQL操作
	public int loadRecordCount(final String hql, final Object[] cols);

}
