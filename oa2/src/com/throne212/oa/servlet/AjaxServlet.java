package com.throne212.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.throne212.oa.dao.DropdownListDao;
import com.throne212.oa.domain.doctor.DropdownList;

public class AjaxServlet extends HttpServlet {

	private static DropdownListDao dropdownDao = new DropdownListDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dropdownType = request.getParameter("dropdownType");
		response.setContentType("text/plain;charset=GBK");
		response.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();
		if (dropdownType != null && !"".equals(dropdownType)) {
			List list = (List) request.getSession().getServletContext().getAttribute(dropdownType);
			if (list == null) {
				list = dropdownDao.getDropdownList(dropdownType);
				request.getSession().getServletContext().setAttribute(dropdownType, list);
			}
			if (list != null && list.size() > 0) {
				JSONArray arr = new JSONArray();
				for (int i = 0; i < list.size(); i++) {
					DropdownList drop = (DropdownList) list.get(i);
					JSONObject obj = new JSONObject();
					obj.put("id", drop.getId());
					obj.put("name", drop.getName());
					arr.add(obj);
				}
				out.print(arr.toString());
			}
		}
		out.flush();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
