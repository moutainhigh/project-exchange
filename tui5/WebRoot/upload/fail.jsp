<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
 <script language="javascript">
 	var msg = '${msg}';
 	if(msg == ''){
 		msg = '�ϴ����������ļ���С�͸�ʽ(jpg,jpeg,gif)����С��������5M';
 	}
 	alert(msg);
	history.back();
 </script>