package com.throne212.tui5.biz.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.throne212.tui5.biz.ScoreFinanceBiz;
import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.common.AppException;
import com.throne212.tui5.common.Const;
import com.throne212.tui5.common.PageBean;
import com.throne212.tui5.dao.BaseDao;
import com.throne212.tui5.dao.TaskDao;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.Type;
import com.throne212.tui5.domain.User;

@Service("taskBiz")
public class TaskBizImpl extends BaseBizImpl implements TaskBiz {

	@Autowired
	private BaseDao baseDao;
	@Autowired
	private TaskDao taskDao;
	@Autowired
	private ScoreFinanceBiz sfBiz;

	public Task publishTask(Task task) {
		User user = task.getPublisher();
		BigDecimal currMoney = user.getUserAccount();
		BigDecimal newMoney = currMoney.subtract(task.getMoney());
		if(newMoney.doubleValue() < 0){
			throw new AppException("余额不足");
		}
		user.setUserAccount(newMoney);
		baseDao.saveOrUpdate(user);
		baseDao.saveOrUpdate(task);
		// 积分记录
		sfBiz.addScore("发布任务，奖励积分", task.getMoney().intValue(), Const.RECORD_TYPE_1, user);
		// 加入记录
		sfBiz.addFinance("发布任务，扣除金额：" + task.getMoney(), task.getMoney(), Const.RECORD_TYPE_0, user);
		
		return task;
	}

	public PageBean<Task> getTaskList(Integer pageIndex, Integer status, User publisher) {
		return taskDao.getTaskList(pageIndex, status, publisher);
	}

	public PageBean<Task> getTaskList(Integer pageIndex,String sort, Integer... status) {
		return taskDao.getTaskList(pageIndex,sort, status);
	}

	public PageBean<Task> getTaskList(Integer pageIndex,String sort, Type t, Integer... status) {
		return taskDao.getTaskList(pageIndex,sort, t, status);
	}
	
	public PageBean<Task> getWeiboList(Integer pageIndex, Integer status, Integer wbType, String sort){
		return taskDao.getWeiboList(pageIndex, status, wbType, sort);
	}

	public List<Task> getEndingTask(int min) {
		return taskDao.getEndingTask(min);
	}

	public long getUserCountInTask(Task t) {
		return taskDao.getUserCountInTask(t);
	}

	public List<Task> getRelateTask(Task t) {
		return taskDao.getRelateTask(t);
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, Task task) {
		return taskDao.getGaojianList(pageIndex, task);
	}

	public PageBean<Task> getMyTaskList(Integer pageIndex, User user) {
		return taskDao.getMyTaskList(pageIndex, user);
	}

	public PageBean<Gaojian> getGaojianList(Integer pageIndex, User user) {
		return taskDao.getGaojianList(pageIndex, user);
	}

	public List<Task> getTaskTop(int top, User user) {
		return taskDao.getTaskTop(top, user);
	}

	public List<Gaojian> getGaojianTop(int top, User user) {
		return taskDao.getGaojianTop(top, user);
	}
	
	public List<Task> getTaskTop(int top, Integer status){
		return taskDao.getTaskTop(top, status);
	}
}
