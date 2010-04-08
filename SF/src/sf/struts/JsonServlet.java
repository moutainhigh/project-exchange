package sf.struts;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;

import sf.common.Util;
import sf.dao.InfoDao;
import sf.pojo.Info;

public class JsonServlet extends HttpServlet{
	
	private static Logger logger = Logger.getLogger(JsonServlet.class);
	private Timer timerSaveJson = new Timer(true);
	private static InfoDao infoDao = new InfoDao();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		final String path = config.getServletContext().getRealPath("");
		System.out.println(path);
		timerSaveJson.schedule(new TimerTask() {
			@Override
			public void run() {
				try {
					String myPath = path + File.separator + "json";
					Calendar now = GregorianCalendar.getInstance();
					int hour = now.get(GregorianCalendar.HOUR_OF_DAY);
					if (hour >= 0 && hour < 7) {
						saveJsonFile("tx", myPath);
						saveJsonFile("allday", myPath);
						saveJsonFile("after", myPath);
					} else {
						saveJsonFile("recent", myPath);
						saveJsonFile("allday", myPath);
						saveJsonFile("before", myPath);
						saveJsonFile("after", myPath);
						saveJsonFile("tx", myPath);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}, new Date(), 1000 * 60 * 5);// 5分钟一次
	}
	
	private static void saveJsonFile(String type, String path) {
		List<Info> list = null;
		if ("recent".equals(type)) {
			list = infoDao.getRecentInfo(new Date());
		} else if ("before".equals(type)) {
			list = infoDao.getTodayBeforeInfo(new Date());
		} else if ("after".equals(type)) {
			list = infoDao.getTodayAfterInfo(new Date());
		} else if ("allday".equals(type)) {
			list = infoDao.getTodayAllDayInfo(new Date());
		} else if ("tx".equals(type)) {
			Calendar now = GregorianCalendar.getInstance();
			int hour = now.get(GregorianCalendar.HOUR_OF_DAY);
			if (hour >= 0 && hour < 7)
				list = infoDao.getTodayTongXiaoInfo(new Date());
			else
				list = infoDao.getTommorowTongXiaoInfo(new Date());
		}
		FileOutputStream fos = null;
		PrintWriter pw = null;
		try {
			//fos = new FileOutputStream(path + File.separator + type + ".txt");
			pw = new PrintWriter(path + File.separator + type + ".txt","utf8");
			JSONArray arr = new JSONArray();
			for (Info info : list) {
				arr.put(Util.convertObjectToJSONObject(info));
			}
			pw.print(arr.toString());
			logger.info("save [" + type + "] json succ size=" + (list == null ? 0 : list.size()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fos != null)
				try {
					fos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (pw != null)
					pw.close();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		//response.setContentType("text/json");
		PrintWriter out = response.getWriter();
		List<Info> list = null;
		String type = request.getParameter("type");
		if("recent".equals(type)){
			list = infoDao.getRecentInfo(new Date());
		}else if("before".equals(type)){
			list = infoDao.getTodayBeforeInfo(new Date());
		}else if("after".equals(type)){
			list = infoDao.getTodayAfterInfo(new Date());
		}else if("allday".equals(type)){
			list = infoDao.getTodayAllDayInfo(new Date());
		}else if("tx".equals(type)){
			Calendar now = GregorianCalendar.getInstance();
			int hour = now.get(GregorianCalendar.HOUR_OF_DAY);
			if(hour >= 0 && hour < 7)
				list = infoDao.getTodayTongXiaoInfo(new Date());
			else
				list = infoDao.getTommorowTongXiaoInfo(new Date());
		}
		//infoDao.getInfoByDate(new Date());
		if(list != null && list.size() > 0){
			JSONArray arr = new JSONArray();
			for(Info info : list){
				arr.put(Util.convertObjectToJSONObject(info));
			}
			out.write(arr.toString());
		}
	}	
	
}
