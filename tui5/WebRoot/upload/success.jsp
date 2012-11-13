<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
 <script language="javascript">
	//parent.document.getElementById("fujianList").innerHTML += '<li>${newName}</li>';
	//parent.document.getElementById("attachment").value += '${newName}|';
	parent.uploadAtt('${newName}');
	history.back();
 </script>