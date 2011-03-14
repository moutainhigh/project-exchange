<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>行政级别树</title>
		<link type="text/css" href="css/3col_leftNav.css" rel="stylesheet">
		<link href="css/jquery.treeview.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script type="text/javascript" src="js/jquery.treeview.js"></script>
		<script type="text/javascript" src="js/jquery.treeview.async.js"></script>
		<script type="text/javascript">
$(document).ready(function()
{
	$(".treeDetail").treeview({
		url: "servlet/AjaxPKC?type=cun"
	})
});
</script>
		<style type="text/css">
&
lt ;!--
.STYLE1 {
	color: #D6EAFF;
	font-weight: bold;
}
--&
gt
;
</style>
	</head>
	<body bgcolor="#d6eaff">
		<table height="100%" cellspacing="0" cellpadding="0" border="0" width="100%">
			<tbody>
				<tr height="100%" valign="top">
					<td>
						<br/>
						<div align="center">
							<a target="detailFrame" style="font-weight: bold;" href="session.jsp">规划到户情况</a>
						</div>
						<hr>
						<div>
							<ul bgcolor="#D6EAFF" class="treeDetail filetree treeview" style="font-size: 11pt; font-weight: bold;">
								<li id="440500000000" class="collapsable">
									<div class="hitarea hasChildren-hitarea  collapsable-hitarea"></div>
									<a target="detailFrame" href="session.jsp?id=440500000000" class=""><span class="folder">汕头市</span>
									</a>
									<ul style="display: block;">
										<li id="440512000000" class="hasChildren expandable">
											<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
											<a target="detailFrame" href="session.jsp?id=440512000000" class=""><span class="folder">濠江区</span>
											</a>
											<ul style="display: none;">
												<li id="placeholder" class="last">
													<span>placeholder</span>
												</li>
											</ul>
										</li>
										<li id="440513000000" class="collapsable">
											<div class="hitarea hasChildren-hitarea  collapsable-hitarea"></div>
											<a target="detailFrame" href="session.jsp?id=440513000000" class=""><span class="folder">潮阳区</span>
											</a>
											<ul style="display: block;">
												<li id="440513103000" class="collapsable">
													<div class="hitarea hasChildren-hitarea  collapsable-hitarea"></div>
													<a target="detailFrame" href="session.jsp?id=440513103000" class=""><span class="folder">西胪镇</span>
													</a>
													<ul style="display: block;">
														<li id="440513103220">
															<a target="detailFrame" href="session.jsp?detail=cun&amp;id=440513103220"><span class="file">里溪村委会</span>
															</a>
														</li>
														<li id="440513103221" class="last">
															<a target="detailFrame" href="session.jsp?detail=cun&amp;id=440513103221"><span class="file">尖山村委会</span>
															</a>
														</li>
													</ul>
												</li>
												<li id="440513110000" class="hasChildren expandable">
													<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
													<a target="detailFrame" href="session.jsp?id=440513110000" class=""><span class="folder">金灶镇</span>
													</a>
													<ul style="display: none;">
														<li id="placeholder" class="last">
															<span>placeholder</span>
														</li>
													</ul>
												</li>
												<li id="440513106000" class="hasChildren expandable lastExpandable">
													<div class="hitarea hasChildren-hitarea expandable-hitarea lastExpandable-hitarea "></div>
													<a target="detailFrame" href="session.jsp?id=440513106000" class=""><span class="folder">谷饶镇</span>
													</a>
													<ul style="display: none;">
														<li id="placeholder" class="last">
															<span>placeholder</span>
														</li>
													</ul>
												</li>
											</ul>
										</li>
										<li id="440514000000" class="hasChildren expandable">
											<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
											<a target="detailFrame" href="session.jsp?id=440514000000" class=""><span class="folder">潮南区</span>
											</a>
											<ul style="display: none;">
												<li id="placeholder" class="last">
													<span>placeholder</span>
												</li>
											</ul>
										</li>
										<li id="440523000000" class="hasChildren expandable lastExpandable">
											<div class="hitarea hasChildren-hitarea expandable-hitarea lastExpandable-hitarea "></div>
											<a target="detailFrame" href="session.jsp?id=440523000000" class=""><span class="folder">南澳县</span>
											</a>
											<ul style="display: none;">
												<li id="placeholder" class="last">
													<span>placeholder</span>
												</li>
											</ul>
										</li>
									</ul>
								</li>
								<li id="440200000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=440200000000" class=""><span class="folder">韶关市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441600000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441600000000" class=""><span class="folder">河源市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441400000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441400000000" class=""><span class="folder">梅州市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441300000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441300000000" class=""><span class="folder">惠州市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441500000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441500000000" class=""><span class="folder">汕尾市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="440700000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=440700000000" class=""><span class="folder">江门市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441700000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441700000000" class=""><span class="folder">阳江市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="440800000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=440800000000" class=""><span class="folder">湛江市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="440900000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=440900000000" class=""><span class="folder">茂名市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441200000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441200000000" class=""><span class="folder">肇庆市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="441800000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=441800000000" class=""><span class="folder">清远市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="445100000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=445100000000" class=""><span class="folder">潮州市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="445200000000" class="hasChildren expandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=445200000000" class=""><span class="folder">揭阳市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
								<li id="445300000000" class="hasChildren expandable lastExpandable">
									<div class="hitarea hasChildren-hitarea expandable-hitarea lastExpandable-hitarea "></div>
									<a target="detailFrame" href="session.jsp?id=445300000000" class=""><span class="folder">云浮市</span>
									</a>
									<ul style="display: none;">
										<li id="placeholder" class="last">
											<span>placeholder</span>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</td>
				</tr>
			</tbody>

		</table>
	</body>
</html>