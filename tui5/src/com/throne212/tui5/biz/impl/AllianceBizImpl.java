package com.throne212.tui5.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.AllianceBiz;
import com.throne212.tui5.dao.AllianceDao;
import com.throne212.tui5.dao.BaseDao;

@Service("allianceBiz")
public class AllianceBizImpl extends BaseBizImpl implements AllianceBiz {

	@Autowired
	private BaseDao baseDao;
	@Autowired
	private AllianceDao allianceDao;

}
