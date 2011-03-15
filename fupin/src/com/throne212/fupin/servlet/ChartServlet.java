package com.throne212.fupin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.throne212.fupin.biz.FrontBiz;
import com.throne212.fupin.domain.Area;
import com.throne212.fupin.domain.Cun;
import com.throne212.fupin.domain.Zhen;

public class ChartServlet extends HttpServlet {

	private static FrontBiz frontBiz;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (frontBiz == null) {
			ApplicationContext ac = (ApplicationContext) request.getSession().getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			frontBiz = (FrontBiz) ac.getBean("frontBiz");
		}

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/xml;charset=utf-8");
		PrintWriter out = response.getWriter();

		StringBuffer sb = new StringBuffer("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");

		String type = request.getParameter("type");
		if ("area_cun".equals(type)) {
			Long areaId = Long.parseLong(request.getParameter("areaId"));
			Area area = frontBiz.getEntityById(Area.class, areaId);
			sb.append("<pie>");
			sb.append("<slice title=\"已对接\" pull_out=\"true\">" + frontBiz.getMappingCunSum(area) + "</slice>");
			sb.append("<slice title=\"对接中\" pull_out=\"false\">" + frontBiz.getNotMappingCunSum(area) + "</slice>");
			sb.append("</pie>");
		} else if ("area_family".equals(type)) {
			Long areaId = Long.parseLong(request.getParameter("areaId"));
			Area area = frontBiz.getEntityById(Area.class, areaId);
			sb.append("<pie>");
			sb.append("<slice title=\"已对接\" pull_out=\"true\">" + frontBiz.getMappingFamilySum(area) + "</slice>");
			sb.append("<slice title=\"对接中\" pull_out=\"false\">" + frontBiz.getNotMappingFamilySum(area) + "</slice>");
			sb.append("</pie>");
		} else if ("area_column".equals(type)) {
			Long areaId = Long.parseLong(request.getParameter("areaId"));
			Area area = frontBiz.getEntityById(Area.class, areaId);
			sb.append("<chart>");
			sb.append("<series>");
			List<Zhen> zhenList = frontBiz.getEntitiesByColumn(Zhen.class, "area", area);
			int i = 0;
			for(Zhen z : zhenList){
				sb.append("		<value xid=\""+(i++)+"\">"+z.getName()+"</value>");
			}
			sb.append("	</series>");
			sb.append("	<graphs>");
			sb.append("		<graph gid=\"1\">");
			i = 0;
			for(Zhen z : zhenList){
				sb.append("    	<value xid=\""+(i++)+"\" color=\"FF0F00\">"+frontBiz.getOrgSumInZhen(z)+"</value>");
			}
			sb.append("    </graph>");
			sb.append("</graphs>");
			sb.append("</chart>");
		}else if ("zhen_cun".equals(type)) {//镇
			Long zhenId = Long.parseLong(request.getParameter("zhenId"));
			Zhen zhen = frontBiz.getEntityById(Zhen.class, zhenId);
			sb.append("<pie>");
			sb.append("<slice title=\"已对接\" pull_out=\"true\">" + frontBiz.getMappingCunSum(zhen) + "</slice>");
			sb.append("<slice title=\"对接中\" pull_out=\"false\">" + frontBiz.getNotMappingCunSum(zhen) + "</slice>");
			sb.append("</pie>");
		} else if ("zhen_family".equals(type)) {
			Long zhenId = Long.parseLong(request.getParameter("zhenId"));
			Zhen zhen = frontBiz.getEntityById(Zhen.class, zhenId);
			sb.append("<pie>");
			sb.append("<slice title=\"已对接\" pull_out=\"true\">" + frontBiz.getMappingFamilySum(zhen) + "</slice>");
			sb.append("<slice title=\"对接中\" pull_out=\"false\">" + frontBiz.getNotMappingFamilySum(zhen) + "</slice>");
			sb.append("</pie>");
		} else if ("zhen_column".equals(type)) {
			Long zhenId = Long.parseLong(request.getParameter("zhenId"));
			Zhen zhen = frontBiz.getEntityById(Zhen.class, zhenId);
			sb.append("<chart>");
			sb.append("<series>");
			List<Cun> cunList = frontBiz.getEntitiesByColumn(Cun.class, "zhen", zhen);
			int i = 0;
			for(Cun z : cunList){
				sb.append("		<value xid=\""+(i++)+"\">"+z.getName()+"</value>");
			}
			sb.append("	</series>");
			sb.append("	<graphs>");
			sb.append("		<graph gid=\"1\">");
			i = 0;
			for(Cun z : cunList){
				sb.append("    	<value xid=\""+(i++)+"\" color=\"FF0F00\">"+frontBiz.getOrgSumInCun(z)+"</value>");
			}
			sb.append("    </graph>");
			sb.append("</graphs>");
			sb.append("</chart>");
		}

		out.print(sb.toString());
		out.flush();
		out.close();

	}
}
