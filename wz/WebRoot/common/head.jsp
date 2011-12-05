<%@ page language="java" import="java.text.*" pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- beginͷ����������� -->
	<script src="${appPath}/js/jquery-1.4.2.min.js"></script>
	<script>
		var navIndex = "${sessionScope.navIndex}";
		
		if(navIndex == ''){
			navIndex = 0;
		}
		$(function(){
			$('.main_tab a').each(function(index){		
				$(this).click(function(){
					navIndex = index;
					showNav();
				});
			});
			showNav();
		});	
		function showNav(){
			$('.main_tab a').eq(navIndex).css({background: '#fff url(${appPath}/Themes/images/nav_bg.gif) no-repeat 0 -29px', color: '#fff'});
			$('.main_tab a').each(function(index){		
				if(navIndex != index){
					$(this).css({background: '#fff url(${appPath}/Themes/images/nav_bg.gif) no-repeat 0 0', color: '#2c5e9a'});
				}
			});
		}
	</script>
	<div class="header-top hide">
	  <div class="mauto w980">
	    <div class="fl mar_r5 gray">
	    	<a href="#" class="gray" title="��Ϊ��ҳ">��Ϊ��ҳ</a>&nbsp;|&nbsp;
	    	<a href="#" title="�����ղ�" class="gray">�����ղ�</a>&nbsp;|&nbsp;
	    	<a href="#" title="��������" class="red">��������</a>
	    </div>
	          <div class="fr gray">
	           <div class="fl mar_r3">���ã���ӭ���ټ�ְ����׬���ģ� </div>
	           <c:if test="${empty userObj }">
	           <div class="fl mar_l10">
	                 <a href="${appPath}/login.jsp">�û���¼</a>&nbsp;|&nbsp;
	                 <a href="${appPath}/Register/reg.jsp">�û�ע��</a>&nbsp;|&nbsp;
	                 <a href="${appPath}/userinfo/index">��������</a>&nbsp;
	           </div>
	           </c:if>
	           <c:if test="${not empty userObj }">
	           <div class="fl mar_l10">
	                 <p class="fl red">��ӭ����${userObj.userName }</p>&nbsp;|&nbsp;
	                 <a href="${appPath}/logout" title="�˳�" class="gray">[�˳�]</a>&nbsp;|&nbsp;
	                 <a href="${appPath}/userinfo/index">��������</a>&nbsp;
	           </div>
	           </c:if>
	          </div>
	        </div>
	        <div class="clearfix"></div>
	</div>
	<!-- endͷ����������� -->         
	<!-- beginͷ����� -->
	<div class="header prel">
	  <div class="head_part01 hide">
	    <div class="logo fl" onclick="self.location.href='${appPath}/'" style="cursor: pointer;">
	      <p class="gray"></p>
	    </div>
	    <div class="slogo fl">
	      <div class="gray">�����ǣ�<%=new SimpleDateFormat("yyyy��MM��dd�� E",Locale.CHINA).format(new Date())%></div>
	      <div class="main_tab">
	        <ul>
	          <li><a href="${appPath }/">վ����ҳ</a></li>
	          <li><a href="#">�����̼�</a></li>
	          <li><a href="#">��������</a></li>
	          <li><a href="#">��ҵ��Ѷ</a></li>
	          <li><a href="#">�ƹ�ƽ̨</a></li>
	          <li><a href="#">��̳��ȫ</a></li>
	        </ul>
	      </div>
	    </div>
	    <div class="fr" style="padding:5px;">
	    	<input class="button07 fr mar_l30" type="button" value="������" />
	    	<br/>
	    	<input class="button07 fr mar_l30" type="button" value="������" />
	    </div>
	    <div class="clear"></div>
	  </div>
	  <div class="search_area">
	    <select name="����" class="gray inputxt02 mar_l10 fl">
	      <option>--- ������� ---</option>
	      <option>--- ����� ---</option>
	      <option>--- ���񷢲��� ---</option>
	      <option>--- �˲ż��� ---</option>
	    </select>
	    <input style="width: 400px;" name="search" type="text" class="gray inputxt01 fl mar_l10" />
	    <input class="button04 fl mar_l10" type="button" value="�� ��" />
	  </div>
	  <div class="clear"></div>
	</div>
	<!-- endͷ����� -->