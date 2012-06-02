<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta name="viewport" content="width=device-width; initial-scale=1.0; minimum-scale=1.0; maximum-scale=2.0" />
    <meta name="MobileOptimized" content="240" />
    <meta name="format-detection" content="telephone=no" />
    <title>��ְ8--${city.simpleName}վ--</title>
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/js/jquery-1.4.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
	</script>
</head>
<body>
    <#include "/WEB-INF/template/head.ftl"/>
    <div class="search">
        <span>��ҳ</span>&nbsp;>&nbsp;<span>${city.simpleName}����</span>&nbsp;>&nbsp;<span>${typeName}</span>
    </div>
    <div class="content_model">
        <h2>
            ${c.ctTitle}
        </h2>
        <p>
            ��˾����: <#if user.userId=='admin'||user.userCompanyName==''||user.userCompanyName==' '>δ��д<#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank">${user.userCompanyName}</a><#if user.userIsyz=='1'><span><img src="img/com_r2_c2.jpg" alt="�õ�λӪҵִ��������֤"/></span></#if></#if>
        </p>
        <#if c.ctClass=='0'>
		<p>ְλ���:<a href="/${city.cityId}/${typemap[c.ctTypeId]['typeId']}/">${typeName}${ctClass}</a></p>
		<p><span> �������ʣ�</span>��ְ</p>
		</#if>
		<#if c.ctClass=='1'>
		<p>ְλ���:<a href="/${city.cityId}/zp${jobtypemap[c.ctTypeId]['typeId']}/">${typeName}${ctClass}</a></p>
		<p><span> �������ʣ�</span>ȫְ</p>
		</#if>
		
    </div>
    <div class="content_model">
        <h2>
            <b>ְλ��Ϣ:</b></h2>
        <ul>
            <li>н��ˮƽ:<span>${c.ctSalary}</span></li>
        </ul>
        <ul>
            <li>��Ƹ����:<span><#if c.ctJobnum!='0'>${c.ctJobnum}��<#else>����</#if></span></li>
        </ul>
        <ul>
            <li>�Ա�Ҫ��:<span>${c.ctSelsex}</span></li>
        </ul>
        <ul>
            <li>�����ص�:<span>${city.name}</span></li>
        </ul>
        <#if c.ctClass=='0'>
		<ul><li><span>����ʱ�Σ�</span><#if c.ctJobdate?exists>${jobdatemap[c.ctJobdate]}</#if></li></ul>
		</#if>
    </div>
    <div class="content_model">
        <h2>
            <b>ְλ����</b></h2>
        <div>
            <p>
               ${c.ctContent}
               <br/>
                ��ϵ��ʱ��һ��˵�����ڼ�ְ���Ͽ����Ĵ���Ϣ��лл��
            <p>
        </div>
    </div>
    <div class="content_model">
        <h2><b>��˾����</b></h2>
        <div>
            <p>
                ${user.userBrief}
            </p>
        </div>
    </div>
    <div class="content_model">
        <h2>
            <b>��ϵ��</b></h2>
        <span style="color: Red; font-size: small">����ʾ������Ҫ�����ɱ�֤�𡢸�ѡ�Ѻ��ȷ��õ���Ƹ����100%Ϊ�����Ϣ�������ϵ���ƭ����</span>
        <div>
            <p>
                ��ϵ�ˣ� <span>${c.ctUserName}</span>
            </p>
            <p>
                �绰�� <span><img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctPhone }'/></span></p>
            <p>
                �ֻ��� <span><img id='Image1' name='Image1' align='absmiddle' src='/code/phone.jsp?tel=${c.ctMobile }'/></span>
            </p>
            <p>
                QQ��<span><a target=blank href=tencent://message/?uin=${c.ctQq }&Menu=yes><img border='0' SRC=http://wpa.qq.com/pa?p=1:${c.ctQq }:4 alt='���������ҷ���Ϣ'>${c.ctQq }</a></span>
            </p>
            <p>
                Email��<span><img id='Image1' name='Image1' align='absmiddle' src='/code/email.jsp?mail=${c.ctEmail }'/></span>
            </p>
            �����Ϣ���б𷽷������ֻ��Ż��û�ip�Ƿ񱾵ط������綼����ط�������ô��Ҫ�����ˡ�
        </div>
    </div>
    <div class="content_model">
        <ul><li style="background-color: #EEE;"><b>��ؼ�ְ��Ϣ��</b></li></ul>
        <#list moreList as m>
		<ul><li><span>${m.ctUpdate?string('MM-dd')}</span>&nbsp;${m.ctCityName}&nbsp;<a href="/${city.cityId}/a${m.ctNo}.html">${m.ctTitle}</a></li></ul>
		</#list>
        
    </div>
    <div>
        <p style="padding: 5px 0px;">
           �������Բ鿴�ù�˾<#if user.userId=='admin'||user.userCompanyName==''><a href=#><#else><a href="http://www.jianzhi8.com/user/${user.userId?url}" target="_blank"></#if>����ְλ</a>������<a href="http://my.jianzhi8.com/fb.do" target="_blank">������ְ��Ϣ</a>��
        </p>
    </div>
    <div class="new-in-wp">
        <div class="nw-wp-bg">
            <div class="nw-title">�Ҽ�ְ���ϼ�ְ8������!</div>
        </div>
    </div>
    <div class="new-con">
        <p>
            <a href="#"><strong>*</strong>���λ,�ƽ�λ��</a></p>
        <p>
    </div>
<#include "/WEB-INF/template/foot.ftl"/>
