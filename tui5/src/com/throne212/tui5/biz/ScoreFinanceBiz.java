package com.throne212.tui5.biz;

import java.math.BigDecimal;

import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.domain.User;

public interface ScoreFinanceBiz extends BaseBiz {

	public PageBean getMyScore(Integer pageIndex, User user);
	
	public PageBean getMyFinance(Integer pageIndex, User user, int... type);
	
	public PageBean getMyMoneyRecords(Integer pageIndex, User user);
	
	public void applyMoney(BigDecimal money, User user);
	
}
