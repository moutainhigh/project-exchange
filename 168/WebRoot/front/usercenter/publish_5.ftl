<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<#include "/front/head.ftl"/>
		<link href="${base}/front/Themes/publish.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
function StripHtml(html) 
{
    html = html  || "";
    var scriptregex = "<scr" + "ipt[^>.]*>[sS]*?</sc" + "ript>";
    var scripts = new RegExp(scriptregex, "gim");
    html = html.replace(scripts, " ");

    //Stripts the <style> tags from the html
    var styleregex = "<style[^>.]*>[sS]*?</style>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");

    //Stripts the <style> tags from the html
    var styleregex = "<p[^>.]*>[sS]*?</p>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");

    var styleregex = "<div[^>.]*>[sS]*?</div>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");
    
    var styleregex = "<a[^>.]*>[sS]*?</a>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");

    var styleregex = "<tr[^>.]*>[sS]*?</tr>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");

    var styleregex = "<td[^>.]*>[sS]*?</td>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");

    var styleregex = "<table[^>.]*>[sS]*?</table>";
    var styles = new RegExp(styleregex , "gim");
    html = html.replace(styles, " ");
   
    //Strips the HTML tags from the html
    var objRegExp = new RegExp("<(.| )+?>", "gim");
    var  strOutput = html.replace(objRegExp, " ");
    
    //Replace all < and > with &lt; and &gt;
    strOutput = strOutput.replace(/</, "");
    strOutput = strOutput.replace(/>/, "");

    return strOutput;
}

function validate_form()
{   
	document.getElementById("btn").disabled=true;
	var content=document.getElementById("content").value;
	var name=document.getElementById("name").value;
	var phone=document.getElementById("phone").value;
	var email=document.getElementById("email").value;
	
	if (content==""){
		alert("内容不能为空");
		document.getElementById("btn").disabled=false;
		return ;
	}else if (name==""){
		alert("名称不能为空");
		document.getElementById("btn").disabled=false;
	    return ;
	}
	
	 if(email != "") {
	        if(!/(\S)+[@]{1}(\S)+[.]{1}(\w)+/.test(email)) 
	       {
	         alert("请输入格式正确的 e-mail 地址！");
	         document.getElementById("btn").disabled=false;
	         return;
	       }
	 }
	
	if (phone=="" && email==""){
		alert("联系方式和邮箱至少填一个");
		document.getElementById("btn").disabled=false;
		return ;
	}

	content=StripHtml(content);
	document.getElementById("content").value=content;
	document.getElementById("checkForm").submit();
}
</script>

	</head>

	<body>
		<#include "/front/top.ftl">
		<div class="all">
			<#include "/front/pos.ftl">
			<!--1：城市选择-->
			<div id="step">
				<ul>
					<li class="step-pre">
						<span>1</span> 
						<#if pub_list[0]??>
						<a href="${base}/user/publish/index.htm">${pub_list[0][1]}</a>
						<#else>
						选择城市
						</#if>
					</li>
					<li class="step-pre">
						<span>2</span> 
						<#if pub_list[1]??>
						<a href="${base}/user/publish/city/${pub_list[0][0]}.htm">${pub_list[1][1]}</a>
						<#else>
						一分类选择
						</#if>
					</li>
					<li class="step-pre">
						<span>3</span> 
						<#if pub_list[2]??>
						<a href="${base}/user/publish/cate1/${pub_list[1][0]}.htm">${pub_list[2][1]}</a>
						<#else>
						二分类选择
						</#if>
					</li>
					<li class="step-pre">
						<span>4</span> 
						<#if pub_list[3]??>
						<a href="${base}/user/publish/cate2/${pub_list[2][0]}.htm">${pub_list[3][1]}</a>
						<#else>
						<a href="${base}/user/publish/cate2/${pub_list[2][0]}.htm" style="color:gray;">地区选择(已跳过)</a>
						</#if>
					</li>
					<li class="step-active">
						5信息填写
					</li>
					<div class="clear"></div>
				</ul>
			</div>
			<div class="clear"></div>
			<!--表单-->
			<div id="add-k">
				<!--框-->
				<div class="add-k-k">
					<#include "/front/msg.ftl">
					<form style="margin: 0pt;" method="post" name="checkForm" id="checkForm" enctype="multipart/form-data" action="${base}/user/publish/publish.htm">
						<div class="add-info">
							您好，认真填写以下信息，
							<span>*红色字体</span>为必填写项目...
						</div>

						<!--属性-->
						<div class="a-shuxing">
							<!--复选-->
							<ul>
								<li class="a-shuxing-name">
									<span>*标题：</span>
								</li>
								<li class="a-shuxing-value">
									<input type="text" maxlength="30" size="50" id="name" name="info.title">
									<font>*标题字数控制在30个字</font>
								</li>
							</ul>

							<!--下拉框
							<ul>
								<li class="a-shuxing-name">
									性别：
								</li>
								<li class="a-shuxing-value">
									<select id="jiaoyouxingbie" name="jiaoyouxingbie">
										<option value="659">
											女
										</option>

										<option value="661">
											男
										</option>
									</select>
									&nbsp;&nbsp;
								</li>
							</ul>-->
							<!--下拉框
							<ul>
								<li class="a-shuxing-name">
									年龄：
								</li>
								<li class="a-shuxing-value">
									<input type="text" value="" id="jiaoyounianling" name="jiaoyounianling">
								</li>
							</ul>-->
							<ul style="height: 152px;">
								<li style="height: 150px;" class="a-shuxing-name">
									<span>*内容：</span>
								</li>
								<li style="height: 150px;" class="a-shuxing-value">
									<textarea class="add-k" rows="10" cols="65" id="content" name="info.content"></textarea>
								</li>
							</ul>
							<ul>
								<li class="a-shuxing-name">
									上传图片：
								</li>
								<li class="a-shuxing-value" style="height:150px;">
									<iframe src="${base}/upload/upload.jsp" width="100%" height="100%" frameborder="0"></iframe>
								</li>
							</ul>
							<ul>
								<li class="a-shuxing-name">
									<span>*电话号码：</span>
								</li>
								<li class="a-shuxing-value">
									<input id="phone" name="info.tel" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'') ">
									<font>*提示：联系方式和E-mail至少选填一个！</font>
								</li>
							</ul>
							<ul>
								<li class="a-shuxing-name">
									<span>*E-mail：</span>
								</li>
								<li class="a-shuxing-value">
									<input type="text" id="email" name="info.email">
								</li>
							</ul>
							<ul>
								<li class="a-shuxing-name">
									QQ：
								</li>
								<li class="a-shuxing-value">
									<input onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" onkeyup="value=value.replace(/[^\d]/g,'')" id="qq" name="info.qq">
								</li>
							</ul>
							<div class="clear"></div>
							<div class="add-anniu">
								<input type="button" onclick="validate_form();" id="btn" value="" style="display:none;">
								<input type="button" onclick="validate_form();" value="">
							</div>
						</div>
						<!--属性-->
					</form>
				</div>
				<!--框-->
			</div>
			<!--/一级类别选择-->
		</div>
		<#include "/front/foot.ftl">
	</body>
</html>

