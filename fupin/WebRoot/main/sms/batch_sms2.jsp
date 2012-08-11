<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>选取联系人</title>
		<link href="${appPath}main/main_data/manage.css" rel="stylesheet">
		<link rel="stylesheet" href="${appPath}css/screen.css" />
		<link rel="stylesheet" href="${appPath}css/jquery.treeview.css" />
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script src="${appPath}js/validateForm.js" language="javascript"></script>
		<script src="${appPath}js/sel_style.js" language="javascript"></script>
		<script src="${appPath}js/common.js" language="javascript"></script>
		<script src="${appPath}js/jquery.cookie.js" type="text/javascript"></script>
		<script src="${appPath}js/jquery.treeview.js" type="text/javascript"></script>
		<script src="${appPath}js/jquery.treeview.async.js" type="text/javascript"></script>
		<script>
			function initTrees() {		
				$("#mixed").treeview({
					url: "${appPath}tree.servlet",
					// add some additional, dynamic data and request with POST
					ajax: {
						data: {
							"additional": function() {
								return "yeah: " + new Date;
							}
						},
						type: "get"
					},
					animated: "medium",
					control:"#sidetreecontrol",
					persist: "location"
				});
			}
			$(document).ready(function(){
				initTrees();
			});
		</script>
	</head>
	<body>
		<form method="get" action="${appPath}sms_sendBatchSMS.action" name="">
			<ul id="mixed">
			</ul>
		</form>
	</body>
</html>