<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!-- beginͷ����������� -->
<form action="LoginAction.htm" method="post">
<div class="header-top hide">
  <div class="mauto w980 bg03 h23">
    <div class="fl mar_r25 mar_l20"><img src="Themes/images/ico-bookmark.gif" alt="�����ղ�" /><a href="#" class="white mar_l10">�����ղ�</a></div>
    <div class="fl mar_r5 white"><a href="#" class="yellow" title="վ����ҳ">�żҿ�������</a>&nbsp;����ӭ�㣡</div>
    
    
                             <div class="fr white mar_r20">
                    <!-- to Programmer  �˲�Ϊwδ��¼����ʾ -->
                  <span class="">
                  <div class="fl mar_l10 white">
                  �û�����<input name="username" type="text" class="gray mar_l10 input02" />&nbsp;&nbsp;
                  ����:<input name="password" type="password" class="gray mar_l5 input02" />&nbsp;&nbsp;
                  ��֤�룺<input id="verification_code" onfocus="$('#yanzheng').show();" style="width:25px;" type="text" name="rand" onkeypress="formKeyPress(event);" class="gray mar_l5 input02"/>
                  <img src="${appPath}/rand" alt="��֤��" id="yanzheng" height="17" style="display:inline;"/>
                  <input class="mar_l5 btn-log" type="submit" value="�� ¼" /><input class="mar_l10 btn-reg" type="submit" value="ע�����û�" />
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
         	<a href="other.htm?news.type=4">רҵ����</a> 
         	<a href="other.htm?news.type=9">��������</a>
         	<a href="other.htm?news.type=5">��������</a> [�ó�]
         	<a href="other.htm?news.type=6">ά�ޱ���</a> 
         	<a href="other.htm?news.type=7">�����ɱ�</a> 
         	<a href="other.htm?news.type=8">����װ��</a></div>  
       </div>
         
     
     
       
       <div class="clear"></div>
     </div>
     <!-- endͷ����� -->
