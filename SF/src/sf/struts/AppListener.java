package sf.struts;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

public class AppListener implements ServletContextListener {

	private static Logger logger = Logger.getLogger(AppListener.class);
	private Timer timer = new Timer(true);
	
	public void contextDestroyed(ServletContextEvent sce) {

	}

	public void contextInitialized(ServletContextEvent sce) {
		Calendar sTime = GregorianCalendar.getInstance();
		sTime.setTime(new Date());
		sTime.set(GregorianCalendar.MINUTE, 0);
		sTime.set(GregorianCalendar.SECOND, 0);
		sTime.set(GregorianCalendar.HOUR_OF_DAY, 9);
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				try {
					sf.test.sf999.GetData.main(null);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}, new Date(sTime.getTimeInMillis()), 1000 * 60 * 60 * 6);// 6小时一次
		

		sce.getServletContext().setAttribute("app_title", "我爱传奇部落");
		sce.getServletContext().setAttribute("app_path", sce.getServletContext().getContextPath());

	}


}
