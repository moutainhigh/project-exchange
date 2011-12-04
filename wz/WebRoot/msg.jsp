				<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<c:if test="${not empty msg}">
				<div style="background:none;text-align:center; height:30px; font-size:12px;color:red;margin:10px auto;border:0;padding:1px;" id="reqMsg">
					<div style="margin:2px auto;border:1px solid #FF0000; background-color:#FFCE00; line-height:30px;height:30px; width:320px;">
						${msg}
					</div>
				</div>
				</c:if >