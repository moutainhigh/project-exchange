<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${user.userName }���˼���</title>
		<meta name="keywords" content='' />
		<meta name="description" content='${user.userName}��ҵ��:${user.userCompanyName},ѧ��:${user.userDigree},רҵ:${user.userHangye}����:${user.userAge},�Ա�:${user.userSex},����Ҫ��${typeName}��${ctClass}����,��ס��ַ:${user.userCityName}��'/>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/main.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/accordian.pack.js"></script>
		<script src="http://css.jianzhi8.com/fenzhan/js/image.js"></script>
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
		<a href="http://www.jianzhi8.com/">��ְ��</a> &gt; 
		<a href="/">${city.simpleName}��ְ</a> &gt;
		<a href="/resume/">${city.simpleName}���˼���</a>
	</div>
	
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${user.userName}���˼���<span>����ʱ�䣺${user.userUpdate?string('yyyy-MM-dd')}</span></h3>
			<div class="con_gr_jl">
	<table border='0' style="width:700px;">
			<tr>
				<td style="width:350px;"><span>��&nbsp;&nbsp;&nbsp;&nbsp;����</span>${user.userName}</td>
				<td style="width:250px;"><span>��&nbsp;&nbsp;&nbsp;&nbsp;��</span>${user.userSex}</td>
				<td style="" rowspan="6" align="center" style="width:250px;">
				<a href="http://my.jianzhi8.com/personimages/${user.userFileName}" target="_blank">
				<img 
					onerror="{this.src='/img/xp_r2_c4.jpg';}"
					src="http://my.jianzhi8.com/personimages/${user.userFileName}"
					style="BORDER: #555 1px solid;" alt="${typeName}���˼���"
					onload="javascript:DrawImage(this,'200','200');" border="0"
					name="faceImage"/>	
					</a>
				</td>
			</tr>
			<tr>
				<td><span>��&nbsp;&nbsp;&nbsp;&nbsp;�䣺</span>${user.userAge}</td>
				<td><span>ѧ&nbsp;&nbsp;&nbsp;&nbsp;����</span>${user.userDigree}</td>
				</tr>
			<tr>
				<td><span>ѧ&nbsp;&nbsp;&nbsp;&nbsp;У��</span>${user.userCompanyName}</td>
				<td><span>ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</span>${user.userHangye}</td>
				</tr>
			<tr>
				<td><span>��ϵ�绰��</span>
					<#if user.userPhone?exists && user.userPhone!=''>	
					<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userPhone }'/>
					<#else>
					<#if user.userMobile?exists && user.userMobile!='' >
					<img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${user.userMobile }'/>
					</#if>
				   </#if>
				</td>
				<td><span>��&nbsp;ϵ QQ��</span>
				<#if user.userQq?exists && user.userQq!=''><a target=blank href=tencent://message/?uin=${user.userQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${user.userQq }:4 alt='���������ҷ���Ϣ'>${user.userQq }</a></#if></td>
				</tr>
			<tr>
				<td colspan="2"><span>�־ӵ�ַ��</span>${user.userCityName}</td>
				</tr>
		</table>

			</div>
		
			<h2 class="zj_con_jc jz_bj con_zpx">��ְ����</h2>
			<ul class="con_ul con_ubj">
				<li><span>��ְ���ͣ�</span>${ctClass}</li>
				<li><span>����ְλ��</span>
			<#list typeList as t><a href="/rc${typemap_py[t.typeCode]}/rcc0/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
			<#list jobTypeList as t><a href="/rc${jobtypemap_py[t.typeCode]}/rcc1/" style="margin-right:5px;" target="_blank">${t.typeName}</a></#list>
				</li>
			</ul>
			<h2 class="zj_con_jc jz_bj">�������ۣ�</h2>
			<div class="con_p_con">
			<p class="con_sjj">${user.userPingjia}</p>
			</div>
			<h2 class="zj_con_jc jz_bj">�������飺</h2>
			<div class="con_p_con">
				<p class="con_sjj">${user.userBrief}</p>
			</div>			
				<ul class="con_xh">
					<li class="zj_con_jc">��ظ��˼�����</li>
					<#list moreList as m>
					<li><span>${m.userUpdate?string('MM-dd')}</span>${m.userCityName}<a href="/b${m.userNo}.html">${m.userTypeName}${m.userClass} ${m.userName}�ĸ��˼���</a></li>
					</#list>
				</ul>
				<p class="con_ckz">�������Բ鿴�õ���<a href="/resume/">������ְ����</a>������<a href="http://my.jianzhi8.com/fb.do">������Ƹ��Ϣ</a>��</p>
		</div>
		<div class="zj_con_r zj_con_gr">
			<p class="zj_con_img"><SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT></p>
		</div>
		
	</div>
<div class="clear"></div>
	<div class="brother_city_list">
	<p class="tb_jz">
	<span>�ܱ�${ctClass}������</span>
	<#list subCityList as city>
	<a href="/rc${city.cityId}/rcc0/">${city.simpleName}�ҹ���</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/resume/">${city.simpleName}���˼���</a>
	</#list>	
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
<#include "/WEB-INF/template/foot.ftl"/>