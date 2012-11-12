<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
 <script language="javascript">
 	var msg = '${msg}';
 	if(msg == ''){
 		msg = '上传错误，请检查文件大小和格式，大小不允许超过2M';
 	}
 	alert(msg);
	history.back();
 </script>