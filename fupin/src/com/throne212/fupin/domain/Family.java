package com.throne212.fupin.domain;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.List;
import java.util.Set;

import com.throne212.fupin.common.WebConstants;

public class Family extends MyEntity {

	private String name;
	private Cun cun;
	private String zu;
	private String gender;
	private Date birthday;
	private String idNo;
	private String wenhua;
	private Double income;// 年收入
	private Date date;// 登记日期
	private String dibao;// 是否为低保
	private String tuopin;// 脱贫状况
	private String gongkai;// 公开状态
	private Integer type;// 贫困类型
	private String canji;// 是否残疾

	private Double shuitian;// 水田
	private Double handi;// 旱地
	private Double linguodi;// 林果地
	private Double other;// 其他

	private String jiegou;// 房屋结构
	private Double mianji;// mianji
	
	//新的字段-测试10
	private String tel;//联系电话
	private String reason;//贫困原因
	private String willing;//贫困意愿
	private String weifang;//是否危房
	

	private Person person1;
	private Person person2;
	private Person person3;
	private Person person4;
	private Person person5;
	private Person person6;
	private Person person7;
	private Person person8;
	private Person person9;
	private Person person10;

	private List<Leader> leaderList;

	public String getLeaderNames() {
		if(leaderList == null || leaderList.size() == 0){
			return "暂时没有帮扶干部";
		}
		StringBuffer sb = new StringBuffer();
		for (Leader l : leaderList) {
			sb.append(l.getLeaderName());
			sb.append(" ");
		}
		return sb.toString();
	}

	public int getLeaderSize(){
		if(leaderList == null){
			return 0;
		}else{
			return leaderList.size();
		}
	}

	public String getTypeTxt() {
		if (type == null)
			return null;
		switch (type) {
		case 1:
			return WebConstants.POOR_TYPE_1;
		case 2:
			return WebConstants.POOR_TYPE_2;
		case 3:
			return WebConstants.POOR_TYPE_3;
		default:
			return "";
		}
	}

	public Person getPerson(int i) {
		try {
			Method m = this.getClass().getDeclaredMethod("getPerson" + i);
			Person p = (Person) m.invoke(this);
			if (p == null || p.getName() == null || "".equals(p.getName())) {
				return null;
			} else {
				return p;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public void setPerson(Person p,int i) {
		try {
			Method m = this.getClass().getDeclaredMethod("setPerson" + i,Person.class);
			m.invoke(this, p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Cun getCun() {
		return cun;
	}

	public void setCun(Cun cun) {
		this.cun = cun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZu() {
		return zu;
	}

	public void setZu(String zu) {
		this.zu = zu;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getIdNo() {
		return idNo;
	}

	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}

	public String getWenhua() {
		return wenhua;
	}

	public void setWenhua(String wenhua) {
		this.wenhua = wenhua;
	}

	public Double getIncome() {
		if(income == null)
			return null;
		return Double.valueOf(Math.round(income));
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getDibao() {
		return dibao;
	}

	public void setDibao(String dibao) {
		this.dibao = dibao;
	}

	public String getTuopin() {
		return tuopin;
	}

	public void setTuopin(String tuopin) {
		this.tuopin = tuopin;
	}

	public String getGongkai() {
		return gongkai;
	}

	public void setGongkai(String gongkai) {
		this.gongkai = gongkai;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getCanji() {
		return canji;
	}

	public void setCanji(String canji) {
		this.canji = canji;
	}

	public Double getShuitian() {
		return shuitian;
	}

	public void setShuitian(Double shuitian) {
		this.shuitian = shuitian;
	}

	public Double getHandi() {
		return handi;
	}

	public void setHandi(Double handi) {
		this.handi = handi;
	}

	public Double getLinguodi() {
		return linguodi;
	}

	public void setLinguodi(Double linguodi) {
		this.linguodi = linguodi;
	}

	public Double getOther() {
		return other;
	}

	public void setOther(Double other) {
		this.other = other;
	}

	public String getJiegou() {
		return jiegou;
	}

	public void setJiegou(String jiegou) {
		this.jiegou = jiegou;
	}

	public Double getMianji() {
		if(mianji == null)
			return null;
		return Double.valueOf(Math.round(mianji));
	}

	public void setMianji(Double mianji) {
		this.mianji = mianji;
	}

	public Person getPerson1() {
		return person1;
	}

	public void setPerson1(Person person1) {
		this.person1 = person1;
	}

	public Person getPerson2() {
		return person2;
	}

	public void setPerson2(Person person2) {
		this.person2 = person2;
	}

	public Person getPerson3() {
		return person3;
	}

	public void setPerson3(Person person3) {
		this.person3 = person3;
	}

	public Person getPerson4() {
		return person4;
	}

	public void setPerson4(Person person4) {
		this.person4 = person4;
	}

	public Person getPerson5() {
		return person5;
	}

	public void setPerson5(Person person5) {
		this.person5 = person5;
	}

	public Person getPerson6() {
		return person6;
	}

	public void setPerson6(Person person6) {
		this.person6 = person6;
	}

	public Person getPerson7() {
		return person7;
	}

	public void setPerson7(Person person7) {
		this.person7 = person7;
	}

	public Person getPerson8() {
		return person8;
	}

	public void setPerson8(Person person8) {
		this.person8 = person8;
	}

	public Person getPerson9() {
		return person9;
	}

	public void setPerson9(Person person9) {
		this.person9 = person9;
	}

	public Person getPerson10() {
		return person10;
	}

	public void setPerson10(Person person10) {
		this.person10 = person10;
	}

	public List<Leader> getLeaderList() {
		return leaderList;
	}

	public void setLeaderList(List<Leader> leaderList) {
		this.leaderList = leaderList;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getWilling() {
		return willing;
	}

	public void setWilling(String willing) {
		this.willing = willing;
	}

	public String getWeifang() {
		return weifang;
	}

	public void setWeifang(String weifang) {
		this.weifang = weifang;
	}

}
