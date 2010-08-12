<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" dir="ltr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
        <title>ģ����ҳ</title>
        <meta name="description" content="" />
        <meta name="keywords" content="ɭ�� ���� ����" />
        <link rel="shortcut icon" href="./images/favicon.jpg" type="image/x-icon" />
		<style>
			/* common */
			*{
				padding: 0;
				margin: 0;
			}
			body{
				margin:0 auto;
				color:black;
				font-size:12px;
				background-color:white;
				height:100%;
				border: 0px solid red;
			}
			a,a:visited,a:active{
				text-decoration:none;
				color:black;
			}
			a:hover{
				color:red;
			}
			
			/* page */
			#wrapper{
				margin:5px;
			}
			#top{
				border:solid 1px #B4CFCF;
				height:25px;
				background:url(${appPath}/manage/images/arrow.gif) no-repeat 15px center;
			}
			#top span{
				position:relative;
				left:37px;
				top:5px;
			}
			
			/*main*/
			/*nav*/
			#navlist {
		        padding: 3px 0;
		        margin: 6px 0 0 0;
		        border-bottom: 1px solid #778;
		        font: bold 12px Verdana, sans-serif;
				/*border:solid 1px black;*/
			}
			
			#navlist li {
		        list-style: none;
		        margin: 0;
		        display: inline;
			}
			
			#navlist li a {
		        padding: 3px 0.5em;
		        margin-left: 3px;
		        border: 1px solid #778;
		        border-bottom: none;
		        background: #BCD2E6;
		        text-decoration: none;
			}
			
			#navlist li a:link { color: #448; }
			#navlist li a:visited { color: #448; }
			
			#navlist li a:hover {
		        color: #000;
		        background: #BCD266;
		        border-color: #227;
			}
			
			#navlist li a#current {
		        background: white;
		        border-bottom: 1px solid white;
			}
			
			#content{
				border:solid 1px #778;
				/*margin-top:-12px !important;*/
				margin-top:10px;
				height:400px;
				/*border: 0px solid red;*/
			}
		</style>
		<script src="${appPath}/manage/ckeditor/ckeditor.js"></script>
		<script src="${appPath}/js/jquery.js"></script>
		<script src="${appPath}/manage/js/common.js"></script>
		<script>
			function submitForm(){
				var f = document.forms[0];
				var name = f['car.fullName'].value;
				var price = f['car.price'].value;
				if(name == ''){
					alert("�����복������");
					f['car.fullName'].focus();
					return false;
				}
				if(price==''){
					alert("������۸�");
					f['car.price'].focus();
					return false;
				}
				if(!/^[0-9]{1,}\.*[0-9]{1,}$/.test(price)){
					alert("�۸����Ϊ����");
					f['car.price'].focus();
					return false;
				}
				f.submit();
			}
			$(function(){
				loadSaleList();
				loadBrandList();
			});
			function loadSaleList(){
				$.post('ajax_getAllSales.htm', {}, function(result) {
					var dataObj=eval(result);
					var name;
					var id;
					var current_saleId = '${car.sale.id}';
					if(!dataObj.saleList || dataObj.saleList.length==0){
						alert('�������4S��');
						self.location.href = '${appPath}/manage/sale/sale_edit.jsp';
						return false;
					}
					$.each(dataObj.saleList,function(n,e){
						id = e.id;
						name = e.fullName;
						if(id == current_saleId)
							$("<option value="+id+" selected=selected>"+name+"</option>").appendTo("#sale");
						else
							$("<option value="+id+">"+name+"</option>").appendTo("#sale");
					});
				});
			}
			function loadBrandList(){
				$.post('ajax_getAllBrands.htm', {}, function(result) {
					var dataObj=eval(result);
					var name;
					var id;
					var current_brandId = '${car.brand.id}';
					$.each(dataObj.brandList,function(n,e){
						id = e.id;
						name = e.name;
						if(id == current_brandId)
							$("<option value="+id+" selected=selected>"+name+"</option>").appendTo("#brand");
						else
							$("<option value="+id+">"+name+"</option>").appendTo("#brand");
					});
				});
			}
		</script>
    </head>
    <body>
    <jsp:include page="../msg.jsp" flush="false"></jsp:include>
    <form action="ManageAction_saveCar.action" method="post">
    	<input type="hidden" name="car.id" value="${car.id}"/>
        <div id="wrapper">			
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="border:#c8c8e7 1px solid; border-top:0; margin-top:5px;">
			  <tr>
			    <td height="26" colspan="2" align="left" background="${appPath}/manage/images/msg_bg.jpg">
				&nbsp;&nbsp;<img src="${appPath}/manage/images/ico1.gif" border="0" align="absmiddle" /> <strong>����4S���Ա</strong> </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td width="10%" height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">4S�����̣�</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<select id="sale" name="car.sale.id"></select>
			    </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">�������ƣ�</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="car.fullName" value="${car.fullName}" size="50" /><span style="color:red;">*</span></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">����Ʒ�ƣ�</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<select id="brand" name="car.brand.id"></select>
			    </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">���ͼ۸񣨣�����</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;"><input type="text" name="car.price" value="${car.price}"  /><span style="color:red;">*</span></td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">����ͼƬ��</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<input type="hidden" id="myImage" name="car.image" value="${car.image }"/>
			    	<c:choose>
			    		<c:when test="${empty car.id || empty car.image}">
			    		<iframe src="${appPath}/manage/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:when>
			    		<c:otherwise>
			    		<iframe src="${appPath}/manage/upload/success.jsp?myfileFileName=${car.image}" width="100%" height="100%" frameborder="0"></iframe>
			    		</c:otherwise>
			    	</c:choose>
			    </td>
			  </tr>
			  <tr style="background-color:#F7F8FA">
			    <td height="25" align="right" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">���Ͳ�����</td>
			    <td align="left" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    	<textarea rows="15" cols="80" id="content" name="car.detail">${car.detail}</textarea>
			    	<script>
			    		CKEDITOR.replace('content',{skin:'kama',language:'zh-cn'});
			    	</script></td>
			  </tr>
			  <tr>
			    <td colspan="2" height="25" align="center" bgcolor="#F7F8FA" style="border-bottom:#cccccc 1px dashed;">
			    <input type="button" name="button1" value=" �� �� " onclick="submitForm();"/></td>
			  </tr>
			</table>
        </div>
        </form>
    </body>
</html>
