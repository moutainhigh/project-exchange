<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${appTitle }</title>
</head>

<frameset rows="96,*,30" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="179,*" frameborder="no" border="0" framespacing="0">
		<frame src="main/page_left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frameset cols="5,*" frameborder="no" border="0" framespacing="0">
		  	<frame src="l1.html" name="leftFrame1" scrolling="no" noresize="noresize" id="leftFrame1" title="leftFrame1" />
			<frameset rows="30,*" frameborder="no" border="0" framespacing="0">
				<frame src="main/head.jsp" name="prmptFrame" id="prmptFrame" title="prmptFrame" />
				<frame src="main/main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
			</frameset>
		</frameset>
  </frameset>
  <frame src="bottom.html" name="bottomFrame" scrolling="no" noresize="noresize" id="bottomFrame" title="bottomFrame" />
</frameset>
<noframes><body>
</body>
</noframes></html>
