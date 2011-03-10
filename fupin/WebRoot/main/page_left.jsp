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
    <td style="background-image: url(&quot;../images/leftmu-01_r2_c1.gif&quot;);" id="imgIDLeft0201" valign="top" width="8" align="left" background="index.jsp_files/page_left.htm">&nbsp;</td>
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
		<div id="span_menu" style="top: 58px; left: 9px; height: 100%; width: 100%; z-index: 10; overflow-x: hidden; overflow-y: auto;" class="css_scroll"><table class="tab_3" width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr id="mytree_tab_0"><td id="mytree_tdId_0" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_0" onclick="mytree.switchTab(0)" style="" title="伸缩菜单" align="absmiddle">单位与干部维护 
 </td></tr><tr id="mytree_tab_1"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_1" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/bangfudanwei.jsp" onclick="mytree.clickNode(1)" target="mainFrame">单位信息维护</a> 
 </td></tr><tr id="mytree_tab_2"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_2" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/bangfuganbu.jsp" onclick="mytree.clickNode(2)" target="mainFrame">帮扶干部</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_3"><td id="mytree_tdId_3" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_3" onclick="mytree.switchTab(3)" style="" title="伸缩菜单" align="absmiddle">村帮扶维护 
 </td></tr><tr id="mytree_tab_4"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_4" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/cbangfucuoshi.jsp?cs=year" onclick="mytree.clickNode(4)" target="mainFrame">帮扶措施</a> 
 </td></tr><tr id="mytree_tab_5"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_5" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/cbangfuchengxiao.jsp" onclick="mytree.clickNode(5)" target="mainFrame">帮扶成效</a> 
 </td></tr><tr id="mytree_tab_6"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_6" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/pinkuncundangan.jsp" onclick="mytree.clickNode(6)" target="mainFrame">村图片管理</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_7"><td id="mytree_tdId_7" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_7" onclick="mytree.switchTab(7)" style="" title="伸缩菜单" align="absmiddle">户帮扶维护 
 </td></tr><tr id="mytree_tab_8"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_8" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/guihuadaohu.jsp" onclick="mytree.clickNode(8)" target="mainFrame">规划到户</a> 
 </td></tr><tr id="mytree_tab_9"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_9" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/tuopinzhipin.jsp" onclick="mytree.clickNode(9)" target="mainFrame">贫困原因</a> 
 </td></tr><tr id="mytree_tab_10"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_10" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/manageHuBfcs.jsp" onclick="mytree.clickNode(10)" target="mainFrame">帮扶措施</a> 
 </td></tr><tr id="mytree_tab_11"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_11" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/daohujilu.jsp" onclick="mytree.clickNode(11)" target="mainFrame">到户记录（即扶持内容）</a> 
 </td></tr><tr id="mytree_tab_12"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_12" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/manageHuBfcx.jsp" onclick="mytree.clickNode(12)" target="mainFrame">帮扶成效</a> 
 </td></tr><tr id="mytree_tab_13"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_13" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/pinkunhudangan.jsp" onclick="mytree.clickNode(13)" target="mainFrame">户图片管理</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_14"><td id="mytree_tdId_14" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_14" onclick="mytree.switchTab(14)" style="" title="伸缩菜单" align="absmiddle">报表管理 
 </td></tr><tr id="mytree_tab_15"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_15" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/dwjdbb.jsp" onclick="mytree.clickNode(15)" target="mainFrame">季度报表</a> 
 </td></tr><tr id="mytree_tab_16"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_16" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/dwndbb.jsp" onclick="mytree.clickNode(16)" target="mainFrame">年度报表</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_17"><td id="mytree_tdId_17" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_17" onclick="mytree.switchTab(17)" style="" title="伸缩菜单" align="absmiddle">成效评估 
 </td></tr><tr id="mytree_tab_18"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_18" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/cxpgtone.jsp" onclick="mytree.clickNode(18)" target="mainFrame">表一</a> 
 </td></tr><tr id="mytree_tab_19"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_19" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/cxpgttwo.jsp" onclick="mytree.clickNode(19)" target="mainFrame">表二</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_20"><td id="mytree_tdId_20" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/reauditApply.jsp" onclick="mytree.clickNode(20)" target="mainFrame">重审申请</a> 
 </td></tr><tr id="mytree_tab_21"><td id="mytree_tdId_21" class=""><img src="page_left_data/tree_-_mid.gif" id="mytree_img_21" onclick="mytree.switchTab(21)" style="" title="伸缩菜单" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/yonghuguanli.jsp" onclick="mytree.clickNode(21)" target="mainFrame">帐号维护</a> 
 </td></tr><tr id="mytree_tab_22"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_22" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/common/chbfmanage/leaderuser.jsp" onclick="mytree.clickNode(22)" target="mainFrame">领导帐号</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_23"><td id="mytree_tdId_23" class=""><img src="page_left_data/tree_-_end.gif" id="mytree_img_23" onclick="mytree.switchTab(23)" style="" title="伸缩菜单" align="absmiddle">使用帮助 
 </td></tr><tr id="mytree_tab_24"><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" height="22"></td><td id="mytree_tdId_24" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/main.html" onclick="mytree.clickNode(24)" target="mainFrame">培训PPT下载</a> 
 </td></tr><tr id="mytree_tab_25"><td width="15" height="22"></td><td id="mytree_tdId_25" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.1.html" onclick="mytree.clickNode(25)" target="mainFrame">1.定义</a> 
 </td></tr><tr id="mytree_tab_26"><td width="15" height="22"></td><td id="mytree_tdId_26" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.2.html" onclick="mytree.clickNode(26)" target="mainFrame">2.帐号激活</a> 
 </td></tr><tr id="mytree_tab_27"><td width="15" height="22"></td><td id="mytree_tdId_27" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.3.html" onclick="mytree.clickNode(27)" target="mainFrame">3.系统主菜单</a> 
 </td></tr><tr id="mytree_tab_28"><td width="15" height="22"></td><td id="mytree_tdId_28" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.4.html" onclick="mytree.clickNode(28)" target="mainFrame">4.帐号维护</a> 
 </td></tr><tr id="mytree_tab_29"><td width="15" height="22"></td><td id="mytree_tdId_29" class=""><img src="page_left_data/tree_t_mid.gif" id="mytree_img_29" onclick="mytree.switchTab(29)" style="" title="伸缩菜单" align="absmiddle">5.单位与干部维护 
 </td></tr><tr id="mytree_tab_30" style="display: none;"><td width="15"></td><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_30" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.5.1.html" onclick="mytree.clickNode(30)" target="mainFrame">5.1.单位信息维护</a> 
 </td></tr><tr id="mytree_tab_31"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_31" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.5.2.html" onclick="mytree.clickNode(31)" target="mainFrame">5.2.帮扶干部</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_32"><td width="15" height="22"></td><td id="mytree_tdId_32" class=""><img src="page_left_data/tree_t_mid.gif" id="mytree_img_32" onclick="mytree.switchTab(32)" style="" title="伸缩菜单" align="absmiddle">6.村帮扶维护 
 </td></tr><tr id="mytree_tab_33" style="display: none;"><td width="15"></td><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_33" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.6.1.html" onclick="mytree.clickNode(33)" target="mainFrame">6.1.贫困村档案</a> 
 </td></tr><tr id="mytree_tab_34"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_34" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.6.2.html" onclick="mytree.clickNode(34)" target="mainFrame">6.2.帮扶措施</a> 
 </td></tr><tr id="mytree_tab_35"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_35" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.6.3.html" onclick="mytree.clickNode(35)" target="mainFrame">6.3.帮扶成效</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_36"><td width="15" height="22"></td><td id="mytree_tdId_36" class=""><img src="page_left_data/tree_t_mid.gif" id="mytree_img_36" onclick="mytree.switchTab(36)" style="" title="伸缩菜单" align="absmiddle">7.户帮扶维护 
 </td></tr><tr id="mytree_tab_37" style="display: none;"><td width="15"></td><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_37" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.1.html" onclick="mytree.clickNode(37)" target="mainFrame">7.1.规划到户</a> 
 </td></tr><tr id="mytree_tab_38"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_38" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.2.html" onclick="mytree.clickNode(38)" target="mainFrame">7.2.贫困原因</a> 
 </td></tr><tr id="mytree_tab_39"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_39" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.3.html" onclick="mytree.clickNode(39)" target="mainFrame">7.3.帮扶措施</a> 
 </td></tr><tr id="mytree_tab_40"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_40" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.4.html" onclick="mytree.clickNode(40)" target="mainFrame">7.4.扶持内容</a> 
 </td></tr><tr id="mytree_tab_41"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_41" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.5.html" onclick="mytree.clickNode(41)" target="mainFrame">7.5.帮扶成效</a> 
 </td></tr><tr id="mytree_tab_42"><td width="15" background="page_left_data/tree_bg.gif" height="22"></td><td id="mytree_tdId_42" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.7.6.html" onclick="mytree.clickNode(42)" target="mainFrame">7.6.贫困户档案</a> 
 </td></tr></tbody></table></td></tr><tr id="mytree_tab_43"><td width="15" height="22"></td><td id="mytree_tdId_43" class=""><img src="page_left_data/tree_t_end.gif" id="mytree_img_43" onclick="mytree.switchTab(43)" style="" title="伸缩菜单" align="absmiddle">8.报表管理 
 </td></tr><tr id="mytree_tab_44" style="display: none;"><td width="15"></td><td>    <table width="100%" border="0" cellpadding="0" cellspacing="0"><tbody><tr><td width="15" height="22"></td><td id="mytree_tdId_44" class=""><img src="page_left_data/tree_mid.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.8.1.html" onclick="mytree.clickNode(44)" target="mainFrame">8.1.季度报表</a> 
 </td></tr><tr id="mytree_tab_45"><td width="15" height="22"></td><td id="mytree_tdId_45" class=""><img src="page_left_data/tree_end.gif" align="absmiddle"><a href="http://210.76.65.67:6792/fpxmadmin/5/help/help2.8.2.html" onclick="mytree.clickNode(45)" target="mainFrame">8.2.年度报表</a> 
 </td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table></div>
		<!--div id="span_menu"  style="position:absolute;top:58px;left:9px;width:100%;z-index:10;overflow:hidden;clip:rect(0 auto auto 0)"></div-->
		</td>
      </tr>
     <tr>
        <td class="tab_2" align="right" height="20">&nbsp;</td>
      </tr>
</tbody></table>
<!--///////////////-->
	</td>
    <td style="background-image: url(&quot;../images/leftmu-01_r2_c4.gif&quot;);" id="imgIDLeft0204" title="点击这里隐藏菜单" width="14" align="right" background="index.jsp_files/page_left.htm"></td>
  </tr>
  <tr valign="bottom"> 
    <td width="8" align="left"><img src="page_left_data/leftmu-01_r3_c1.gif" id="imgIDLeft0301" width="8" height="19"></td>
    <td style="background-image: url(&quot;../images/leftmu-01_r3_c2.gif&quot;);" id="imgIDLeft0302" colspan="2" align="left" height="19">&nbsp;</td>
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
	//global_click = getClickLoading(mytree.DeptList[inum].nodeName)  //noted by bigguo 
	//if(top.document.all.displaySelectLayer.style.display == ''){
			//global_click = false;
			//return;
	//}		
	//top.ClickLoading()
	//global_click = true;
	//document.body.style.cursor = '../image/test.ani';
	if(global_click){
		flag_inum=inum;
		if(parent.locationFrame && parent.locationFrame.addExplorer)
			parent.locationFrame.addExplorer(inum,menuArray);	
	}
	return global_click;
}

function images_update(){	
	imgIDLeft0102.style.backgroundImage='url('+golobal_image_path+'/leftmu-01_r1_c2.gif)';
	imgIDLeft0121.style.backgroundImage='url('+golobal_image_path+'/leftmu-01_r1_c2.gif)';
	imgIDLeft0201.style.backgroundImage='url('+golobal_image_path+'/leftmu-01_r2_c1.gif)';
	imgIDLeft0204.style.backgroundImage='url('+golobal_image_path+'/leftmu-01_r2_c4.gif)';
	imgIDLeft0302.style.backgroundImage='url('+golobal_image_path+'/leftmu-01_r3_c2.gif)';
	
	imgIDLeft0101.src=golobal_image_path+'/leftmu-01_r1_c1.gif';
	imgIDLeft0103.src=golobal_image_path+'/leftmu-01_r1_c3.gif';
	imgIDLeft0104.src=golobal_image_path+'/leftmu-01_r1_c4.gif';
	imgIDLeft0301.src=golobal_image_path+'/leftmu-01_r3_c1.gif';
	imgIDLeft0304.src=golobal_image_path+'/leftmu-01_r3_c4.gif';
} 



	var flag_inum=0;//保存定位的数值
	var menuArray=new Array();
	
	window.quanxian=5;
	
	if(window.quanxian=='5')
	{
		menuArray[menuArray.length]="0,单位与干部维护,";
		menuArray[menuArray.length]="1,单位信息维护,org/org_edit.htm";
		menuArray[menuArray.length]="1,帮扶干部,test.htm";
		menuArray[menuArray.length]="0,镇帮扶维护";
        menuArray[menuArray.length]="1,帮扶措施,cbangfucuoshi.jsp?cs=year";
		menuArray[menuArray.length]="1,帮扶成效,cbangfuchengxiao.jsp";
		menuArray[menuArray.length]="1,镇图片管理,pinkuncundangan.jsp";
		menuArray[menuArray.length]="0,村帮扶维护";
        menuArray[menuArray.length]="1,帮扶措施,cbangfucuoshi.jsp?cs=year";
		menuArray[menuArray.length]="1,帮扶成效,cbangfuchengxiao.jsp";
		menuArray[menuArray.length]="1,村图片管理,pinkuncundangan.jsp";
        menuArray[menuArray.length]="0,户帮扶维护";
        menuArray[menuArray.length]="1,规划到户,guihuadaohu.jsp";
        menuArray[menuArray.length]="1,贫困原因,tuopinzhipin.jsp";
        menuArray[menuArray.length]="1,帮扶措施,manageHuBfcs.jsp";
        menuArray[menuArray.length]="1,到户记录（即扶持内容）,daohujilu.jsp";
		menuArray[menuArray.length]="1,帮扶成效,manageHuBfcx.jsp";
		menuArray[menuArray.length]="1,户图片管理,pinkunhudangan.jsp";
		menuArray[menuArray.length]="0,报表管理,";
        menuArray[menuArray.length]="1,季度报表,dwjdbb.jsp";
		menuArray[menuArray.length]="1,年度报表,dwndbb.jsp";
		
		menuArray[menuArray.length]="0,成效评估,";
        menuArray[menuArray.length]="1,表一,cxpgtone.jsp";
		menuArray[menuArray.length]="1,表二,cxpgttwo.jsp";
		
		menuArray[menuArray.length]="0,重审申请,reauditApply.jsp";
        //menuArray[menuArray.length]="0,帐号维护,yonghuguanli.jsp";
        //menuArray[menuArray.length]="1,领导帐号,../common/chbfmanage/leaderuser.jsp"; 
        ////HELP:
	    menuArray[menuArray.length]="0,使用帮助,";
	    menuArray[menuArray.length]="1,培训PPT下载,./help/main.html"; 	
	    menuArray[menuArray.length]="1,1.定义,./help/help2.1.html";
	    menuArray[menuArray.length]="1,2.帐号激活,./help/help2.2.html";
	    menuArray[menuArray.length]="1,3.系统主菜单,./help/help2.3.html";
	    menuArray[menuArray.length]="1,4.帐号维护,./help/help2.4.html";
	    menuArray[menuArray.length]="1,5.单位与干部维护,";
	    menuArray[menuArray.length]="2,5.1.单位信息维护,./help/help2.5.1.html";
	    menuArray[menuArray.length]="2,5.2.帮扶干部,./help/help2.5.2.html";
	    menuArray[menuArray.length]="1,6.村帮扶维护,";
	    menuArray[menuArray.length]="2,6.1.贫困村档案,./help/help2.6.1.html";
	    menuArray[menuArray.length]="2,6.2.帮扶措施,./help/help2.6.2.html";
	    menuArray[menuArray.length]="2,6.3.帮扶成效,./help/help2.6.3.html";
	    menuArray[menuArray.length]="1,7.户帮扶维护,";
	    menuArray[menuArray.length]="2,7.1.规划到户,./help/help2.7.1.html";
	    menuArray[menuArray.length]="2,7.2.贫困原因,./help/help2.7.2.html";
	    menuArray[menuArray.length]="2,7.3.帮扶措施,./help/help2.7.3.html";
	    menuArray[menuArray.length]="2,7.4.扶持内容,./help/help2.7.4.html";
	    menuArray[menuArray.length]="2,7.5.帮扶成效,./help/help2.7.5.html";
	    menuArray[menuArray.length]="2,7.6.贫困户档案,./help/help2.7.6.html";
	    menuArray[menuArray.length]="1,8.报表管理,";
	    menuArray[menuArray.length]="2,8.1.季度报表,./help/help2.8.1.html";
	    menuArray[menuArray.length]="2,8.2.年度报表,./help/help2.8.2.html";
	    //menuArray[24]="2,2.帐号激活,./help/help2.2.html";	
	    menuArray[menuArray.length]="0,密码修改,${appPath}main/password/password_edit.jsp";
	    menuArray[menuArray.length]="0,基础数据维护,";
	    menuArray[menuArray.length]="1,地区信息维护,${appPath}diqu_diquList.action";
	    menuArray[menuArray.length]="1,市级账号管理,${appPath}admin_shiWorkOrgList.action";
	    menuArray[menuArray.length]="1,区县级账号管理,${appPath}admin_areaWorkOrgList.action";
	    menuArray[menuArray.length]="1,镇级账号管理,${appPath}admin_zhenWorkOrgList.action";
	    menuArray[menuArray.length]="1,指定镇扶贫,${appPath}zhen_bf_zhenBFList.action";
	    menuArray[menuArray.length]="1,贫困户资料维护,${appPath}family_familyList.action";
	    menuArray[menuArray.length]="0,扶贫单位管理,";
	    menuArray[menuArray.length]="1,单位管理员账号,${appPath}manager_managerList.action";
	    menuArray[menuArray.length]="1,单位的村帮扶指定,${appPath}manager_managerMappingList.action";
	    menuArray[menuArray.length]="0,报表审核,";
	    
	}
	//document.all.span_menu.innerHTML=showMenu(menuArray); 
	var mytree = new DepartTree('mytree')
	mytree.imagePath    = '../images/';
	mytree.IsScroll     = false;
	mytree.addArray(menuArray);
	//mytree.switchDepartAll('display');
	mytree.display();
	mytree.switchTab(0);
	mytree.switchTab(0);

	images_update();


document.body.onclick = getBodyClick;
</script>
</body></html>