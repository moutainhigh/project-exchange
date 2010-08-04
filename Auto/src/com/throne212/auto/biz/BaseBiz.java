package com.throne212.auto.biz;

import java.util.List;

import com.throne212.auto.domain.MyEntity;

public interface BaseBiz {

	public <T> List<T> getAll(Class<T> clazz);
	public <T> T getEntityById(Class<T> clazz,Long id);
	
	public void saveOrUpdateEntity(MyEntity e);
	
	public <T>  boolean checkUnique(Class<T> clazz,String colName,Object value);
	
	public <T>  void deleteEntity(Class<T> clazz,Long id);
	
}
