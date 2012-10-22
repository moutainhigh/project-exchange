<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html><head><title>图片上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script>
function tj()
{
$("ka").value = $("file1").value;
$("tButton").disabled = true;
document.form1.submit();
$("uppic").style.visibility="hidden";
$("uppic").style.display="none";
$("loading").style.visibility="visible";
$("loading").style.display="block";
}
function $(objectId) {
if(document.getElementById && document.getElementById(objectId)) {
    return document.getElementById(objectId);// W3C DOM
    } else if (document.all && document.all(objectId)) {
        return document.all(objectId);// MSIE 4 DOM
    } else if (document.layers && document.layers[objectId]) {
        return document.layers[objectId];// NN 4 DOM.. note: this won't find nested layers
    } else {
        return false;
    }
}

</script>
<style>
body,div,form,table,td,ul,li{margin:0; padding:0;}
ul{list-style:none;}
</style>
</head>
<body>
<div class="user_upfile" id="uppic" style="visibility:visible; display:block;">
<form name="form1" method="post" action="/FileUploadAction_gaojian.do" enctype="multipart/form-data" >
  <ul>
	<li id="upid"><input name="myfile" type="file" class="tx1" id="file1" value="" size="10">
	  <input type="button" name="Submit" id="tButton" value="立即上传" onClick="return tj()">
	  <input type="hidden" name="filepath" value="../upfile/">
	<input type="hidden" name="filelx" value="jpg">
	<input type="hidden" name="EditName" value="pic1">
	<input type="hidden" name="small" value="small">
	<input type="hidden" name="de" value="fujianList">
	<input type="hidden" name="FormName" value="form1">
	<input type="hidden" name="ka" id="ka" value="">
	<input type="hidden" name="act" value="uploadfile"></li>
  </ul>
</form>
</div>
<div class="user_upfile" id="loading" style="visibility:hidden; display:none;">
  <ul>
    <li id="ee" style="text-align:center; padding:0px 0 0px 0;"><img src="/img/loader.gif"></li>
	<li id="upid" style="text-align:center;">图片正在上传</li>
  </ul>
</div>
<script>$("tButton").disabled = false;</script>
</body>
</html>
