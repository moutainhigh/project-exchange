package com.throne212.oa.test;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.doctor.*;

public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		String[] xueliArr = {"��ä������ä","Сѧ","����","����/��У/��ר","��ѧר�Ƽ�����","����"};
		saveDropdownList(s,xueliArr,XueLi.class);
		
		String[] bodyGradeArr = {"�ܺ�","��","һ��","�ϲ�ר","�ܲ�"};
		saveDropdownList(s,bodyGradeArr,BodyGrade.class);
		
		String[] cunArr = {"�Ҹ���"};
		saveDropdownList(s,cunArr,Cun.class);
		
		String[] zhenArr = {"�Ҹ���"};
		saveDropdownList(s,zhenArr,Zhen.class);
		
		String[] gradeArr = {"1","2","3","4","5"};
		saveDropdownList(s,gradeArr,Grade.class);
		
		String[] nationArr = {"����","׳��","����","����","����","ά�����","������","����","�ɹ���","����","������","����","����","������","����","������","��������","����","�������","������","������","������","ˮ������","������","Ǽ��","����","������","������",
				"�¶�������","���Ӷ���","������","������","��������","������������","���¿���ŭ��","����","��ŵ��","�°���","������","����˹��","ԣ����","���α����","�Ű���","���״���","������","��������","������","��ɽ��","�����","δʶ������"};
		saveDropdownList(s,nationArr, Nation.class);
		
		String[] zigeArr = {"ִҵҽʦ","ִҵ����ҽʦ"};
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
