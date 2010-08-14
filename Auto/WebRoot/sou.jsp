<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<div class="fr w350 pad_l10 bls_gray">
	          <form action="${appPath}/search.htm" name="searchForm" id="searchForm" method="get">
	            			<div class="fl mar_l5">
	                          <select name="searchType" id="searchType">
	                            <option value="1">资讯动态</option>
	                            <option value="2">4S店信息</option>
	                          </select>
	                        </div>
	                        
	            <div class="fl mar_l5">
	              <input name="key" type="text" class="gray input03" value="<c:if test="${empty key}">--请输入关键字--</c:if>${key}" onfocus="if(this.value=='--请输入关键字--') this.value=''" onblur="if(this.value=='') this.value='--请输入关键字--'"/>
	            </div>
	                        <div class="fl">
	                         <input class="mar_l5 button07" type="submit" value="搜 索" />
	        	</div>
	        </form>        
        </div>
      
