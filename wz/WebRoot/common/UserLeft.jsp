<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="fl w200 hide pad_r10 bsr_gray">
  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> 基本信息</p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">用户名：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mar_t3 pad_l10">${sessionScope.userObj.loginName}</span>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">昵称：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mar_t3 pad_l10">${sessionScope.userObj.nickName}</span>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei">用户类型：</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="mar_t3 pad_l10">${sessionScope.userObj.typeTxt}</span>
  <br/>
  <br/>
  <br/>
  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> 基本设置</p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/userInfo/UserInfoEdit.jsp">修改资料</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahe"><a href="${appPath}/userInfo/UserPwd.jsp"> 修改密码</a></p>
  <br/>
  <br/>
  <br/>
  <p class="yahei ft18 blue fb bdb_gray mar_t3 pad_b10"> 控制面板</p>
    <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/projectOutsourceInfo/ProjectOutsourceManage.jsp">项目管理</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei"><a href="${appPath}/customerAccountInfo/CustomerAccountManage.jsp">账户管理</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/RequestInfoAction_requestList.action">软件求购</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei"><a href="${appPath}/SupplyInfoAction_supplyList.action">软件供应</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/InvestmentAction_allInvestmentOfCust.action">投资合作</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei"><a href="${appPath}/SolutionAction_allSolutionOfCust.action">解决方案</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/RecruitInfoAction_recruitList.action">企业招聘</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei"><a href="${appPath}/JobInfoAction_myJobInfoList.action">个人求职</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei fr"><a href="${appPath}/LogoutAction.action">退出登录</a></p>
  <p class="dot1 mar_t10 ft14 fb yellow_ef yahei"><a href="${appPath}/userInfo/UserInfo.jsp">返回中心</a></p>
</div>
