package com.throne212.tui5.biz;

import java.util.List;

//����ҵ����
public interface BaseBiz {

	public <T> List<T> getAll(Class<T> clazz);

	public <T> List<T> getAll(Class<T> clazz, String col, String orderType);

	public <T> T getEntityById(Class<T> clazz, Long id);

	public <T> T getEntityByUnique(Class<T> clazz, String col, Object val);

	public void saveOrUpdateEntity(Object e);

	public <T> boolean checkUnique(Class<T> clazz, String colName, Object value);

	public <T> void deleteEntity(Class<T> clazz, Long id);

	public <T> List<T> getAllLike(Class<T> clazz, String colName, String likeValue);

	public <T> List<T> getEntitiesByColumn(Class<T> clazz, String colName, Object value);

	public <T> List<T> getEntitiesByTwoColumn(Class<T> clazz, String colOneName, Object oneValue, String colTwoName, Object twoValue);

	public <T> List<T> getEntitiesSecondColIsNull(Class<T> clazz, String colOneName, Object oneValue, String colTwoName);
}
