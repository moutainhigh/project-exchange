<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html><head>


<link href="page_top_data/style.css" rel="stylesheet" type="text/css"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 系统菜单 </title> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right:0px;
	margin-bottom:0px;
}
-->
</style>
</head><body>
<script src="page_left_data/menu_depart.js"></script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="100%">
  <tbody><tr> 
    <td valign="top" width="8" align="left" height="32"><img src="page_left_data/leftmu-01_r1_c1.gif" id="imgIDLeft0101"></td>
    <td style="background-image: url(&quot;../images/leftmu-01_r1_c2.gif&quot;);" id="imgIDLeft0102" valign="top" width="100%" align="left"></td>
    <td style="background-image: url(&quot;../images/leftmu-01_r1_c2.gif&quot;);" id="imgIDLeft0121" valign="top" align="right"><img src="page_left_data/leftmu-01_r1_c3.gif" id="imgIDLeft0103"></td>
    <td valign="top" align="right"><img src="page_left_data/leftmu-01_r1_c4.gif" id="imgIDLeft0104"></td>
  </tr>
  <tr> 
    <td style="background-image: url(../images/leftmu-01_r2_c1.gif);" id="imgIDLeft0201" valign="top" width="8" align="left" background="index.jsp_files/page_left.htm">&nbsp;</td>
    <td colspan="2" valign="top" align="left">
<!--////////////////-->
<table class="tab_1" width="100%" border="0" cellpadding="0" cellspacing="1" height="100%">
      <tbody><tr>
        <td align="right" height="20">
		<img src="page_left_data/menu_shen.gif" style="" alt="将菜单全部展开" onclick="mytree.switchAll()" width="18" height="18"><img src="page_left_data/menu_close.gif" style="" alt="关闭或者打开左边菜单窗口" onclick="parent.middenFrame.Win_left()" width="18" height="18">&nbsp;</td>
      </tr>
      <tr class="tab_3">
        <td id="tabId_menulist" valign="top" height="100%">
		<!--显示菜单内容区域-->
		<div id="span_menu" style="top: 58px; left: 9px; height: 100%; width: 100%; z-index: 10; overflow-x: hidden; overflow-y: auto;" class="css_scroll"></div>
		<!--div id="span_menu"  style="position:absolute;top:58px;left:9px;width:100%;z-index:10;overflow:hidden;clip:rect(0 auto auto 0)"></div-->
		</td>
      </tr>
     <tr>
        <td class="tab_2" align="right" height="20">&nbsp;</td>
      </tr>
</tbody></table>
<!--///////////////-->
	</td>
    <td style="background-image: url(../images/leftmu-01_r2_c4.gif);" id="imgIDLeft0204" title="点击这里隐藏菜单" width="14" align="right" background="index.jsp_files/page_left.htm"></td>
  </tr>
  <tr valign="bottom"> 
    <td width="8" align="left"><img src="page_left_data/leftmu-01_r3_c1.gif" id="imgIDLeft0301" width="8" height="19"></td>
    <td style="background-image: url(../images/leftmu-01_r3_c2.gif);" id="imgIDLeft0302" colspan="2" align="left" height="19">&nbsp;</td>
    <td width="14" align="right"><img src="page_left_data/leftmu-01_r3_c4.gif" id="imgIDLeft0304" width="14" height="19"></td>
  </tr>
</tbody></table>
<script language="javascript">
//----
var global_click = true;
var golobal_image_path="../images";
function getBodyClick(){//如果其他页面没有加载，点击就无效
	if(!global_click)
		self.event.returnValue=false;
}
function getClickNode(inum){
	if(global_click){
		flag_inum=inum;
		if(parent.locationFrame && parent.locationFrame.addExplorer)
			parent.locationFrame.addExplorer(inum,menuArray);	
	}
	return global_click;
}

var flag_inum=0;//保存定位的数值
var menuArray=new Array();

window.quanxian=5;

if(window.quanxian=='5')
{
	menuArray[menuArray.length]="0,目录1,";
	menuArray[menuArray.length]="1,菜单项目1,${appPath}report_viewReport1.action";
	menuArray[menuArray.length]="0,目录2,${appPath}report_viewReport2.action";
	menuArray[menuArray.length]="0,目录3,";
	menuArray[menuArray.length]="1,菜单项目2,${appPath}org_editOrg.action";
	menuArray[menuArray.length]="1,菜单项目3,${appPath}org_leaderList.action";
}
var mytree = new DepartTree('mytree')
mytree.imagePath    = '../images/';
mytree.IsScroll     = false;
mytree.addArray(menuArray);
mytree.display();
mytree.switchTab(0);
mytree.switchTab(0);


document.body.onclick = getBodyClick;
</script>
</body></html>