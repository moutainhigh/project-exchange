<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!-- beginͷ����������� -->
<form action="LoginAction.htm" method="post">
<div class="header-top hide">
  <div class="mauto w980 bg03 h23">
    <div class="fl mar_r25 mar_l20" style="height: 23px; line-height: 23px; vertical-align: middle;"><img src="Themes/images/ico-bookmark.gif" alt="�����ղ�" />
    <a href='#' class="white mar_l10" onClick="javascript:if(document.all) window.external.AddFavorite('http://www.baidu.com','${appTitle}');" rel="sidebar">�ղر�վ</a></div>
    <div class="fl mar_r5 white"><a href="#" class="yellow" title="վ����ҳ">${appTitle}</a>&nbsp;����ӭ����</div>
    
    
                             <div class="fr white mar_r20">
                    <!-- to Programmer  �˲�Ϊwδ��¼����ʾ -->
                  <span class="">
                  <div class="fl mar_l10 white">
                  <jsp:include page="login.jsp" flush="false"></jsp:include>
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
         <div class="w250 fl"><a href="index.htm"><img src="Themes/images/logo.jpg" alt="��վ��־" /></a></div>
         <div class="fr w730 g_t_c h76"><img src="Themes/images/banner.jpg" alt="banner" width="728" height="74" class=" b_gray" /></div> 
         <div class="clear"></div> 
       </div>
       
       <div class="clearfix">
         <div class="w240 fl bg02 g_t_c pad_5">�żҿ���Ѷ�� ���·�վ www.zjk169.net</div>
         <div class="fr w730 mainNav">
         	<a href="index.htm">�� ҳ</a> {����}
         	<a href="sale4s.htm">�żҿ�4S��</a> 
         	<a href="specialList.htm">���ض�̬</a> 
         	<a href="jjXinde.htm">�����ĵ�</a> 
         	<a href="other.htm?news.orderNum=4">רҵ����</a> 
         	<a href="other.htm?news.orderNum=9">��������</a>
         	<a href="other.htm?news.orderNum=5">��������</a> [�ó�]
         	<a href="other.htm?news.orderNum=6">ά�ޱ���</a> 
         	<a href="other.htm?news.orderNum=7">�����ɱ�</a> 
         	<a href="other.htm?news.orderNum=8">����װ��</a></div>  
       </div>
         
     
     
       
       <div class="clear"></div>
     </div>
     <!-- endͷ����� -->
