<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="fr w350 pad_l10 bls_gray">
	          <form action="${appPath}/search.htm" name="searchForm" id="searchForm" method="get">
	            			<div class="fl mar_l5">
	                          <select name="searchType" id="searchType">
	                            <option value="1">��Ѷ��̬</option>
	                            <option value="2">4S����Ϣ</option>
	                          </select>
	                        </div>
	                        
	            <div class="fl mar_l5">
	              <input name="key" type="text" class="gray input03" value="<c:if test="${empty key}">--������ؼ���--</c:if>${key}" onfocus="if(this.value=='--������ؼ���--') this.value=''" onblur="if(this.value=='') this.value='--������ؼ���--'"/>
	            </div>
	                        <div class="fl">
	                         <input class="mar_l5 button07" type="submit" value="�� ��" />
	        	</div>
	        </form>        
        </div>
      
