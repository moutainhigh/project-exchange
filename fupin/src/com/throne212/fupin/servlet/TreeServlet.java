package com.throne212.fupin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.fupin.biz.AdminBiz;
import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.biz.OrgBiz;
import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Leader;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.UserContact;
import com.throne212.fupin.domain.WorkTeam;
import com.throne212.fupin.domain.Zhen;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class TreeServlet extends HttpServlet {

	private static FrontBiz frontBiz;

	private static AdminBiz adminBiz;

	private static OrgBiz orgBiz;

	private static String treeStr;

	private static long time;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (frontBiz == null) {
			ApplicationContext ac = (ApplicationContext) request.getSession().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			frontBiz = (FrontBiz) ac.getBean("frontBiz");
			adminBiz = (AdminBiz) ac.getBean("adminBiz");
			orgBiz = (OrgBiz) ac.getBean("orgBiz");
		}

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter out = response.getWriter();

		String reload = request.getParameter("reload");
		if (treeStr != null && "Y".equals(reload)) {
			// if(System.currentTimeMillis() - time < 30 * 60 * 1000){
			// out.print(treeStr);
			// }
			out.print(treeStr);
		} else {
			out.print(buildRst());
		}

		out.print("\n\r\ninit();");

		out.flush();
		out.close();

	}

	private String buildRst() {

		// 广州市
		TreeNode t = new TreeNode();
		t.setText("广州市");
		t.setValue("shi");
		t.setId("shi");
		t.setHasChildren(true);
		t.setIsexpand(true);
		List<UserContact> sContacts = adminBiz.getEntitiesByColumn(UserContact.class, "user.loginName", "gzs_admin");
		for (UserContact uc : sContacts) {
			TreeNode ut = new TreeNode();
			ut.setText(uc.getName());
			ut.setValue("shi_user_" + uc.getId());
			ut.setId("shi_user_" + uc.getId());
			ut.setHasChildren(false);
			ut.setIsexpand(false);
			t.getChildNodes().add(ut);
		}

		// 区县
		PageBean bean = adminBiz.getAreaWorkOrgBean(1);
		if (bean != null && bean.getResultList() != null && bean.getResultList().size() > 0) {
			List<AreaWorkOrg> newList = new ArrayList<AreaWorkOrg>();
			List<String> needList = new ArrayList<String>();
			needList.add("nsqfpb_admin");
			needList.add("zcfpb_admin");
			needList.add("lgqfpb_admin");
			needList.add("chfpb_admin");
			needList.add("baiyun");
			for (Object o : bean.getResultList()) {
				AreaWorkOrg areaWorkOrg = (AreaWorkOrg) o;
				if (needList.contains(areaWorkOrg.getLoginName())) {
					newList.add(areaWorkOrg);
				}
			}
			for (AreaWorkOrg a : newList) {// 区县数据
				Area area = a.getArea();
				TreeNode at = new TreeNode();
				at.setText(area.getName());
				at.setValue("area_" + area.getId());
				at.setId("area_" + area.getId());
				at.setHasChildren(true);
				at.setIsexpand(false);
				t.getChildNodes().add(at);

				// 扶贫办
				List<UserContact> aContacts = adminBiz.getEntitiesByColumn(UserContact.class, "user.id", a.getId());
				TreeNode at2 = new TreeNode();
				at2.setText(area.getName() + "扶贫办");
				at2.setValue("area_" + area.getId() + "_fpb_" + area.getId());
				at2.setId("area_" + area.getId() + "_fpb_" + area.getId());
				at2.setHasChildren(true);
				at2.setIsexpand(false);
				at.getChildNodes().add(at2);
				for (UserContact uc : aContacts) {
					if ("Y".equals(uc.getIsGroup()))
						continue;
					TreeNode ut = new TreeNode();
					ut.setText(uc.getName());
					ut.setValue("area_" + area.getId() + "_fpb_user_" + uc.getId());
					ut.setId("area_" + area.getId() + "_fpb_user_" + uc.getId());
					ut.setHasChildren(false);
					ut.setIsexpand(false);
					at2.getChildNodes().add(ut);
				}

				// 扶贫工作队
				if (area.getName().equals("增城市") || area.getName().equals("从化市")) {
					TreeNode at3 = new TreeNode();
					at3.setText(area.getName() + "扶贫工作队");
					at3.setValue("area_" + area.getId() + "_fpd_" + area.getId());
					at3.setId("area_" + area.getId() + "_fpd_" + area.getId());
					at3.setHasChildren(true);
					at3.setIsexpand(false);
					at.getChildNodes().add(at3);
					aContacts = adminBiz.getEntitiesByTwoColumn(UserContact.class, "user.id", a.getId(), "isGroup", "Y");
					for (UserContact uc : aContacts) {
						TreeNode ut = new TreeNode();
						ut.setText(uc.getName());
						ut.setValue("area_" + area.getId() + "_fpd_user_" + uc.getId());
						ut.setId("area_" + area.getId() + "_fpd_user_" + uc.getId());
						ut.setHasChildren(false);
						ut.setIsexpand(false);
						at3.getChildNodes().add(ut);
					}
				}

				// 镇
				List<ZhenWorkOrg> zList = adminBiz.getZhenWorkOrgList(a.getArea().getId());
				for (ZhenWorkOrg z : zList) {
					Zhen zhen = z.getZhen();
					TreeNode zt = new TreeNode();
					zt.setText(zhen.getName());
					zt.setValue("zhen_" + zhen.getId());
					zt.setId("zhen_" + zhen.getId());
					zt.setHasChildren(true);
					zt.setIsexpand(false);
					at.getChildNodes().add(zt);

					// 镇扶贫组
					WorkTeam team = adminBiz.getEntityByUnique(WorkTeam.class, "zhen.id", zhen.getId());
					if (team != null) {
						TreeNode zt2 = new TreeNode();
						zt2.setText(zhen.getName() + "扶贫工作组");
						zt2.setValue("zhen_gzz_" + zhen.getId());
						zt2.setId("zhen_gzz_" + zhen.getId());
						zt2.setHasChildren(true);
						zt2.setIsexpand(false);
						zt.getChildNodes().add(zt2);
						aContacts = adminBiz.getEntitiesByColumn(UserContact.class, "user.id", z.getId());
						for (UserContact uc : aContacts) {
							TreeNode ut = new TreeNode();
							ut.setText(uc.getName());
							ut.setValue("zhen_gzz_user_" + uc.getId());
							ut.setId("zhen_gzz_user_" + uc.getId());
							ut.setHasChildren(false);
							ut.setIsexpand(false);
							zt2.getChildNodes().add(ut);
						}
					}

					// 扶贫办
					TreeNode zt3 = new TreeNode();
					zt3.setText(zhen.getName() + "扶贫办");
					zt3.setValue("zhen_fpb_" + zhen.getId());
					zt3.setId("zhen_fpb_" + zhen.getId());
					zt3.setHasChildren(true);
					zt3.setIsexpand(false);
					zt.getChildNodes().add(zt3);
					aContacts = adminBiz.getEntitiesByColumn(UserContact.class, "user.id", z.getId());
					for (UserContact uc : aContacts) {
						TreeNode ut = new TreeNode();
						ut.setText(uc.getName());
						ut.setValue("zhen_fpb_user_" + uc.getId());
						ut.setId("zhen_fpb_user_" + uc.getId());
						ut.setHasChildren(false);
						ut.setIsexpand(false);
						zt3.getChildNodes().add(ut);
					}

					// 村
					List<Org> orgList = orgBiz.getAllOrg(z.getZhen().getId());
					for (Org org : orgList) {
						Cun cun = org.getCun();
						TreeNode ct = new TreeNode();
						ct.setText(cun.getName() + "(" + org.getOrgName() + ")");
						ct.setValue("cun_" + cun.getId());
						ct.setId("cun_" + cun.getId());
						ct.setHasChildren(true);
						ct.setIsexpand(false);
						zt.getChildNodes().add(ct);

						List<Leader> leaderList = orgBiz.getAllLeader(org);
						for (Leader l : leaderList) {
							TreeNode lt = new TreeNode();
							lt.setText(l.getLeaderName());
							lt.setValue("leader_" + l.getId());
							lt.setId("leader_" + l.getId());
							lt.setHasChildren(false);
							lt.setIsexpand(false);
							ct.getChildNodes().add(lt);
						}
					}
				}

			}
		}

		JSONObject shiObj = JSONObject.fromObject(t);
		JSONArray arr = new JSONArray();
		arr.add(shiObj);

		String rst = "var treedata = " + arr.toString();

		rst = rst.replaceAll("childNodes", "ChildNodes");

		time = System.currentTimeMillis();
		treeStr = rst;

		return rst;
	}
}
