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