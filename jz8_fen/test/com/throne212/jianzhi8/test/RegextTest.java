package com.throne212.jianzhi8.test;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegextTest {

	public static void main(String[] args) {
		//System.out.println("akjehk-22".matches("[^-]+(-\\d+){0,1}"));
		Pattern p = Pattern.compile("^/jz\\d*(/(k\\d+){0,1}(d\\d+){0,1}(t\\d+){0,1}){0,1}(/p\\d+){0,1}/$");
		Matcher m = p.matcher("/jz0105/");
		while(m.find()){
			System.out.println(m.group());
		}
	}
	
}
