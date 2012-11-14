package com.throne212.tui5.biz;

import java.util.List;

//基础业务类
public interface BaseBiz {

	public <T> List<T> getAll(Class<T> clazz);

	public <T> List<T> getAll(Class<T> clazz, String col, String orderType);

	public <T> T getEntityById(Class<T> clazz, Object id);

	public <T> T getEntityByUnique(Class<T> clazz, String col, Object val);

	public void saveOrUpdateEntity(Object e);

	public <T> boolean checkUnique(Class<T> clazz, String colName, Object value);

	public <T> void deleteEntity(Class<T> clazz, Long id);

	public <T> List<T> getAllLike(Class<T> clazz, String colName, String likeValue);

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value);
	
	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value, String orderCol, String orderType);

	public <T> List<T> getEntitiesByTwoColumn(Class<T> clazz, String colOneName, Object oneValue, String colTwoName, Object twoValue);

	public <T> List<T> getEntitiesSecondColIsNull(Class<T> clazz, String colOneName, Object oneValue, String colTwoName);
	
	public Long getEntityCountByColumn(Class clazz, String colName, Object value);
	
	public Long getEntityCountByTwoColumn(Class clazz, String colName, Object value, String colName2, Object value2);
	
	public Long getEntityCountByThreeColumn(Class clazz, String colName, Object value, String colName2, Object value2, String colName3, Object value3);
}
