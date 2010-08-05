package com.throne212.auto.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.throne212.auto.biz.BaseBiz;
import com.throne212.auto.dao.BaseDao;
import com.throne212.auto.domain.MyEntity;

public class BaseBizImpl implements BaseBiz {

	protected BaseDao baseDao;

	protected Logger logger = Logger.getLogger(this.getClass());
	
	public void saveOrUpdateEntity(MyEntity e){
		baseDao.saveOrUpdate(e);
	}

	public <T> List<T> getAll(Class<T> clazz) {
		List<T> list = baseDao.getAll(clazz);
		return list == null ? new ArrayList<T>() : list;
	}
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	public <T> T getEntityById(Class<T> clazz,Long id){
		return baseDao.getEntityById(clazz, id);
	}
	
	public <T>  boolean checkUnique(Class<T> clazz,String colName,Object value){
		Object obj = baseDao.getEntityByUniqueColumn(clazz, colName, value);
		if(obj == null)
			return true;
		else
			return false;
	}
	public <T>  void deleteEntity(Class<T> clazz,Long id){
		baseDao.deleteById(clazz, id);
	}
}
