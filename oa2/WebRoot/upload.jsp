<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title></title>
		<script src="js/jquery.js"></script>
        <style type="text/css">    
	        html {
	            height: 100%;
	            overflow: hidden;
	            font: 12px/1.5 Tahoma,Helvetica,Arial,sans-serif;
	        }
	        body {margin:0;padding:0;}
	        
        </style>
		<script>
        </script>
    </head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="photo" enctype="multipart/form-data" >
	<img src="images/nophoto.jpg" style="display: block;margin:0 auto; height: 100px; width: 100px;"/>
	<input type="file" name="myfile" size="1" class="tx1" value="" /><input type="submit" value="上传"/>
</form>
</body>
</html>

