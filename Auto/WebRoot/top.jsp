<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- beginͷ����������� -->
<form action="LoginAction.htm" method="post">
<div class="header-top hide">
  <div class="mauto w980 bg03 h23">
    <div class="fl mar_r5 white">
    	<a href="index.htm" class="yellow" title="վ����ҳ">�żҿ�������</a>&nbsp;����ӭ����</div>
    
    
                             <div class="fr white mar_r20">
                    <!-- to Programmer  �˲�Ϊwδ��¼����ʾ -->
                  <span class="">
                  <div class="fl mar_l10 white">
                  <jsp:include page="login.jsp" flush="false"></jsp:include>
                  <span class="" style="height: 23px; line-height: 23px; vertical-align: middle;margin-left: 20px;">
				    	<img src="${appPath}/Themes/images/ico-bookmark.gif" alt="�����ղ�" />
				    	<a href='#' class="white mar_l10" onClick="javascript:if(document.all) window.external.AddFavorite('http://www.baidu.com','${appTitle}');" rel="sidebar">�ղر�վ</a>
				    </span>
                  </div>
                  </span>
                    <!-- to Programmer -->
                    <div class="w300 ml10 none">
                        <!-- to Programmer  �˲�Ϊ��¼�����ʾ -->
                        <p class="fl">
                            ��ӭ����</p>
                        <!-- to Programmer -->
                        <p class="fl mar_r10 w120 h18 hide yellow">������
                            <span></span>
                        </p>
                        <!-- ����ƴ˴��û�����ʾ����(���6������,12����ĸ����)�����򳬳��û������ᵼ��ҳ��ṹ���� -->
                        <p class="fl mar_r3">
                            վ����(<a href="#" target="_blank"><span class="fcred"></span></a>)</p>
                        <p class="fl">
                            <a href="#" title="�˳�" class="gray">[�˳�]</a></p>
                    </div>
                </div>
                             </div>
                <div class="clear"></div>
</div>
</form>     
    <!-- endͷ����������� -->         

     <!-- beginͷ����� -->
     <div class="header">
       <div class="">
         <div class="w250 fl"><a href="index.htm"><img src="${appPath}/Themes/images/logo.jpg" alt="��վ��־" /></a></div>
         <div class="fr w730 g_t_c h76"><img src="${appPath}/Themes/images/banner.jpg" alt="banner" width="728" height="74" class=" b_gray" /></div> 
         <div class="clear"></div> 
       </div>
       
       <div class="clearfix">
         <div class="w240 fl bg02 g_t_c pad_5">�żҿ���Ѷ�� ���·�վ www.zjk169.net</div>
         <div class="fr w730 mainNav">
         	<a href="${appPath}/index.htm" target="_blank">�� ҳ</a> {����}
         	<a href="${appPath}/sale4s.htm" target="_blank">�żҿ�4S��</a> 
         	<a href="${appPath}/specialList.htm" target="_blank">���ض�̬</a> 
         	<a href="${appPath}/jjXinde.htm" target="_blank">�����ĵ�</a> 
         	<a href="${appPath}/other.htm?news.orderNum=4" target="_blank">רҵ����</a> 
         	<a href="${appPath}/other.htm?news.orderNum=9" target="_blank">��������</a>
         	<a href="${appPath}/other.htm?news.orderNum=5" target="_blank">��������</a> [�ó�]
         	<a href="${appPath}/other.htm?news.orderNum=6" target="_blank">ά�ޱ���</a> 
         	<a href="${appPath}/other.htm?news.orderNum=7" target="_blank">�����ɱ�</a> 
         	<a href="${appPath}/other.htm?news.orderNum=8" target="_blank">����װ��</a></div>  
       </div>
         
     
     
       
       <div class="clear"></div>
     </div>
     <!-- endͷ����� -->
