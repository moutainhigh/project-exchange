<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle }</title>
		<meta name="keywords" content='${city.simpleName}${c.ctTitle }' />
		<meta name="description" content='${city.simpleName}${c.ctTitle }������Ϣ,�����ṩ${user.userCompanyName}������${city.simpleName}���µ�${c.ctTitle }������Ѷ,������Щ��˾����Ƹ${c.ctTitle }��${city.simpleName}${c.ctClass}${c.ctTypeName }���¼${city.simpleName}��ְ�ɲ鿴��'/>
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="http://css.jianzhi8.com/fenzhan/css/reset.css" rel="stylesheet" type="text/css" />
		<script src="http://css.jianzhi8.com/fenzhan/js/jquery-1.7.1.min.js"></script>
		<script src="http://css.jianzhi8.com/fenzhan/js/top.js"></script>
		<script>
			var jobtimes = '${c.ctJobtime}';
			$(function(){
				if(jobtimes != ''){
					var arr = jobtimes.split('-');
					for(var i = 0 ; i < arr.length; i++){
						$('td.t' + arr[i]).html('<img src="/img/g_r2_c2.jpg" />');					
					}
				}
			});
		</script>
	</head>
<body>
	<#include "/WEB-INF/template/top.ftl"/>
	<!--��������-->
	<div class="nav">
    	<div class="nav_top clearfix">
        	<a href="#" class="logo_a"><img src="/img/home_r2_c2_s1.jpg" /></a>
            <ul>
            	<li><b>ȫ��</b></li>
                <li>
                	   <SCRIPT language="JavaScript" src="http://css.jianzhi8.com/fenzhan/js/city.js" type="text/javascript"></SCRIPT>
                </li>
            </ul>
             <div class="serch_div">
            	<A href="#" class="agg_a" onmousemove="document.getElementById('a_hover_ul').style.display='block'"onmouseout="document.getElementById('a_hover_ul').style.display='none'">��ҳ���</A><input type="text" class="sr_btn" /><input type="button" value="" />
                <ul id="a_hover_ul" style="display:none;" onmousemove="document.getElementById('a_hover_ul').style.display='block'" onmouseout="document.getElementById('a_hover_ul').style.display='none'">
                    <li><a href="#">��ҳ���</a></li>
                    <li><a href="#">��ҳ���</a></li>
                    <li><a href="#">��ҳ���</a></li>
                </ul>
            </div>
          <p><input type="button" value="��ѷ�����Ϣ" class="gs_mff" /><input type="button" value="д����"  class="gs_xjl"/></p>
            
        </div>
        <div class="nav_botttom clearfix">
        	<ul class="clearfix">
            	<li><A href="/">��ҳ</A></li>
                <li><A href="/jianzhi/">��ְ��Ƹ</A></li>
                <li><A href="/job/">ȫְ��Ƹ</A></li> 
                <li><A href="/rencai/">������ְ</A></li>
                <li><A href="/resume/">��������</A></li>
                <li><A href="/qiuzhizhidao/">��ְָ��</A></li>
                <li><A href="/biyezhidao/">��ҵָ��</A></li>
                <li style="background:none;"><A href="/zph/">��Ƹ��</A></li>
            </ul>
        </div>
    </div>
	<!--��ǰλ������-->
	<div class="current con_wlnr">
		<span>
		�����<font color="red">${c.ctLooknum}</font> ��
		</span>
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<#if c.ctClass=='0'>	
			<a href="/rc${typemap[c.ctTypeId]['typeId']}/rcc0/">${city.simpleName}��<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']}</#if>����</a>
		<#else>
			<a href="/rc${jobtypemap[c.ctTypeId]}/rcc1/">${city.simpleName}��<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']}</#if>����</a>
		</#if>
	</div>
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}</h3>
			<p><span>��ְλ��</span><#list typeList as t><a href="/rc${t.typeId}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list><#list jobTypeList as t><a href="/rc${t.typeId}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
			</p>
			<ul class="con_ul2">
				<li><span>��&nbsp;&nbsp;����</span><#if user.userbrief?exists><a href="/resume/${user.userNo}.html">${user.userName}</a></#if>${user.userName}</li>
				<li><span>�˲����ͣ�</span><#if user.userShenfen?exists>${user.userShenfen}<#else>δ��д</#if></li>
				<li><span>ѧ&nbsp;&nbsp;����</span><#if c.ctDigree?exists&&c.ctDigree!=' '>${c.ctDigree}<#else>δ��д</#if></li>
				<li><span>��&nbsp;&nbsp;�䣺</span><#if user.userAge?exists&&user.userAge!=''>${user.userAge}<#else>δ��д</#if></li>
				<li><span>��&nbsp;&nbsp;&nbsp;&nbsp;��</span><#if c.ctSelsex?exists&&c.ctSelsex!=' '>${c.ctSelsex}<#else>δ��д</#if></li>
				<li><span>����нˮ��</span><#if c.ctSalary?exists>${c.ctSalary}<#else>δ��д</#if></li>
				<li><span>�������ʣ�</span><#if c.ctClass=='0'>��ְ<#else>ȫְ</#if></li>
				<li><span>�����ص㣺</span>${city.cityName}</li>
				<li><span>����ʱ�䣺</span>${c.ctUpdate?string('yyyy-MM-dd')}</li>
			</ul>			
			<div class="clear"></div>
			<h2 class="zj_con_jc jz_bj">��ְ��Ϣ��</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			${c.ctContent}
			<br>��ϵ��ʱ��һ��˵�����ڼ�ְ���Ͽ����Ĵ���Ϣ��лл��
			</p>
			</div>
			<h2 class="zj_con_jc jz_bj">�������ۣ�</h2>
			<div class="con_p_con">
			<p class="con_sjj">
			<#if user.userPingjia?exists>${user.userPingjia}<#else>����һ������ɶҲû����~\(^o^)/~</#if>
			</p>
			</div>
           <div class="clear"></div>
			<h2 class="zj_con_jc jz_bj">��ϵ��ʽ��</h2>
			<ul class="con_ds con_ubj">	
				<#if c.ctContact?exists && c.ctContact!=''>
				<p>
				${c.ctContact}
				</p>
				<#else>
					<#if c.ctUserName?exists && c.ctUserName!=''>
					<li>
					��ϵ�ˣ�${c.ctUserName}
					</li>
					</#if>
					<#if c.ctPhone?exists && c.ctPhone!=''>
					<li>
					�绰��<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/>
					</li>
					</#if>
					<#if c.ctMobile?exists && c.ctMobile!='' >
					<li>
					�ֻ���<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/>
					</li>
					</#if>
					<#if c.ctQq?exists && c.ctQq!='' >
					<li>
					QQ��
					<a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='���������ҷ���Ϣ'>${c.ctQq }</a>
					</li>
					</#if>
					<#if  c.ctEmail?exists && c.ctEmail!='' >
					<li>
					Email��<img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/>
					</li>
					</#if>				
			</#if>
			</ul>
	
			<h2 class="zj_con_jc jz_bj">�ɹ���ʱ�䣺</h2>
			<div class="con_gzsj">
				<table width="537" height="139" cellpadding="0" cellspacing="0">
					<tr bgcolor="#F4F4F4">
						<td></td>
						<td>����һ</td>
						<td>���ڶ�</td>
						<td>������</td>
						<td>������</td>
						<td>������</td>
						<td>������</td>
						<td>������</td>
					</tr>
					<tr>
						<td>����</td>
						<td class="t01"></td>
						<td class="t02"></td>
						<td class="t03"></td>
						<td class="t04"></td>
						<td class="t05"></td>
						<td class="t06"></td>
						<td class="t07"></td>
					</tr>
					<tr>
						<td>����</td>
						<td class="t08"></td>
						<td class="t09"></td>
						<td class="t10"></td>
						<td class="t11"></td>
						<td class="t12"></td>
						<td class="t13"></td>
						<td class="t14"></td>
					</tr>
					<tr>
						<td>����</td>
						<td class="t15"></td>
						<td class="t16"></td>
						<td class="t17"></td>
						<td class="t18"></td>
						<td class="t19"></td>
						<td class="t20"></td>
						<td class="t21"></td>
					</tr>
	
				</table>
			</div>
			
				<ul class="con_xh">
					<li class="zj_con_jc">��ظ�����ְ��Ϣ��</li>
					<#list moreList as m>
					<li><span>${m.ctUpdate?string('MM-dd')}</span><#if m.ctCityId?exists && m.ctCityId.length()==6><a href="/rc${m.ctCityId}/">${m.ctCityName}</a><#else><a href="/">${m.ctCityName}</a></#if><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
					</#list>
				</ul>
				
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT></p>
		</div>
		<div class="clear"></div>
	</div>

	<div class="brother_city_list">
	<p class="tb_jz">
	<span>�ܱ�${typeName}��ְ��Ϣ��</span>
	<#if c.ctClass=='0'>
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rc${typemap_py[c.ctTypeId]}/rcc0/">${city.simpleName}��${typeName}����</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/rc${c.ctTypeId}/rcc0/">${city.simpleName}��${typeName}����</a>
	</#list>
	<#else>
	
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rc${jobtypemap_py[c.ctTypeId]}/rcc1/">${city.simpleName}��${typeName}����</a>
	</#list>
		<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/rc${c.ctTypeId}/rcc1/">${city.simpleName}��${typeName}����</a>
	</#list>
	</#if>
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
	<span style="display: none"> 
 <IFRAME src="http://soho.jianzhi8.com/infoclick.jsp?pno=${c.ctNo}"frameBorder=0 width=0 scrolling=no height=0></IFRAME>
 </span>
<#include "/WEB-INF/template/foot.ftl"/>
