<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>${city.simpleName}${c.ctTitle}_${typeName}${ctClass}</title>
		<meta name="keywords" content='' />
		<meta name="description" content='${user.userCompanyName}��ҵ��չ��Ҫ,����Ƹ${city.simpleName}${typeName}${ctClass}��Ա<#if c.ctJobnum!='0'>${c.ctJobnum}<#else>����</#if>��(${c.ctTitle}),�����ص���${city.name},н��Ϊ${c.ctSalary},�Ա�Ҫ��:${c.ctSelsex}<#if c.ctClass=='0'&&c.ctJobdate?exists>,����ʱ��Ϊ<#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></#if>.'/>
		<link rel="Bookmark" href="/favicon.ico" />
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link href="/css/reset.css" rel="stylesheet" type="text/css" />
		<link href="/css/mian.css" rel="stylesheet" type="text/css" />
		<script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="/js/accordian.pack.js"></script>
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
		<a href="http://${city.cityId}.jianzhi8.com/">${city.simpleName}��ְ</a> &gt;
		<#if c.ctClass=='0'>
			<a href="/${typemap[c.ctTypeId]['typeId']}/">${city.simpleName}<#if c.ctTypeId?exists>${typemap[c.ctTypeId]['typeName']?replace('��ְ', '')}</#if>��ְ</a>
		<#elseif  c.ctClass=='1'>
			<a href="/zp${jobtypemap[c.ctTypeId]['typeId']}/">${city.simpleName}<#if c.ctTypeId?exists>${jobtypemap[c.ctTypeId]['typeName']?replace('��Ƹ', '')}</#if>��Ƹ</a>
		</#if>
	</div>
	<div class="zj_con">
		<div class="zj_con_l">
			<h3>${c.ctTitle}<span>����ʱ�䣺${c.ctUpdate?string('yyyy-MM-dd')}&nbsp;</span></h3>
			<p class="zj_con_rz">��˾���ƣ�<#if user.userId=='admin'||user.userCompanyName==''||user.userCompanyName==' '>δ��д<#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><img src="img/com_r2_c2.jpg" alt="�õ�λӪҵִ��������֤"/></span></#if></#if></p>
			<p class="zj_con_sp"><span>ְλ���</span>
			<#if c.ctClass=='0'>
			<a href="/${typemap_py[c.ctTypeId]}/" target="_blank">${typeName}${ctClass}</a>&nbsp;&nbsp; <span> �������ʣ�</span>��ְ
			</#if>
			<#if c.ctClass=='1'>
			<a href="/zp${jobtypemap_py[c.ctTypeId]}/" target="_blank">${typeName}${ctClass}</a>&nbsp;&nbsp; <span> �������ʣ�</span>ȫְ
			</#if>
			</p>
			
			<input name="pno" value="${c.ctNo}" type="hidden"><input name="user_id" value="${c.ctUserId}" type="hidden">
		<script language="javascript">
	function favo2() {
		var mindx = document.all.pno.value;
		window.open('http://my.jianzhi8.com/post_ptoc.jsp?pno=' + mindx,
				'NewWindow');
	}
	function post2() {
		var mindx = document.all.pno.value;
		var mindx2 = document.all.user_id.value;
		window.open('http://my.jianzhi8.com/ptoc.jsp?pno=' + mindx + '&uid='
				+ mindx2, 'NewWindow');
	}
</script>
			<div class="anniu"><A onclick="javascript:post2();" href="javascript:void(0);" rel=nofollow>����ְλ</a></div>
			<div class="anniu2"><A onclick="javascript:favo2();" href="javascript:void(0);" rel=nofollow>�ղ�ְλ</a></div>
			<p class="zj_con_jc jz_bj con_zpx">ְλ��Ϣ��</p>
			<ul class="con_ul2">
				<li><span>н��ˮƽ��</span>${c.ctSalary}</li>
				<li><span>��Ƹ������</span><#if c.ctJobnum!='0'>${c.ctJobnum}��<#else>����</#if></li>
				<li><span>�Ա�Ҫ��</span>${c.ctSelsex}</li>
				<li><span>�����ص㣺</span>${city.name}</li>
				<#if c.ctClass=='0'>
				<li><span>����ʱ�Σ�</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li>
				</#if>
			</ul>
			<div class="clear"></div>
			<p class="zj_con_jc">ְλ������</p>
			<ul class="con_bh con_ul con_ubj">
				<p>${c.ctContent}
				<br>��ϵ��ʱ��һ��˵�����ڼ�ְ���Ͽ����Ĵ���Ϣ��лл��
				</p>
			</ul>
	
			<p class="zj_con_jc jz_bj">��˾���ܣ�</p>
			<p class="con_dl">${user.userBrief}</p>
			
			<p class="zj_con_jc jz_bj">��ϵ��ʽ��<font style="color: #a20000; FONT-WEIGHT: normal; font-size: 14px;">����ʾ������Ҫ�����ɱ�֤�𡢸�ѡ�Ѻ��ȷ��õ���Ƹ����100%Ϊ�����Ϣ�������ϵ���ƭ����</font></p>
		
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
			<DIV class=clear></DIV>
						<div class="gray6 jobdisc-share"
							style="MARGIN-BOTTOM: 15px; MARGIN-TOP: 0px; MARGIN-LEFT: 8px">
							�����Ϣ���б𷽷������ֻ��Ż��û�ip�Ƿ񱾵ط������綼����ط�������ô��Ҫ�����ˡ�
							<script src="http://css.jianzhi8.com/comcity/myjs/ip.js"></script>
							<br>���û���ip��
							<a href="javascript:labelIp('showIpInfo','${user.userIpaddr }');"
								title="�����ʾ">${user.userIpaddr }</a> ������IP��ʾ�����أ�
							<span id="showIpInfo" style="color: #FF0000"></span>

							<form name="formLocating"
								action="http://www.ip138.com:8080/search.asp" method="post"
								target="_blank">

								<input type="text" name="mobile"
									style="FONT-SIZE: 12px; color: #555555; vertical-align: bottom;"
									value="�������ֻ�����" onblur="Trim_char(this);"
									onFocus="this.style.color='#000000';if( '�������ֻ�����' == this.value) this.value=''" />
								<input type="hidden" name="action" value="mobile">
								<input type="submit" value="��ѯ���������" />
							</form>
						</div>
			
			<div class="clear"></div>
			<ul class="con_xh">
				<li class="zj_con_jc">��ؼ�ְ��Ϣ��</li>
				<#list moreList as m>
				<li><span>${m.ctUpdate?string('MM-dd')}</span><#if m.ctCityId?exists && m.ctCityId.length()==6><a href="/${ctClassLink}${m.ctCityId}/">${m.ctCityName}</a><#else><a href="/">${m.ctCityName}</a></#if><a href="/a${m.ctNo}.html">${m.ctTitle}</a></li>
				</#list>
			</ul>
			<script type="text/javascript">/*500*200��������2010-8-3*/ var cpro_id = 'u134894';</script><script src="http://cpro.baidu.com/cpro/ui/c.js" type="text/javascript"></script>
			<div class="clear"></div>				
			<p class="con_ckz">�������Բ鿴�ù�˾<#if user.userId=='admin'||user.userCompanyName==''><a href=#><#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank"></#if>����ְλ</a>������<a href="http://my.jianzhi8.com/fb.do" target="_blank">������ְ��Ϣ</a>��</p>
				
		</div>
		<div class="zj_con_r">
			<h3>��ְ����������</h3>
			<p> 
����${city.simpleName}��Ƹ��ְ${typeName}��Ϣ�����û����з���������ʵ�ԡ�׼ȷ�ԺͺϷ�������Ϣ�����˸��� ${city.simpleName}��ְ�����е�����${c.ctTitle}�����ݵĺϷ��Լ���ʵ���������һ������ͷ������Ρ�</p>
			<p class="zj_con_img">
				<SCRIPT language=JavaScript
					src="http://css.jianzhi8.com/fenzhan/ggads/160_600.js"
					type=text/javascript></SCRIPT>
			</p>
		</div>
		<div class="clear"></div>
	</div>
	<div class="brother_city_list">
	<p class="tb_jz">
	<span>�ܱ�${typeName}${ctClass}��</span>
	<#if c.ctClass=='0'>
	<#list subCityList as city>
	<a href="/${city.cityId}/${typemap_py[c.ctTypeId]}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/${c.ctTypeId}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	<#else>
	
	<#list subCityList as city>
	<a href="/zp${city.cityId}/zp${jobtypemap_py[c.ctTypeId]}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
		<#list brotherCityList as city>
	<a href="http://${city.cityId}.jianzhi8.com/zp${c.ctTypeId}/">${city.simpleName}${typeName}${ctClass}</a>
	</#list>
	</#if>
	</p>
	</div>
	<SCRIPT language=JavaScript	src="http://css.jianzhi8.com/js/copy.js" type=text/javascript></SCRIPT>
	<span style="display: none"> 
 <IFRAME src="http://soho.jianzhi8.com/infoclick.jsp?pno=${c.ctNo}"frameBorder=0 width=0 scrolling=no height=0></IFRAME>
 </span>	
<#include "/WEB-INF/template/foot.ftl"/>