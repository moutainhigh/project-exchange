package com.throne212.tui5.biz.impl;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.ScoreFinanceBiz;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.common.Util;
import com.throne212.tui5.dao.ScoreDao;
import com.throne212.tui5.domain.MoneyRecord;
import com.throne212.tui5.domain.User;

@Service("sfBiz")
public class ScoreFinanceBizImpl extends BaseBizImpl implements ScoreFinanceBiz {

	@Autowired
	private ScoreDao scoreDao;

	public PageBean getMyScore(Integer pageIndex, User user) {
		return scoreDao.getMyScore(pageIndex, user);
	}
	
	public PageBean getMyFinance(Integer pageIndex, User user, int... type) {
		return scoreDao.getMyFinance(pageIndex, user, type);
	}
	
	public PageBean getMyMoneyRecords(Integer pageIndex, User user){
		return scoreDao.getMyMoneyRecords(pageIndex, user);
	}
	
	public void applyMoney(BigDecimal money, User user){
		BigDecimal acct = user.getUserAccount();
		acct = acct.subtract(money);
		user.setUserAccount(acct);
		this.saveOrUpdateEntity(user);
		//加入记录
		MoneyRecord r = new MoneyRecord();
		r.setApplyTime(new Date());
		r.setContent("用户申请提现:" + money);
		r.setMoney(money);
		r.setStatus(Const.MONEY_RECORD_APPLY);
		r.setUser(user);
		r.setType(Const.RECORD_TYPE_0);
		r.setOrderNo(Const.ORDER_PRE_TIXIAN + Util.generateOrderNo());
		this.saveOrUpdateEntity(r);
	}
	
}
