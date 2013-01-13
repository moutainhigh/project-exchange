<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.throne212.fupin.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
		<title>调查表（二）  ${q2.family.name }</title>
		<script src="${appPath}js/jquery.js" language="javascript"></script>
		<script>
			<jsp:include page="../../msg.jsp"></jsp:include>
			function submitForm(tmp){
				var inputArr = $('input[type="text"]');
				for(var i=0; i<inputArr.length; i++){
					if($(inputArr[i]).val().replace(/\s/ig,'') == ''){
						alert('不能留空，请检查');
						return false;
					}
				}
				if(tmp && tmp != ''){
					$('#tmp').val('Y');
				}
				document.forms[0].submit();
			}
			$(function(){
				$("tr:contains('1.'):contains('2.'):contains('3.') td input").blur(function(){
				    var val = $(this).val();
				    if(val != '' && val != 1 && val != 2 && val != 3 && val != 4){
				        alert('该值只能是1、2、3或4');
				        $(this).val('');
				        $(this).focus();
				    }
				});
			});
		</script>
<style>
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
ruby
	{ruby-align:left;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:常规;
	mso-style-id:0;}
.font7
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl65
	{mso-style-parent:style0;
	color:windowtext;
	font-size:18.0pt;
	font-family:黑体, monospace;
	mso-font-charset:134;
	text-align:center;
	white-space:normal;}
.xl66
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl67
	{mso-style-parent:style0;
	color:windowtext;
	font-size:14.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl68
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:黑体, monospace;
	mso-font-charset:134;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl69
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-family:黑体, monospace;
	mso-font-charset:134;
	text-align:center;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl70
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:black none;
	white-space:normal;}
.xl71
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	font-weight:700;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl72
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:black none;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl73
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl74
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl75
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl76
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	mso-number-format:"0\.00_ ";
	text-align:center;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;
	white-space:normal;}
.xl77
	{mso-style-parent:style0;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl78
	{mso-style-parent:style0;
	color:windowtext;
	font-size:12.0pt;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl79
	{mso-style-parent:style0;
	text-align:center;
	vertical-align:bottom;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl80
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;}
.xl81
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl82
	{mso-style-parent:style0;
	mso-number-format:"\@";
	text-align:center;
	border:.5pt solid windowtext;
	mso-protection:unlocked visible;
	white-space:normal;}

<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.75in .7in .75in .7in;
	mso-header-margin:.3in;
	mso-footer-margin:.3in;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:宋体;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
-->
</style>
</head>
<body lang=ZH-CN style='tab-interval:21.0pt;text-justify-trim:punctuation'>
<form method="post" action="${appPath}questionOrg_save2.action" name="searchForm">
<input type="hidden" name="q2.id" value="${q2.id }"/>
<input type="hidden" name="tmp" id="tmp" value=""/>
			<c:if test="${not empty msg }">
			<div style="width:70%; padding: 10px 5px; margin: 5px auto; border: 1px solid red; font-size: 14px; font-weight: 600; text-align: center; background-color: yellow;">
			${msg }
			</div>
			</c:if>
<table border=0 cellpadding=0 cellspacing=0 width=620 style='border-collapse:
 collapse;table-layout:fixed;'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:4096;width:96pt'>
 <col width=300 style='mso-width-source:userset;mso-width-alt:10144;width:238pt'>
 <col width=100 style='mso-width-source:userset;mso-width-alt:3040;width:71pt'>
 <col width=150 style='mso-width-source:userset;mso-width-alt:2560;width:120pt'>
 <tr height=74 style='mso-height-source:userset;height:55.5pt'>
  <td colspan=4 height=74 class=xl65 style='height:55.5pt;'>广州市农村扶贫开发“规划到户责任到人”工作<br>
    ${year}年度调查表（二）<span style='mso-spacerun:yes'>&nbsp;</span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
 </tr>
 <tr height=57 style='height:42.75pt'>
  <td height=57 class=xl66 width=100 style='height:42.75pt;'>贫困村<br/>（盖章）<span
  style='mso-spacerun:yes'></span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl67 width=300><span
  style='mso-spacerun:yes'>${q2.family.cun.zhen.area.name }${q2.family.cun.zhen.name }${q2.family.cun.name }</span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl66 width=100>帮扶单位（盖章）<ruby><font class="font7"><rt
  class=font7></rt></font></ruby></td>
  <td class=xl67 width=150><span
  style='mso-spacerun:yes'>${q2.org.orgName }</span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl68 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>代码<ruby><font class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl68 width=317 style='border-top:none;border-left:none;width:238pt'>填表项目<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl68 width=95 style='border-top:none;border-left:none;width:71pt'>单位<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl69 width=80 style='border-top:none;border-left:none;width:60pt'>数量<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
 </tr>
 <tr height=57 style='height:42.75pt'>
  <td height=57 class=xl70 width=128 style='height:42.75pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>一、家庭基本情况<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=57 style='height:42.75pt'>
  <td height=57 class=xl73 width=128 style='height:42.75pt;border-top:none;
  width:96pt'>201</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）贫困户类型：1.有劳动能力的低保户2.无劳动能力的低保户3.有劳动能力的低收入困难家庭4.无劳动能力的低收入困难家庭<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>代码<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item1" value="<fmt:formatNumber value="${q2.item1}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>202</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（二）家庭成员人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item2" value="<fmt:formatNumber value="${q2.item2}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>203</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>其中：60岁及以上人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item3" value="<fmt:formatNumber value="${q2.item3}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl70 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>二、家庭收支情况<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>204</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>　　当年家庭人均年收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item4" value="<fmt:formatNumber value="${q2.item4 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>205</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）工资收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item5" value="<fmt:formatNumber value="${q2.item5 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>206</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（二）家庭生产经营收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item6" value="<fmt:formatNumber value="${q2.item6 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>207</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>1.农业生产经营收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item7" value="<fmt:formatNumber value="${q2.item7 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>208</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>2.工业、建筑业生产经营收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item8" value="<fmt:formatNumber value="${q2.item8 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>209</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>3.其他行业生产经营收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item9" value="<fmt:formatNumber value="${q2.item9 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>210</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（三）其他稳定性收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item10" value="<fmt:formatNumber value="${q2.item10 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>211</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>1.财产性收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item11" value="<fmt:formatNumber value="${q2.item11 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>212</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（1）利息股息分红收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item12" value="<fmt:formatNumber value="${q2.item12 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>213</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（2）出租物业收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item13" value="<fmt:formatNumber value="${q2.item13 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>214</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（3）土地转让收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item14" value="<fmt:formatNumber value="${q2.item14 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>215</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（4）其他财产性收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item15" value="<fmt:formatNumber value="${q2.item15 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>216</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>2.退休养老金<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item16" value="<fmt:formatNumber value="${q2.item16 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>217</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（四）转移性收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item17" value="<fmt:formatNumber value="${q2.item17 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>218</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>1.亲友赠送<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item18" value="<fmt:formatNumber value="${q2.item18 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>219</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>2.慰问金<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item19" value="<fmt:formatNumber value="${q2.item19 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>220</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>3.抚恤救灾救济金<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item20" value="<fmt:formatNumber value="${q2.item20 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>221</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>4.低保金<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item21" value="<fmt:formatNumber value="${q2.item21 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>222</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>5.农业生产补贴和临时补贴<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item22" value="<fmt:formatNumber value="${q2.item22 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>223</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>6.其他转移性收入<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item23" value="<fmt:formatNumber value="${q2.item23 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>224</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（五）家庭生产经营支出<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item24" value="<fmt:formatNumber value="${q2.item24 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>225</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>1.农业生产经营支出<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item25" value="<fmt:formatNumber value="${q2.item25 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>226</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>2.工业、建筑业生产经营支出<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item26" value="<fmt:formatNumber value="${q2.item26 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>227</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>3.其他行业生产经营支出<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>元<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item27" value="<fmt:formatNumber value="${q2.item27 }" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl70 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>三、住房情况<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>228</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）住房建筑面积<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>㎡<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item28" value="${q2.item28}"/>　</td>
 </tr>
 <tr height=38 style='height:28.5pt'>
  <td height=38 class=xl73 width=128 style='height:28.5pt;border-top:none;
  width:96pt'>229</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（二）住房结构类型：1.钢筋混凝土2.砖木3.土坯4.其他<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>代码<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item29" value="<fmt:formatNumber value="${q2.item29}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>230</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（三）列入危房改造计划的住房面积<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>㎡<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item30" value="${q2.item30}"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>231</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（四）完成危房改造的住房面积<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>㎡<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item31" value="${q2.item31}"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>232</td>
  <td class=xl77 width=317 style='border-top:none;border-left:none;width:238pt'>（五）已动工未完成危房改造的住房面积<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>㎡<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl76 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item32" value="${q2.item32}"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl70 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>四、劳动力培训<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>233</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）参加免费农技培训人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item33" value="<fmt:formatNumber value="${q2.item33}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>234</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（二）参加免费就业培训人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item34" value="<fmt:formatNumber value="${q2.item34}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl70 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>五、读书就业情况<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>235</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）普及九年义务教育适龄人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item35" value="<fmt:formatNumber value="${q2.item35}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>236</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>其中：当年在读小学和初中人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item36" value="<fmt:formatNumber value="${q2.item36}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>237</td>
  <td class=xl78 width=317 style='border-top:none;border-left:none;width:238pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>因贫辍学人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item37" value="<fmt:formatNumber value="${q2.item37}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=38 style='height:28.5pt'>
  <td height=38 class=xl73 width=128 style='height:28.5pt;border-top:none;
  width:96pt'>238</td>
  <td class=xl78 width=317 style='border-top:none;border-left:none;width:238pt'>（二）考上大学、大专院校、高中、中专、中技学校人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item38" value="<fmt:formatNumber value="${q2.item38}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>239</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>其中：当年考上在读人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item39" value="<fmt:formatNumber value="${q2.item39}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>240</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'><span
  style='mso-spacerun:yes'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>因贫辍学人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item40" value="<fmt:formatNumber value="${q2.item40}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl73 width=128 style='height:27.0pt;border-top:none;
  width:96pt'>241</td>
  <td class=xl77 width=317 style='border-top:none;border-left:none;width:238pt'>（三）劳动力（男性18-60岁和女性18-55岁）人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item41" value="<fmt:formatNumber value="${q2.item41}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>242</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>1.在家务农人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item42" value="<fmt:formatNumber value="${q2.item42}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>243</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>2.外出务工人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item43" value="<fmt:formatNumber value="${q2.item43}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>244</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>3.因长期患病或残疾不能参加劳动人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item44" value="<fmt:formatNumber value="${q2.item44}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl70 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>　</td>
  <td class=xl71 width=317 style='border-top:none;border-left:none;width:238pt'>六、保障情况<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl70 width=95 style='border-top:none;border-left:none;width:71pt'>　</td>
  <td class=xl72 width=80 style='border-top:none;border-left:none;width:60pt'>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>245</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（一）当年参加新型农村合作医疗人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item45" value="<fmt:formatNumber value="${q2.item45}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>246</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>（二）当年参加新型农村养老保险人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item46" value="<fmt:formatNumber value="${q2.item46}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 class=xl73 width=128 style='height:14.25pt;border-top:none;
  width:96pt'>247</td>
  <td class=xl74 width=317 style='border-top:none;border-left:none;width:238pt'>其中：60岁及以上参加新农保人数<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'>人<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'><input type="text" name="q2.item47" value="<fmt:formatNumber value="${q2.item47}" pattern="#.##" type="number"/>"/>　</td>
 </tr>
 <tr height=38 style='height:28.5pt'>
  <td height=38 class=xl73 width=128 style='height:28.5pt;border-top:none;
  width:96pt'>填表人：<span
  style='mso-spacerun:yes'></span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl75 width=317 style='border-top:none;border-left:none;width:238pt'>　
  <input type="text" name="q2.writer" value="${q2.writer }"/>
  </td>
  <td class=xl73 width=95 style='border-top:none;border-left:none;width:71pt'><span
  style='mso-spacerun:yes'>&nbsp;</span>填表时间：<ruby><font class="font7"><rt
  class=font7></rt></font></ruby></td>
  <td class=xl75 width=80 style='border-top:none;border-left:none;width:60pt'>
  <input type="text" name="q2.date" value="<fmt:formatDate value="${q2.date}" pattern="yyyy-MM-dd"/>"/>
  <span style="font-size:12px;">(格式：2012-02-25)</span>
  <ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
 </tr>
 <tr height=36 style='height:27.0pt'>
  <td height=36 class=xl79 width=128 style='height:27.0pt;border-top:none;
  width:96pt'>贫困户<br>
    （签名）<span
  style='mso-spacerun:yes'></span><ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl80 style='border-top:none;border-left:none'>${q2.family.name }　</td>
  <td class=xl81 width=95 style='border-top:none;border-left:none;width:71pt'>户主身份证号码<ruby><font
  class="font7"><rt class=font7></rt></font></ruby></td>
  <td class=xl82 width=80 style='border-top:none;border-left:none;width:60pt'>${q2.family.idNo }　</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=128 style='width:96pt'></td>
  <td width=317 style='width:238pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=80 style='width:60pt'></td>
 </tr>
 <![endif]>
 <c:if test="${q2.year==2012}">
 <tr style='mso-yfti-irow:123;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;border:none;mso-border-top-alt:
  solid windowtext .5pt;padding:0cm 5.4pt 0cm 5.4pt;height:18.75pt'>
  <p class=MsoNormal align=left style='text-align:left;mso-pagination:widow-orphan'><span
  style='font-size:12.0pt;font-family:黑体;mso-hansi-font-family:宋体;mso-bidi-font-family:
  宋体;mso-font-kerning:0pt'>　<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:124;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:18.75pt'>
  <p class=MsoNormal align=left style='text-align:left;mso-pagination:widow-orphan'><span
  style='font-size:12.0pt;font-family:黑体;mso-hansi-font-family:宋体;mso-bidi-font-family:
  宋体;mso-font-kerning:0pt'>说明：<span lang=EN-US><o:p></o:p></span></span></p>
  </td>
 </tr>
 <tr style='mso-yfti-irow:126;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:18.75pt'>1.表二适用于填写贫困户帮扶工作和帮扶成效，一户贫困户对应填一张表。
  </td>
 </tr>
 <tr style='mso-yfti-irow:126;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:18.75pt'>2.数据统计截止至2012年12月31日。
  </td>
 </tr>
 <tr style='mso-yfti-irow:126;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:18.75pt'>3.“贫困户类型”和“住房结构类型”填相应选项的数字“1、2、3、4”。	
  </td>
 </tr>
  <tr style='mso-yfti-irow:126;height:18.75pt'>
  <td width=741 colspan=4 style='width:556.0pt;padding:0cm 5.4pt 0cm 5.4pt;
  height:18.75pt'>4.需填写“（1）是（2）否”的项目，“是”填“1”，“否”填“2”。	
  </td>
 </tr>
 </c:if>
</table>

		
		<div style="text-align: center;">
		<c:if test="${empty q2.status || q2.status == 0}">
		</c:if>
		<c:if test="${year == 2012}">
		<input type="button" class="button" value="打印" name="打印" onclick="window.print();">
		<input type="button" class="button" value="导出" name="导出" onclick="self.location.href = '${appPath}questionOrg_exportQ2.action?q2.id=${q2.id}'">
		</c:if>
		</div>
	</form>
	</body>
</html>