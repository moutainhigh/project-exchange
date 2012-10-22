package com.throne212.tui5.common;

import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.throne212.tui5.biz.TaskBiz;
import com.throne212.tui5.domain.Task;

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
		if(timeout < 0)
			timeout = 5;
		List<Task> list = taskBiz.getEndingTask(timeout);
		int sum = 0;
		for(Task t : list){
			if(t.getEndDate() != null && t.getEndDate().getTime() < System.currentTimeMillis() && t.getStatus() != Const.TASK_STATUS_COMPLETE){
				t.setStatus(Const.TASK_STATUS_END);//½áÊø
				taskBiz.saveOrUpdateEntity(t);
				sum ++;
			}
		}
		if(sum > 0){
			logger.info("End task mount: " + sum);
		}
	}
}
