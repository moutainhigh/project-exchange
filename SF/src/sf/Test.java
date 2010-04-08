package sf;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Test {

	public static void main(String[] args) throws Exception {
		Calendar sTime = GregorianCalendar.getInstance();
		sTime.setTime(new Date());
		sTime.set(GregorianCalendar.MINUTE, 0);
		sTime.set(GregorianCalendar.SECOND, 0);
		sTime.set(GregorianCalendar.HOUR_OF_DAY, 9);
		System.out.println(new Date(sTime.getTimeInMillis()));
	}
	
}
