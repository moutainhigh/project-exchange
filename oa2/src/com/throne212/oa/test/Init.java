package com.throne212.oa.test;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.doctor.*;

public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		String[] xueliArr = {"文盲及半文盲","小学","初中","高中/技校/中专","大学专科及以上","不详"};
		saveDropdownList(s,xueliArr,XueLi.class);
		
		String[] bodyGradeArr = {"很好","好","一般","较差专","很差"};
		saveDropdownList(s,bodyGradeArr,BodyGrade.class);
		
		String[] cunArr = {"幸福村"};
		saveDropdownList(s,cunArr,Cun.class);
		
		String[] zhenArr = {"幸福镇"};
		saveDropdownList(s,zhenArr,Zhen.class);
		
		String[] gradeArr = {"1","2","3","4","5"};
		saveDropdownList(s,gradeArr,Grade.class);
		
		String[] nationArr = {"汉族","壮族","满族","回族","苗族","维吾尔族","土家族","彝族","蒙古族","藏族","布依族","侗族","瑶族","朝鲜族","白族","哈尼族","哈萨克族","傣族","畲族僳族","仡佬族","东乡族","拉祜族","水族佤族","纳西族","羌族","土族","仫佬族","锡伯族",
				"柯尔克孜族","达斡尔族","撒拉族","布朗族","塔吉克族","阿昌族普米族","鄂温克族怒族","京族","基诺族","德昂族","保安族","俄罗斯族","裕固族","乌孜别克族","门巴族","鄂伦春族","独龙族","塔塔尔族","赫哲族","高山族","珞巴族","未识别民族"};
		saveDropdownList(s,nationArr, Nation.class);
		
		String[] zigeArr = {"执业医师","执业助理医师"};
		saveDropdownList(s,zigeArr,Zige.class);
		
		s.getTransaction().commit();
		s.close();
	}
	
	private static void saveDropdownList(Session s,String[] arr,Class clazz){
		for(int i = 0;i<arr.length;i++){
			try {
				DropdownList sel = (DropdownList) clazz.newInstance();
				sel.setName(arr[i]);
				sel.setListorder(Integer.valueOf(0));
				s.save(sel);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
	}
}
