<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- begin�Ų���� -->
<div class="w980 mauto mar_t6">
      <div class="section">
        <div class="ptitle">
          <div class="icon">��������</div>
        </div>
        <div class="pad_10 friendlink">
             <c:forEach items="${newsBiz.linkList}" var="link"><a href="${link.url}">${link.name}</a></c:forEach>
          	 <div class="clear"></div>
        </div>
      </div>
</div>   
<div id="footer">
      <div class="g_t_c pad_t10">
            <p><a href="#">վ����ҳ</a> | <a href="#">��������</a> | <a href="#">��������</a> | <a href="#">��ϵ��ʽ</a> | <a href="#">վ�㵼��</a></p>
        <p class="gray entxt">Copyright &copy; 2010 �̼Ҽ������ߣ�13253111580���� ��վ�����ţ���ICP��8888888888��</p>
  </div>
</div>
    <!-- begin�Ų���� -->