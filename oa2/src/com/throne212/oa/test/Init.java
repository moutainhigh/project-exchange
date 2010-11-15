package com.throne212.oa.test;

import org.hibernate.Session;

import com.throne212.oa.HibernateSessionFactory;
import com.throne212.oa.domain.DropdownList;
import com.throne212.oa.domain.doctor.BodyGrade;
import com.throne212.oa.domain.doctor.Cun;
import com.throne212.oa.domain.doctor.Grade;
import com.throne212.oa.domain.doctor.Nation;
import com.throne212.oa.domain.doctor.XueLi;
import com.throne212.oa.domain.doctor.Zhen;
import com.throne212.oa.domain.doctor.Zige;
import com.throne212.oa.domain.file.FileType;
import com.throne212.oa.domain.file.SecretGrade;
import com.throne212.oa.domain.person.FullDayXueLi;
import com.throne212.oa.domain.person.KaoHeResult;
import com.throne212.oa.domain.person.OnJobXueLi;
import com.throne212.oa.domain.person.OrgName;
import com.throne212.oa.domain.person.OrgType;
import com.throne212.oa.domain.person.PersonNation;
import com.throne212.oa.domain.person.ShenFen;
import com.throne212.oa.domain.person.XingZhengGrade;
import com.throne212.oa.domain.person.XueLiCengci;
import com.throne212.oa.domain.person.ZhengZhi;
import com.throne212.oa.domain.person.ZhiCheng;
import com.throne212.oa.domain.person.ZhiWu;
import com.throne212.oa.domain.person.ZhuanYe;

public class Init {
	public static void main(String[] args) {
		Session s = HibernateSessionFactory.getSession();
		s.beginTransaction();
		
		//ҽ��
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
		
		//����
		String[] orgTypeArr = {"����","��ҵ","��Ӫ","����"};
		saveDropdownList(s,orgTypeArr,OrgType.class);
		
		OrgName org1 = new OrgName();
		org1.setName("�Ļ���������");
		OrgType orgType = (OrgType) s.createQuery("from " + OrgType.class.getName()).list().get(0);
		org1.setOrgType(orgType);
		s.save(org1);
		OrgName org2 = new OrgName();
		org2.setName("�Ļ���������");
		OrgType orgType2 = (OrgType) s.createQuery("from " + OrgType.class.getName()).list().get(1);
		org2.setOrgType(orgType2);
		s.save(org2);
		
		String[] fullXueliArr = {"����","����/��У/��ר","��ѧר�Ƽ�����","����"};
		saveDropdownList(s,fullXueliArr,FullDayXueLi.class);
		String[] onjobXueliArr = {"���˴�ר","���˱���","����˶ʿ","����"};
		saveDropdownList(s,onjobXueliArr,OnJobXueLi.class);
		
		String[] kaoheliArr = {"����","����","һ��","��","�ܲ�"};
		saveDropdownList(s,kaoheliArr,KaoHeResult.class);
		
		String[] perNationArr = {"����","׳��","����","����","����","ά�����","������","����","�ɹ���","����","������","����","����","������","����","������","��������","����","�������","������","������","������","ˮ������","������","Ǽ��","����","������","������",
				"�¶�������","���Ӷ���","������","������","��������","������������","���¿���ŭ��","����","��ŵ��","�°���","������","����˹��","ԣ����","���α����","�Ű���","���״���","������","��������","������","��ɽ��","�����","δʶ������"};
		saveDropdownList(s,perNationArr, PersonNation.class);
		
		String[] shenfenArr = {"�ɲ�","��ͨ����","��ͬ����"};
		saveDropdownList(s,shenfenArr,ShenFen.class);
		
		String[] xingzhengArr = {"�ܸ�","��","һ��"};
		saveDropdownList(s,xingzhengArr,XingZhengGrade.class);
		
		String[] xueliCcArr = {"�ܸ�","��","һ��"};
		saveDropdownList(s,xueliCcArr,XueLiCengci.class);
		
		String[] zhengzhiArr = {"��Ա","��Ա","������������Ա","Ⱥ��"};
		saveDropdownList(s,zhengzhiArr,ZhengZhi.class);
		
		String[] zhiChengArr = {"�߼�����ʦ","�߼���ʦ","���ʦ"};
		saveDropdownList(s,zhiChengArr,ZhiCheng.class);
		
		String[] zhiwuArr = {"�ֳ�","�Ƴ�","����Ա"};
		saveDropdownList(s,zhiwuArr,ZhiWu.class);
		
		String[] zhuanyeArr = {"��������","�������","��ʻ"};
		saveDropdownList(s,zhuanyeArr,ZhuanYe.class);
		
		//�����ļ�
		String[] fileTypeArr = {"��ʾ�ļ�","�����ļ�","��ͨ�ļ�"};
		saveDropdownList(s,fileTypeArr,FileType.class);
		
		String[] secretArr = {"����","����","��ͨ"};
		saveDropdownList(s,secretArr,SecretGrade.class);
		
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
