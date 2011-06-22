<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>系统界面</title>
    <link href="Themes/basic.css" type="text/css" rel="stylesheet" />
    <link href="Themes/Layout.css" type="text/css" rel="stylesheet" />
    <script src="html/script/jquery.js"></script>
    <script>
    </script>
    <style>
    body{overflow: hidden;}
    </style>
</head>
<body oncontextmenu="return false" onselectstart="return false">
<div style="text-align: center;padding-top: 5px;">
	<a href="${game.url}" target="_blank"><img src="${game.image}" width="150" height="100"/></a>
	<br/>
	<a href="${game.url}" target="_blank">${game.title}</a>
	<br/>
	<span>${game.trans}</span>
	<br/>
	<span>${game.remark}</span>
</div>
</body>
</html>
