package com.throne212.fupin.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.throne212.fupin.biz.QuestionBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.QuestionStatDO;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.domain.Family;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.Question;
import com.throne212.fupin.domain.Question1;
import com.throne212.fupin.domain.Question2;

public class QuestionOrgAction extends BaseAction {

	private PageBean pageBean;
	private Integer pageIndex;
	private String familyName;

	// excel导出文件
	private InputStream downloadFile;

	private Question1 q1;
	private Question2 q2;
	private QuestionStatDO q;

	private Integer year;

	private QuestionBiz questionBiz;

	// 一
	public String edit1() {
		Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
		List<Question1> q1List = questionBiz.getEntitiesByTwoColumn(Question1.class, "org", org, "year", year);
		if (q1List != null && q1List.size() > 0) {
			q1 = q1List.get(0);
		} else {
			q1 = new Question1();
			q1.setOrg(org);
			q1.setCun(org.getCun());
			q1.setCreateDate(new Date());
			q1.setYear(year);
			questionBiz.saveOrUpdateEntity(q1);
		}
		if(q1.getStatus()!=null && q1.getStatus().equals(1) ){
			msg = "该报表已经提交，如需修改请点击申请解锁";
		}else if(q1.getStatus()!=null && q1.getStatus().equals(2) ){
			msg = "该报表已解锁，可以填报";
		}
		if(year == 2012)
			return "edit1_2012";
		return "edit1";
	}

	public String save1() {
		if (q1 != null && q1.getId() != null) {
			
			for (int i = 1; i <= 104; i++) {
				if(q1.getItem(i) == null)
					q1.setItem(i, 0.0);
			}

			boolean pass = true;
			try {
				if(year != null && year == 2012)
					validateQ1_2012();
				else
					validateQ1();
			} catch (Exception e) {
				this.setMsg(e.getMessage());
				pass = false;
			}

			Question1 q = questionBiz.getEntityById(Question1.class, q1.getId());
			for (int i = 1; i <= 104; i++) {
				q.setItem(i, q1.getItem(i) == null ? 0 : q1.getItem(i));
			}
			q.setWriter(q1.getWriter());
			q.setDate(q1.getDate());
			
			String tmp = ServletActionContext.getRequest().getParameter("tmp");
			if(pass && !"Y".equals(tmp)){
				q.setStatus(1);
				this.setMsg("保存成功");
			}else if(pass){
				this.setMsg("暂存成功");
			}
			questionBiz.saveOrUpdateEntity(q);
			q1 = q;
		}
		if(year == 2012)
			return "edit1_2012";
		return "edit1";
	}

	public void validateQ1() throws Exception {
		// 校验
		// 通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数
		if (q1.getItem15() > q1.getItem14() || q1.getItem16() > q1.getItem14() || q1.getItem17() > q1.getItem14() || q1.getItem18() > q1.getItem14() || q1.getItem19() > q1.getItem14()
				|| q1.getItem20() > q1.getItem14()) {
			throw new RuntimeException("通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数");
		}
		// 帮扶资金总量
		if (q1.getItem25() != (q1.getItem26() + q1.getItem27() + q1.getItem28() + q1.getItem29() + q1.getItem30() + q1.getItem31() + q1.getItem32() + q1.getItem33())) {
			throw new RuntimeException("帮扶资金总量与分量的总和不符");
		}
		// 扶贫专项资金,支出资金数额≤到账资金数额,到账资金支出率=支出资金数额÷到账资金数额
		if (q1.getItem35() > q1.getItem34()) {
			throw new RuntimeException("扶贫专项资金,支出资金数额≤到账资金数额");
		}
		double rate = (q1.getItem35() / q1.getItem34()) * 100;
		if (((int) rate) != q1.getItem36().intValue()) {
			throw new RuntimeException("扶贫专项资金,到账资金支出率=支出资金数额÷到账资金数额");
		}

		// 贫困户总户/人数
		if (q1.getItem40() + q1.getItem42() != q1.getItem37()) {
			throw new RuntimeException("贫困户总户数=有劳动能力的贫困户户数+无劳动能力的贫困户户数");
		}
		if (q1.getItem41() + q1.getItem43() != q1.getItem38()) {
			throw new RuntimeException("贫困户总户数=有劳动能力的贫困户户数+无劳动能力的贫困户户数");
		}

		// 当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数
		rate = (q1.getItem45() / q1.getItem40()) * 100;
		if (((int) rate) != q1.getItem46().intValue()) {
			throw new RuntimeException("当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数");
		}

		// 参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
		if (q1.getItem51() > q1.getItem49() - q1.getItem50()) {
			throw new RuntimeException("参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
		}
		// 贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
		rate = (q1.getItem51() / (q1.getItem49() - q1.getItem50())) * 100;
		if (((int) rate) != q1.getItem52().intValue()) {
			throw new RuntimeException("贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
		}

		// 务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
		if (q1.getItem53() > q1.getItem49() - q1.getItem50()) {
			throw new RuntimeException("务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
		}
		// 贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
		rate = (q1.getItem53() / (q1.getItem49() - q1.getItem50())) * 100;
		if (((int) rate) != q1.getItem54().intValue()) {
			throw new RuntimeException("贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
		}

		// 贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数
		rate = (q1.getItem61() / q1.getItem38()) * 100;
		if (((int) rate) != q1.getItem62().intValue()) {
			throw new RuntimeException("贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数");
		}

		// 贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数
		rate = (q1.getItem64() / q1.getItem39()) * 100;
		if (((int) rate) != q1.getItem65().intValue()) {
			throw new RuntimeException("贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数");
		}

		// 设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他
		if (q1.getItem82() != (q1.getItem83() + q1.getItem84() + q1.getItem85() + q1.getItem86() + q1.getItem87() + q1.getItem88() + q1.getItem89())) {
			throw new RuntimeException("基础建设设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他");
		}

		// 惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他
		if (q1.getItem91() != (q1.getItem92() + q1.getItem93() + q1.getItem94() + q1.getItem95() + q1.getItem96())) {
			throw new RuntimeException("惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他");
		}
	}
	
	//2012的新规则
	public void validateQ1_2012() throws Exception {
		// 校验
		// 通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数
		if (q1.getItem15() > q1.getItem14() || q1.getItem16() > q1.getItem14() || q1.getItem17() > q1.getItem14() || q1.getItem18() > q1.getItem14() || q1.getItem19() > q1.getItem14()
				|| q1.getItem20() > q1.getItem14()) {
			throw new RuntimeException("通电、通洁净水、通电话、通有线电视、通路灯、通硬底化道路100人以上的自然村≤自然村个数");
		}
		//长效发展产业项目的子项目个数加总数目不一致
		if (q1.getItem22() != (q1.getItem23() + q1.getItem24() + q1.getItem25() + q1.getItem26())) {
			throw new RuntimeException("长效发展产业项目（保证贫困村5年以上每年有稳定经济收入）个数=以入股分红、逐年返利且不参与经营的+由社会企业捐赠的+投入资金参加区或镇统筹项目的+帮扶单位通过自身力量、引入企业、成立合作社等形式，形成固定资产或运作经济实体的");
		}
		// 帮扶资金总量
		if (q1.getItem30() != (q1.getItem31() + q1.getItem32() + q1.getItem33() + q1.getItem34() + q1.getItem35() + q1.getItem36() + q1.getItem37())) {
			throw new RuntimeException("帮扶资金总量=帮扶单位自筹资金+市农村扶贫开发“双到”专项资金+帮扶区财政“双到”资金+其他财政资金+各级职能部门（危房改造、村道、路灯、二次改水、污水处理、农田鱼塘标准化建设、新农村建设等）财政资金+社会捐赠+社会引资");
		}
		// 扶贫专项资金,支出资金数额≤到账资金数额,到账资金支出率=支出资金数额÷到账资金数额
		if (q1.getItem39() > q1.getItem38()) {
			throw new RuntimeException("扶贫专项资金实施使用进度,支出资金数额≤到账资金数额");
		}
		double rate = (q1.getItem39() / q1.getItem38()) * 100;
		if (((int) rate) != q1.getItem40().intValue()) {
			throw new RuntimeException("扶贫专项资金实施使用进度,到账资金支出率=支出资金数额÷到账资金数额");
		}

		// 贫困户总户/人数
		if (q1.getItem44() + q1.getItem46() != q1.getItem41()) {
			throw new RuntimeException("贫困户总户数=有劳动能力的贫困户户数+无劳动能力的贫困户户数");
		}
		if (q1.getItem45() + q1.getItem47() != q1.getItem42()) {
			throw new RuntimeException("贫困户总人数=有劳动能力的贫困户人数+无劳动能力的贫困户人数");
		}

		// 当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数
		rate = (q1.getItem49() / q1.getItem44()) * 100;
		if (((int) rate) != q1.getItem50().intValue()) {
			throw new RuntimeException("当年有劳动能力的贫困户脱贫率=当年有劳动能力的贫困户实现稳定脱贫户数÷有劳动能力的贫困户户数");
		}

		// 参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
		if (q1.getItem55() > q1.getItem53() - q1.getItem54()) {
			throw new RuntimeException("参加免费农技和就业培训累计人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
		}
		// 贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
		rate = (q1.getItem55() / (q1.getItem53() - q1.getItem54())) * 100;
		if (((int) rate) != q1.getItem56().intValue()) {
			throw new RuntimeException("贫困户劳动力培训率=参加免费农技和就业培训累计人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
		}

		// 务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数
		if (q1.getItem57() > q1.getItem53() - q1.getItem54()) {
			throw new RuntimeException("务农、务工人数≤贫困户劳动力人数-因长期患病和残疾不能参加劳动人数");
		}
		// 贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）
		rate = (q1.getItem57() / (q1.getItem53() - q1.getItem54())) * 100;
		if (((int) rate) != q1.getItem58().intValue()) {
			throw new RuntimeException("贫困户劳动力就业率=务农、务工人数÷（贫困户劳动力人数-因长期患病和残疾不能参加劳动人数）");
		}

		// 贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数
		rate = (q1.getItem65() / q1.getItem42()) * 100;
		if (((int) rate) != q1.getItem66().intValue()) {
			throw new RuntimeException("贫困户新农合参保率=当年贫困户参加新型农村合作医疗人数÷贫困户总人数");
		}

		// 贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数
		rate = (q1.getItem68() / q1.getItem43()) * 100;
		if (((int) rate) != q1.getItem69().intValue()) {
			throw new RuntimeException("贫困户60岁及以上的人新农保参保率=60岁及以上参加新农保人数÷贫困户60岁及以上人数");
		}

		// 设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他
		if (q1.getItem86() != (q1.getItem87() + q1.getItem88() + q1.getItem89() + q1.getItem90() + q1.getItem91() + q1.getItem92() + q1.getItem93())) {
			throw new RuntimeException("基础建设设施项目个数=文化室+卫生站+公厕+垃圾收集设施+室外公共文体场所+村容村貌整治改造+其他");
		}

		// 惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他
		if (q1.getItem95() != (q1.getItem96() + q1.getItem97() + q1.getItem98() + q1.getItem99() + q1.getItem100())) {
			throw new RuntimeException("惠民活动=文娱体育+送医送药+科技下乡+慰问贫困户+其他");
		}
	}
	
	public String unlock1(){
		String[] id = (String[]) ActionContext.getContext().getParameters().get("id");
		if(id != null && id.length > 0){
			Long i = Long.valueOf(id[0]);
			Question1 q1 = questionBiz.getEntityById(Question1.class, i);
			if(q1 != null){
				q1.setStatus(2);
				questionBiz.saveOrUpdateEntity(q1);
				this.setSucc("Y");
				this.setMsg("申请解锁成功，等待管理员回复");
				this.q1 = q1;
				if(q1.getYear()!=null && q1.getYear() == 2012)
					return "edit1_2012";
			}
		}
		return "edit1";
	}

	public String exportQ1() {
		if (q1 == null || q1.getId() == null || (q1 = questionBiz.getEntityById(Question1.class, q1.getId())) == null)
			return edit1();
		String filePath = null;
		try {
			filePath = questionBiz.getQ1ExcelReportFilePath(q1);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("q1");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return edit1();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
			this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
			return edit1();
		}
		return "excel";
	}
	
	public String uploadQuestion1() {
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (fileName != null) {
			String msg = null;
			try {
				msg = questionBiz.importQuestion1(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n" + msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n" + e.getMessage());
			}
		}
		return "upload1";
	}
	

	// 二
	public String list2() {
		pageBean = questionBiz.getFamilyList(familyName, pageIndex, year);
		return "list2";
	}

	public String edit2() {
		if (q2 != null && q2.getId() != null) {
			q2 = questionBiz.getEntityById(Question2.class, q2.getId());
		} else {
			if (q2 == null || q2.getFamily() == null || q2.getFamily().getId() == null) {
				this.setMsg("参数缺少");
				this.setSucc("Y");
				return "edit2";
			}
			Question2 q = null;
			List<Question2> qList = questionBiz.getEntitiesByTwoColumn(Question2.class, "family.id", q2.getFamily().getId(), "year", year);
			if(qList != null && qList.size() > 0)
				q = qList.get(0);
			if (q == null) {
				q = new Question2();
				q.setCreateDate(new Date());
				q.setFamily(questionBiz.getEntityById(Family.class, q2.getFamily().getId()));
				Org org = (Org) ActionContext.getContext().getSession().get(WebConstants.SESS_USER_OBJ);
				q.setOrg(org);
				q.setYear(year);
				questionBiz.saveOrUpdateEntity(q);
			}
			q2 = q;
		}
		if(q2.getStatus()!=null && q2.getStatus().equals(1) ){
			msg = "该报表已经提交，如需修改请点击申请解锁";
		}else if(q2.getStatus()!=null && q2.getStatus().equals(2) ){
			msg = "该报表已解锁，可以填报";
		}
		return "edit2";
	}
	
	public String unlock2(){
		String[] id = (String[]) ActionContext.getContext().getParameters().get("id");
		if(id != null && id.length > 0){
			Long i = Long.valueOf(id[0]);
			Question2 q2 = questionBiz.getEntityById(Question2.class, i);
			if(q2 != null){
				q2.setStatus(2);
				questionBiz.saveOrUpdateEntity(q2);
				this.setSucc("Y");
				this.setMsg("申请解锁成功，等待管理员回复");
			}
		}
		return list2();
	}

	public String save2() {
		if (q2 != null && q2.getId() != null) {
			
			for (int i = 1; i <= 47; i++) {
				if(q2.getItem(i) == null)
					q2.setItem(i, 0.0);
			}
			
			boolean pass = true;
			try {
				validateQ2();
			} catch (Exception e) {
				this.setMsg(e.getMessage());
				pass = false;
			}
			
			Question2 q = questionBiz.getEntityById(Question2.class, q2.getId());
			for (int i = 1; i <= 47; i++) {
				q.setItem(i, q2.getItem(i) == null ? 0 : q2.getItem(i));
			}
			q.setWriter(q2.getWriter());
			q.setDate(q2.getDate());
			
			String tmp = ServletActionContext.getRequest().getParameter("tmp");
			if(pass && !"Y".equals(tmp)){
				q.setStatus(1);
				this.setMsg("保存成功");
				this.setSucc("Y");
			}else if(pass){
				this.setMsg("暂存成功");
				this.setSucc("Y");
			}
			
			questionBiz.saveOrUpdateEntity(q);			
		}
		return edit2();
	}
	
	public void validateQ2() throws Exception{
		//当年家庭人均年收入=（工资收入+家庭生产经营收入+其他稳定性收入+转移性收入-家庭生产经营支出）÷家庭成员人数
		if(Math.floor(q2.getItem4())
				!=Math.floor((q2.getItem5()+q2.getItem6()+q2.getItem10()+q2.getItem17()-q2.getItem24())/q2.getItem2())){
			throw new RuntimeException("当年家庭人均年收入=（工资收入+家庭生产经营收入+其他稳定性收入+转移性收入-家庭生产经营支出）÷家庭成员人数");
		}
		
		//家庭生产经营收入=农业生产经营收入+工业建筑业生产经营收入+其他行业生产经营收入
		if(q2.getItem6() != (q2.getItem7()+q2.getItem8()+q2.getItem9())){
			throw new RuntimeException("家庭生产经营收入=农业生产经营收入+工业建筑业生产经营收入+其他行业生产经营收入");
		}
		
		////其他稳定性收入=财产性收入+退休养老金
		//if(q2.getItem10() != (q2.getItem11()+q2.getItem16())){
		//	throw new RuntimeException("其他稳定性收入=财产性收入+退休养老金");
		//}
		
		//其他稳定性收入=财产性收入+退休养老金
		if(q2.getItem10().intValue() != (q2.getItem11().intValue()+q2.getItem16().intValue())){
			throw new RuntimeException("其他稳定性收入=财产性收入+退休养老金");
		}
		
		//财产性收入=利息股息分红收入+出租物业收入+土地转让收入+其他财产收入
		if(q2.getItem11() != (q2.getItem12()+q2.getItem13()+q2.getItem14()+q2.getItem15())){
			throw new RuntimeException("财产性收入=利息股息分红收入+出租物业收入+土地转让收入+其他财产收入");
		}
		
		//转移性收入=亲友赠送+慰问金+抚恤救灾救济金+低保金+农业生产补贴和临时补贴+其他转移性收入
		if(q2.getItem17() != (q2.getItem18()+q2.getItem19()+q2.getItem20()+q2.getItem21()+q2.getItem22()+q2.getItem23())){
			throw new RuntimeException("转移性收入=亲友赠送+慰问金+抚恤救灾救济金+低保金+农业生产补贴和临时补贴+其他转移性收入");
		}
		
		//家庭生产经营支出=农业生产经营支出+工业建筑业生产经营支出+其他行业生产经营支出
		if(q2.getItem24() != (q2.getItem25()+q2.getItem26()+q2.getItem27())){
			throw new RuntimeException("家庭生产经营支出=农业生产经营支出+工业建筑业生产经营支出+其他行业生产经营支出");
		}
	}

	public String exportQ2() {
		if (q2 == null || q2.getId() == null || (q2 = questionBiz.getEntityById(Question2.class, q2.getId())) == null)
			return edit2();
		String filePath = null;
		try {
			filePath = questionBiz.getQ2ExcelReportFilePath(q2);
			if (filePath != null) {
				downloadFile = new FileInputStream(filePath);
				this.setMsg("q2");
			} else {
				this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
				return edit2();
			}
		} catch (Exception e) {
			logger.error("Excel文件生成失败，数据不完整或参数错误，请联系管理员", e);
			this.setMsg("Excel文件生成失败，数据不完整或参数错误，请联系管理员");
			return edit2();
		}
		return "excel";
	}
	
	public String uploadQuestion2() {
		String fileName = (String) ActionContext.getContext().getSession().get(WebConstants.SESS_IMAGE);
		if (fileName != null) {
			String msg = null;
			try {
				msg = questionBiz.importQuestion2(fileName);
				this.setSucc("Y");
				this.setMsg("数据导入成功\\n" + msg);
			} catch (Exception e) {
				e.printStackTrace();
				this.setMsg("数据导入失败\\n" + e.getMessage());
			}
		}
		return "upload2";
	}	

	public InputStream getDownloadFile() {
		return downloadFile;
	}

	public void setDownloadFile(InputStream downloadFile) {
		this.downloadFile = downloadFile;
	}

	public Question1 getQ1() {
		return q1;
	}

	public void setQ1(Question1 q1) {
		this.q1 = q1;
	}

	public Question2 getQ2() {
		return q2;
	}

	public void setQ2(Question2 q2) {
		this.q2 = q2;
	}

	public QuestionStatDO getQ() {
		return q;
	}

	public void setQ(QuestionStatDO q) {
		this.q = q;
	}

	public QuestionBiz getQuestionBiz() {
		return questionBiz;
	}

	public void setQuestionBiz(QuestionBiz questionBiz) {
		this.questionBiz = questionBiz;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

}
