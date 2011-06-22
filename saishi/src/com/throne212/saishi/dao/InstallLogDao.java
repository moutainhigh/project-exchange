package com.throne212.saishi.dao;

import com.throne212.saishi.common.PageBean;
import com.throne212.saishi.domain.InstallLog;

public interface InstallLogDao extends BaseDao {

	public PageBean<InstallLog> getInstallLog(Integer pageIndex);
	public PageBean<InstallLog> getUninstallLog(Integer pageIndex);
}
