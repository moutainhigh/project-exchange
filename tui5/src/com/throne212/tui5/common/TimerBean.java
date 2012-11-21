package com.throne212.tui5.common;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.domain.Finance;
import com.throne212.tui5.domain.Gaojian;
import com.throne212.tui5.domain.Task;
import com.throne212.tui5.domain.User;

public class TimerBean extends QuartzJobBean {

	private Logger logger = Logger.getLogger(this.getClass());

	private int timeout;
	private TaskBiz taskBiz;

	/**
	 * Setter called after the ExampleJob is instantiated with the value from
	 * the JobDetailBean (5)
	 */
	public void setTimeout(int timeout) {
		this.timeout = timeout;
	}

	public void setTaskBiz(TaskBiz taskBiz) {
		this.taskBiz = taskBiz;
	}

	protected void executeInternal(JobExecutionContext ctx) throws JobExecutionException {
		if (timeout < 0)
			timeout = 5;
		List<Task> list = taskBiz.getEndingTask(timeout);
		int sum = 0;
		for (Task t : list) {
			if (t.getEndDate() != null && t.getEndDate().getTime() < System.currentTimeMillis()
					&& t.getStatus() == Const.TASK_STATUS_PUBLISHED) {//�Ѿ������������Ƿ��Զ�����
				Integer repub = t.getRepublish();
				if (repub == null)
					repub = 0;
				if (repub < 2) {// �Ƿ��Ѿ��ط�2��������
					long end = t.getEndDate().getTime();
					end += t.getDays() * 24 * 60 * 60 * 1000;
					t.setEndDate(new Timestamp(end));
					t.setRepublish(repub + 1);
					taskBiz.saveOrUpdateEntity(t);
				}
			}
			if (t.getEndDate() != null && t.getEndDate().getTime() < System.currentTimeMillis()
					&& t.getStatus() != Const.TASK_STATUS_COMPLETE) {//����Ӧ�ý���������
				t.setStatus(Const.TASK_STATUS_END);// ����
				taskBiz.saveOrUpdateEntity(t);
				//����ʣ����
				List<Gaojian> gList = taskBiz.getEntitiesByTwoColumn(Gaojian.class, "status", Const.GAOJIAN_STATUS_SUCC, "task", t);
				BigDecimal sumMoney = BigDecimal.valueOf(0);
				for(Gaojian g : gList){
					sumMoney = sumMoney.add(g.getMoney());
				}
				BigDecimal leftMoney = t.getMoney().subtract(sumMoney).multiply(Const.TUI_PERCENTAGE);//�������80%��ʣ��
				User user = t.getPublisher();
				user.setUserAccount(user.getUserAccount().add(leftMoney));
				taskBiz.saveOrUpdateEntity(user);
				//�����¼
				Finance f = new Finance();
				f.setContent("������ڣ��۳�����20%�Ժ�����");
				f.setMoney(leftMoney);
				f.setType(Const.RECORD_TYPE_1);
				f.setUser(user);
				f.setTime(new Date());
				taskBiz.saveOrUpdateEntity(f);
				sum++;
			}
		}
		if (sum > 0) {
			logger.info("End task mount: " + sum);
		}
	}
}
