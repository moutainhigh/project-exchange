<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}��ְ��-${city.simpleName}��ѧ����ְ�� -��ְ��</title>
		<meta name="keywords" content="${city.simpleName}��ְ��">
		<meta name="description" content="${city.simpleName}��ְ��ÿ����´�����${city.simpleName}��ְ��Ƹ��Ϣ;������������${city.simpleName}��ѧ����ְ,�ҽ�,�����ɷ�,ģ������,���ϼ�ְ����Ϣ;��������${city.simpleName}��ѧ����ְ����ѷ�����Ϣ��">
		<link rel="Bookmark" href="http://www.jianzhi8.com/comcity/favicon.ico" />
		<link rel="shortcut icon" href="http://www.jianzhi8.com/comcity/favicon.ico" type="image/x-icon" />
		<link href="${base}css/reset.css" rel="stylesheet" type="text/css" />
		<script src="${base}js/jquery-1.7.1.min.js"></script>
		<script>
			$(function(){
				$('.nav_botttom a').eq(0).addClass('now_a');
			});
		</script>
	</head>

<body>
	<#include "/head.ftl"/>
	<!--��ǰλ������-->
	<div class="current">��ְ��&nbsp;&gt;&nbsp;<a href="/">${city.simpleName}��ְ</a></div>
	<div class="con">
		<div class="con_left">
			<div class="con_left_subnav">
				<ul>
					<li><a href="/jianzhi/K01"><span>${city.simpleName}��ѧ����ְ</span></a></li>
					<li><a href="/jianzhi/K02"><span>��Ʒ����</span></a></li>
					<li><a href="/jianzhi/K03"><span>��ְ����Ա</span></a></li>
					<li><a href="/jianzhi/K04"><span>�ʾ�/�ɷ�/����</span></a></li>
					<li><a href="/jianzhi/K05">��ְ���</a></li>
					<li><a href="/jianzhi/K06">ҵ��/����</a></li>
					<li><a href="/jianzhi/K07">IT��ҵ</a></li>
					<li><a href="/jianzhi/K08">��ְ����</a></li>
					<li><a href="/jianzhi/K11">ǰ̨/�ͷ�/��ѯ</a></li>
					<li><a href="/jianzhi/K09">���/���/�Ű�</a></li>
					<li><a href="/jianzhi/K13">����/��ķ</a></li>
					<li><a href="/jianzhi/K12">��Ա/��̨</a></li>
					<li><a href="/jianzhi/K14"><span>��ְ�ҽ�</span></a></li>
					<li><a href="/jianzhi/K15">����/����</a></li>
					<li><a href="/jianzhi/K16"><span>����/ģ��/��Ա</span></a></li>
					<li><a href="/jianzhi/K17">����/˾��</a></li>
					<li><a href="/jianzhi/K18">����/˾��</a></li>
					<li><a href="/jianzhi/K19">ҽ��/����/����</a></li>
					<li><a href="/jianzhi/K21">����/װ��</a></li>
					<li><a href="/jianzhi/K22">����/���</a></li>
					<li><a href="/jianzhi/K23">�༭/����</a></li>
					<li><a href="/jianzhi/K24"><span>${city.simpleName}KTV��ְ</span></a></li>
					<li><a href="/jianzhi/K17">ʵϰ/ѧͽ</a></li>
					<li><a href="/jianzhi/K26"><span>�ӵ㹤/����</span></a></li>
				</ul>
			</div>
			<div class="clear"></div>
			<div class="con_left_btm">
				<div class="con_left_l">
					<div class="con_left_cn le1">
						<ul>
							<#if jzList?size gt 24>
							<#list jzList[0..24] as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							<#else>
							<#list jzList as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							</#if>
						</ul>
					</div>
					<div class="con_left_cn le2">
						<ul>
							<#if jzList?size gt 25>
							<#list jzList[25..] as j>
							<li>[<a href="/jianzhi/${j.typeId}" target="_blank"><span>${j.typeName}</span></a>]<a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if (j.title+j.typeName)?length lt 20>${j.title}<#else>${j.title[0..(18-j.typeName.length())]}</#if></a>    <strong>${j.regdate?string("MM-dd")}</strong> </li>
							</#list>
							</#if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="con_right">
			<div class="con_right_con tg">
				<h3>�ȵ���Ƹ��Ϣ</h3>
				<ul>
					<#list hotList as j>
					<li<#if j.ding> class="ding"</#if>><a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if j.title?length lt 19>${j.title}<#else>${j.title[0..18]}</#if></a></li>
					</#list>
				</ul>
			</div>
			
			<div class="con_right_con zp">
				<h3>${city.simpleName}��ְ��Ϣ</h3>
				<ul>
					<#list qiuzhiList as j>
					<li><a title="${j.title}" href="/a${j.ctNo}.html" target="_blank"><#if j.title?length lt 19>${j.title}<#else>${j.title[0..18]}</#if></a></li>
					</#list>
				</ul>
			</div>
			
			<div class="con_right_con xx">
				<h3>${city.simpleName}���¼���</h3>
				<ul>
					<#list rencaiList as u>
					<li><a title="${u.userName}" href="/b${u.userNo}.html" target="_blank">${u.userName}�ļ���</a></li>
					</#list>
				</ul>
			</div>
		</div>
	</div>

<div class="clear"></div>
<div class="friendly_link">
	<div class="friendly_link_sc">
	<p><span>����������</span>
	<#list keysList as key>
	<a href="/s/s${(key+'��ְ')?url}">${key}</a>
	</#list>
	</p>
	</div>
	<div class="friedly_link_jc">
	<p><span>�ȵ���У�</span>
	<A href="http://bj.jianzhi8.com">������ְ</A>
	<A href="http://suzhou.jianzhi8.com">����</A>
	<A href="http://sh.jianzhi8.com">�Ϻ���ְ</A>
	<A href="http://fz.jianzhi8.com">����</A>
	<A href="http://tj.jianzhi8.com">����ְ</A>
	<A href="http://xa.jianzhi8.com">����</A>
	<A href="http://cq.jianzhi8.com">�����ְ</A>
	<A href="http://gz.jianzhi8.com">���ݼ�ְ</A>
	<A href="http://cs.jianzhi8.com">��ɳ</A>
	<A href="http://sz.jianzhi8.com">���ڼ�ְ</A>
	<A href="http://nc.jianzhi8.com">�ϲ�</A>
	<A href="http://cd.jianzhi8.com">�ɶ���ְ</A>
	<A href="http://heb.jianzhi8.com">������</A>
	<A href="http://hz.jianzhi8.com">���ݼ�ְ</A>
	<A href="http://zz.jianzhi8.com">֣��</A>
	<A href="http://nj.jianzhi8.com">�Ͼ���ְ</A>
	<A href="http://dl.jianzhi8.com">����</A>
	<A href="http://www.jianzhi8.com/index.html">����...</A>
	</p>
	</div>
	<#if brotherCityList?exists>
	<div class="friedly_link_jc">
	<p><span>�ܱ߳��У�</span>
	<#list brotherCityList as c>
	<A href="http://${c.cityId}.jianzhi8.com" target="_blank">${c.simpleName}��ְ</A>
	</#list>
	</p>
	</div>
	</#if>
	<div class="friedly_link_link">
	<span>�������ӣ�</span>
	<#list linkList as link><a href="${link.linkHttp}" target="_blank">${link.linkName}</a></#list>
	<A href="http://www.jianzhi8.com/">��ְ����</A>
	<A href="http://www.jianzhi8.com/keyword-%E6%9A%91%E5%81%87" target='_blank'>��ټ�ְ</A>
	<A href="http://www.jianzhi8.com/keyword-%E5%91%A8%E6%9C%AB" target='_blank'>��ĩ��ְ</A>
	<A href="http://www.jianzhi8.com/">���ϼ�ְ</A>
	<A href="http://www.jianzhi8.com/keyword-%E5%8D%81%E4%B8%80" target='_blank'>ʮһ��ְ</A>
	</p>
	</div>
</div>
<#include "/foot.ftl"/>
