package com.throne212.wz.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DateTest {

	public static void main(String[] args) {
		System.out.println(new SimpleDateFormat("yyyy��MM��dd�� E",Locale.CHINA).format(new Date()));;
	}
	
}
