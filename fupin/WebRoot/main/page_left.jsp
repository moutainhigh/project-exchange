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
		<div id="span_menu" style="top: 58px; left: 9px; height: 100%; width: 100%; z-index: 10; overflow-x: hidden; overflow-y: auto;" class="css_scroll"><table class="tab_3" width="100%" border="0" cellpadding="0" cellspacing="0"><tbody></tbody></table></td></tr></tbody></table></div>
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
	try{
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
	}catch(e){}
} 



	var flag_inum=0;//保存定位的数值
	var menuArray=new Array();
	
	window.quanxian=5;
	
	if(window.quanxian=='5')
	{
	
		<c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
	    menuArray[menuArray.length]="0,考评调查表资料维护,";
	    menuArray[menuArray.length]="1,2011年度考评调查表（一）,${appPath}question_list1.action?year=2011";
	    menuArray[menuArray.length]="1,2011年度考评调查表（二）,${appPath}question_list2.action?year=2011";
	    menuArray[menuArray.length]="1,2012年度考评调查表（一）,${appPath}question_list1.action?year=2012";
	    menuArray[menuArray.length]="1,2012年度考评调查表（二）,${appPath}question_list2.action?year=2012";
	    menuArray[menuArray.length]="1,申请修改,${appPath}question_lockList.action";
	    menuArray[menuArray.length]="0,考评调查表统计,";
	    menuArray[menuArray.length]="1,2011年度考评调查表（一）统计,${appPath}question_stat1.action?year=2011";
	    menuArray[menuArray.length]="1,2011年度考评调查表（二）统计,${appPath}question_stat2.action?year=2011";
	    menuArray[menuArray.length]="1,2012年度考评调查表（一）统计,${appPath}question_stat1.action?year=2012";
	    menuArray[menuArray.length]="1,2012年度考评调查表（二）统计,${appPath}question_stat2.action?year=2012";
	    menuArray[menuArray.length]="1,考评调查表（一）填报情况,${appPath}question_state1.action";
	    menuArray[menuArray.length]="1,考评调查表（二）填报情况,${appPath}question_state2.action";
	    </c:if>
	    
	    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	    menuArray[menuArray.length]="0,考评调查表填报,";
	    menuArray[menuArray.length]="1,2011年度考评调查表（一）,${appPath}questionOrg_edit1.action?year=2011";
	    menuArray[menuArray.length]="1,2011年度考评调查表（二）,${appPath}questionOrg_list2.action?year=2011";
	    menuArray[menuArray.length]="1,2012年度考评调查表（一）,${appPath}questionOrg_edit1.action?year=2012";
	    menuArray[menuArray.length]="1,2012年度考评调查表（二）,${appPath}questionOrg_list2.action?year=2012";
	    </c:if>
	    
	    
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
	    menuArray[menuArray.length]="0,扶贫资金报表,";
	    menuArray[menuArray.length]="1,双到资金,${appPath}zijin_list.action?type=1";
	    menuArray[menuArray.length]="1,镇建设资金,${appPath}zijin_list.action?type=2";
	    //menuArray[menuArray.length]="1,申请修改,${appPath}zijin_lockList.action";	    
	    </c:if>
	    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	    menuArray[menuArray.length]="0,扶贫资金报表填报,";
	    menuArray[menuArray.length]="1,双到资金,${appPath}zijin_edit.action?type=1";
	    menuArray[menuArray.length]="1,镇建设资金,${appPath}zijin_edit.action?type=2";
	    </c:if>
	
		menuArray[menuArray.length]="0,报表维护,";
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='县级管理员'}">
	    menuArray[menuArray.length]="1,报表导出,${appPath}report_export.action";
	    menuArray[menuArray.length]="1,报表填报情况,${appPath}report_state.action";
	    //menuArray[menuArray.length]="1,报表解锁,${appPath}report_reportList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="1,“双到”工作统计表,${appPath}report_stat.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	    menuArray[menuArray.length]="1,表一表二,${appPath}report_viewReport1.action";
		menuArray[menuArray.length]="1,表三,${appPath}report_viewReport2.action";
	    </c:if>
	    menuArray[menuArray.length]="1,贫困户类型统计,${appPath}stat_familyTypeList.action";
	    
	    //menuArray[menuArray.length]="0,党建报表维护,";
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='县级管理员'}">
	    //menuArray[menuArray.length]="1,党建报表导出,${appPath}dang_report_export.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    //menuArray[menuArray.length]="1,党建工作统计,${appPath}dang_report_stat.action";
	    //menuArray[menuArray.length]="1,党建报表解锁,${appPath}dang_report_reportList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	    //menuArray[menuArray.length]="1,党建报表填报,${appPath}dang_report_viewReport.action";
	    </c:if>
	    
	    //menuArray[menuArray.length]="0,民意调查表维护,";
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    //menuArray[menuArray.length]="1,民意调查表统计,${appPath}people_summary.action";
	    //menuArray[menuArray.length]="1,民意调查表解锁,${appPath}people_lockPeopleList.action";
	    //menuArray[menuArray.length]="1,民意调查表设置,${appPath}people_peopleSetting.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='帮扶单位管理员'}">
	    //menuArray[menuArray.length]="1,民意调查表填报,${appPath}people_peopleList.action";
	    </c:if>
	
		<c:if test="${userObj.roleType=='帮扶单位管理员'}">
		menuArray[menuArray.length]="0,单位与干部维护,";
		menuArray[menuArray.length]="1,单位信息维护,${appPath}org_editOrg.action";
		menuArray[menuArray.length]="1,帮扶干部,${appPath}org_leaderList.action";
		</c:if>
		<c:if test="${userObj.roleType=='县级管理员' && userObj.isDiv!='Y'}">
		//menuArray[menuArray.length]="0,镇帮扶维护";
        //menuArray[menuArray.length]="1,帮扶措施,${appPath}zhen_bf_cuoshiZhenList.action";
		//menuArray[menuArray.length]="1,帮扶成效,${appPath}zhen_bf_chengxiaoZhenList.action";
		//menuArray[menuArray.length]="1,镇图片管理,${appPath}zhen_bf_picZhenList.action";
		</c:if>
		<c:if test="${userObj.roleType=='帮扶单位管理员' || userObj.roleType=='县级管理员' || userObj.roleType=='超级管理员'}">
		menuArray[menuArray.length]="0,村帮扶维护";
        menuArray[menuArray.length]="1,帮扶措施,${appPath}cun_bf_cuoshiCunList.action";
		menuArray[menuArray.length]="1,帮扶成效,${appPath}cun_bf_chengxiaoCunList.action";
		menuArray[menuArray.length]="1,村图片管理,${appPath}cun_bf_picCunList.action";
        menuArray[menuArray.length]="0,户帮扶维护";
        menuArray[menuArray.length]="1,规划到户,${appPath}family_bf_familyMappingList.action";
        menuArray[menuArray.length]="1,贫困原因,${appPath}family_bf_reasonList.action";
        menuArray[menuArray.length]="1,帮扶措施,${appPath}family_bf_cuoshiFamilyList.action";
        menuArray[menuArray.length]="1,到户记录（即扶持内容）,${appPath}family_bf_recordList.action";
		menuArray[menuArray.length]="1,帮扶成效,${appPath}family_bf_chengxiaoFamilyList.action";
		menuArray[menuArray.length]="1,户图片管理,${appPath}family_bf_picFamilyList.action";
        
        ////HELP:
	    menuArray[menuArray.length]="0,使用帮助,./help.htm";
	    </c:if>
	    <%--
	    <c:if test="${userObj.roleType=='市级管理员' || userObj.roleType=='县级管理员' || userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="0,信息审核,";
	    </c:if>
	    
	    <c:if test="${userObj.roleType=='超级管理员'}">
	  	menuArray[menuArray.length]="1,镇帮扶审核,";
        menuArray[menuArray.length]="2,镇措施审核,${appPath}shenhe_showAllCuoshiZhenInPro.action";
		menuArray[menuArray.length]="2,镇成效审核,${appPath}shenhe_showAllChengxiaoZhenInPro.action";
		menuArray[menuArray.length]="2,镇图片审核,${appPath}shenhe_showAllPicZhenInPro.action";
		</c:if>
		<c:if test="${userObj.roleType=='市级管理员' || userObj.roleType=='县级管理员' || userObj.roleType=='超级管理员'}">
		menuArray[menuArray.length]="1,村帮扶审核,";
        menuArray[menuArray.length]="2,村措施审核,${appPath}shenhe_showAllCuoshiCunInPro.action";
		menuArray[menuArray.length]="2,村成效审核,${appPath}shenhe_showAllChengxiaoCunInPro.action";
		menuArray[menuArray.length]="2,村图片审核,${appPath}shenhe_showAllPicCunInPro.action";
		
		menuArray[menuArray.length]="1,户帮扶审核,";
        menuArray[menuArray.length]="2,户措施审核,${appPath}shenhe_showAllCuoshiFamilyInPro.action";
		menuArray[menuArray.length]="2,户成效审核,${appPath}shenhe_showAllChengxiaoFamilyInPro.action";
		menuArray[menuArray.length]="2,户图片审核,${appPath}shenhe_showAllPicFamilyInPro.action";
		menuArray[menuArray.length]="2,贫困原因审核,${appPath}shenhe_showAllReasonInPro.action";
		menuArray[menuArray.length]="2,帮扶记录审核,${appPath}shenhe_showAllRecordInPro.action";
		
		menuArray[menuArray.length]="1,修改申请,${appPath}recheck_listRecheck.action";
		</c:if>
		--%>
		
	    menuArray[menuArray.length]="0,密码修改,${appPath}main/password/password_edit.jsp";
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
	    menuArray[menuArray.length]="0,修改申请审核,${appPath}recheck_listRecheck.action";
	    menuArray[menuArray.length]="0,基础数据维护,";
	    <c:if test="${userObj.roleType=='超级管理员' || (userObj.roleType=='县级管理员' && userObj.isDiv=='Y')}">
	    menuArray[menuArray.length]="1,地区信息维护,${appPath}diqu_diquList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="1,一级账号管理,${appPath}admin_shiWorkOrgList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='市级管理员'}">
	    menuArray[menuArray.length]="1,二级账号管理,${appPath}admin_areaWorkOrgList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员' || userObj.roleType=='县级管理员'}">
	    menuArray[menuArray.length]="1,三级账号管理,";
	    menuArray[menuArray.length]="2,镇级扶贫办账号管理,${appPath}admin_zhenWorkOrgList.action";
	    menuArray[menuArray.length]="2,区驻镇工作组账号管理,${appPath}team_teamList.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    //menuArray[menuArray.length]="1,指定镇扶贫,${appPath}zhen_bf_zhenBFList.action";
	    </c:if>
	    menuArray[menuArray.length]="0,帮扶单位管理,";
	    menuArray[menuArray.length]="1,单位管理员账号,${appPath}manager_managerList.action";
	    menuArray[menuArray.length]="1,单位的村帮扶指定,${appPath}manager_managerMappingList.action";
	    //menuArray[menuArray.length]="1,单位所属地区管理,${appPath}manager_managerList.action";
	    </c:if>
	    
	    menuArray[menuArray.length]="0,贫困村户资料维护,";
	    menuArray[menuArray.length]="1,贫困村资料维护,${appPath}cun_cunList.action";
	    menuArray[menuArray.length]="1,贫困户资料维护,${appPath}family_familyList.action";

	    <c:if test="${userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="0,设置前台贫困户查看权限,${appPath}admin_perList.action";
	    menuArray[menuArray.length]="0,报表解锁,${appPath}report_reportList.action";
	    </c:if>
	    //menuArray[menuArray.length]="0,报表审核,";
	    <c:if test="${userObj.roleType=='市级管理员' || userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="0,咨询信息,";
	    menuArray[menuArray.length]="1,咨询信息审核,${appPath}zixun_zixunList.action";
	    menuArray[menuArray.length]="1,咨询信息回复,${appPath}zixun_zixunListPass.action";
	    </c:if>
	    
	    menuArray[menuArray.length]="0,通知公告,${appPath}mes_getAllMessageToUser.action";
	    
	    <c:if test="${userObj.roleType!='帮扶单位管理员'}">
	    menuArray[menuArray.length]="0,短信服务,";
	    menuArray[menuArray.length]="1,短信发送,${appPath}sms_getAllSMS.action";
	    //menuArray[menuArray.length]="1,通讯录组,${appPath}group_groupList.action";
	    //menuArray[menuArray.length]="1,通讯录,${appPath}contact_queryContact.action";
	    <c:if test="${userObj.roleType=='镇级管理员' || userObj.roleType=='县级管理员' || userObj.roleType=='市级管理员' || userObj.roleType=='扶贫工作组'}">
	    menuArray[menuArray.length]="1,单位联系电话维护,${appPath}admin_userContacts.action";
	    </c:if>
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    menuArray[menuArray.length]="1,批量短信,${appPath}sms_batchSMS.action";
	    menuArray[menuArray.length]="1,批量短信发送记录,${appPath}sms_batchList.action";
	    </c:if>
	    </c:if>
	    
	    //menuArray[menuArray.length]="0,论坛交流,${appPath}dis_getAllDiscuss.action";
	    menuArray[menuArray.length]="0,扶贫内部论坛,${appPath}main/bbs/login_bbs.jsp";
	    <c:if test="${userObj.roleType=='超级管理员'}">
	    //menuArray[menuArray.length]="0,登录管理,${BBS_Path}jeeadmin/jeebbs/index.do";
	     </c:if>
	    
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