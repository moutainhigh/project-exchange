<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- begin�Ų���� -->
<c:if test="${not empty top4ImageNews}">
<div class="w980 mauto mar_t6">
      <div class="section">
        <div class="ptitle">
          <div class="icon">��������</div>
        </div>
        <div class="pad_10 friendlink">
             <c:forEach items="${newsBiz.linkList}" var="link"><a href="${link.url}" target="_blank">${link.name}</a></c:forEach>
          	 <div class="clear"></div>
        </div>
      </div>
</div>
</c:if>   
<div id="footer">
      <div class="g_t_c pad_t10">
        <div align="center"><span style="font-size: 14px;">�żҿ���Ѷ��վȺ��</span><a href="#">�żҿ���Ѷ��վ</a> <a href="#">�żҿ�ͼƬ</a> <a href="#">�żҿ�¥��</a> 
        <br>
        <a href="#"><b>�żҿ�������</b></a><b>,<span style="font-size: 14px;">�żҿ������Ż�վ</span></b> ��Ȩ���� Copyright 2010 �̼Ҽ������ߣ�13253111580</div>
  </div>
</div>
    <!-- begin�Ų���� -->