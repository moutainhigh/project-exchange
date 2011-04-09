				<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
				<c:if test="${not empty msg}">
				var msg = '${msg}';
				if(msg != '')
					alert(msg);
				</c:if >
				<c:if test="${not empty succ}">
				var succ = '${succ}';
				if(succ == 'Y'){
					if(window.opener){
						var loc = window.opener.location.href;
						if(loc.indexOf('?')>-1){
							loc=loc+'&callback=y';
						}else{
							loc=loc+'?callback=y'
						}
						//alert(loc);
						//alert(window.opener.location);
						window.opener.location.href = loc;
						window.opener.location.reload(true);
						window.close();
					}
				}
				</c:if >