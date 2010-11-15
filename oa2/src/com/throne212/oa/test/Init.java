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
		
		//医生
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
		
		//人事
		String[] orgTypeArr = {"政府","事业","民营","其他"};
		saveDropdownList(s,orgTypeArr,OrgType.class);
		
		OrgName org1 = new OrgName();
		org1.setName("四会市民政局");
		OrgType orgType = (OrgType) s.createQuery("from " + OrgType.class.getName()).list().get(0);
		org1.setOrgType(orgType);
		s.save(org1);
		OrgName org2 = new OrgName();
		org2.setName("四会市卫生局");
		OrgType orgType2 = (OrgType) s.createQuery("from " + OrgType.class.getName()).list().get(1);
		org2.setOrgType(orgType2);
		s.save(org2);
		
		String[] fullXueliArr = {"初中","高中/技校/中专","大学专科及以上","不详"};
		saveDropdownList(s,fullXueliArr,FullDayXueLi.class);
		String[] onjobXueliArr = {"成人大专","成人本科","工程硕士","不详"};
		saveDropdownList(s,onjobXueliArr,OnJobXueLi.class);
		
		String[] kaoheliArr = {"优秀","良好","一般","差","很差"};
		saveDropdownList(s,kaoheliArr,KaoHeResult.class);
		
		String[] perNationArr = {"汉族","壮族","满族","回族","苗族","维吾尔族","土家族","彝族","蒙古族","藏族","布依族","侗族","瑶族","朝鲜族","白族","哈尼族","哈萨克族","傣族","畲族僳族","仡佬族","东乡族","拉祜族","水族佤族","纳西族","羌族","土族","仫佬族","锡伯族",
				"柯尔克孜族","达斡尔族","撒拉族","布朗族","塔吉克族","阿昌族普米族","鄂温克族怒族","京族","基诺族","德昂族","保安族","俄罗斯族","裕固族","乌孜别克族","门巴族","鄂伦春族","独龙族","塔塔尔族","赫哲族","高山族","珞巴族","未识别民族"};
		saveDropdownList(s,perNationArr, PersonNation.class);
		
		String[] shenfenArr = {"干部","普通工人","合同工人"};
		saveDropdownList(s,shenfenArr,ShenFen.class);
		
		String[] xingzhengArr = {"很高","高","一般"};
		saveDropdownList(s,xingzhengArr,XingZhengGrade.class);
		
		String[] xueliCcArr = {"很高","高","一般"};
		saveDropdownList(s,xueliCcArr,XueLiCengci.class);
		
		String[] zhengzhiArr = {"党员","团员","其它民主政党员","群众"};
		saveDropdownList(s,zhengzhiArr,ZhengZhi.class);
		
		String[] zhiChengArr = {"高级工程师","高级教师","会计师"};
		saveDropdownList(s,zhiChengArr,ZhiCheng.class);
		
		String[] zhiwuArr = {"局长","科长","办事员"};
		saveDropdownList(s,zhiwuArr,ZhiWu.class);
		
		String[] zhuanyeArr = {"行政管理","软件工程","驾驶"};
		saveDropdownList(s,zhuanyeArr,ZhuanYe.class);
		
		//人事文件
		String[] fileTypeArr = {"公示文件","档案文件","普通文件"};
		saveDropdownList(s,fileTypeArr,FileType.class);
		
		String[] secretArr = {"绝密","机密","普通"};
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
