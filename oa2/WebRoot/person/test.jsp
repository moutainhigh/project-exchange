<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>����ҽ��ע��</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
	</head>

	<body>

		<form name="messageForm" method="post">

			<table border="0" width="90%" class=table align=center>
				<tr>
					<td>
						�������⣺
						<input type="text" name="title" value="" />
						&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="button" name="" value="�� ѯ" onclick="query();">
					</td>
				</tr>
			</table>
			<div style="height: 25px;"></div>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr class=list_td_title>
					<td align="center" width="5%">
						<input type="checkbox" name="msg_ck" onclick="selectAll(this,'_msg_ck')">
					</td>
					<td align="center" width="12%">
						������
					</td>
					<td align="center" width="12%">
						����
					</td>
					<td align="center" width="36%">
						����
					</td>
					<td align="center">
						����ʱ��
					</td>
					<td align="center" width="7%">
						�༭
					</td>


				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1154">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						̨����Ϣ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							��ʡ����̨������̨�硰���㡱����22��ҹ
						</div>
					</td>
					<td align="center">
						2010-10-22 09:29:17.62
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1054);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1146">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						��������2009��Ȼ�����������������Ŀ�ʽ������Ľ���֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							����������2009��Ȼ�����������������
						</div>
					</td>
					<td align="center">
						2010-10-15 10:33:09.87
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1046);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1143">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						�������ü�����������֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							�㵥λ�����������յ������㵥λ���в���ְ
						</div>
					</td>
					<td align="center">
						2010-10-13 16:37:39.047
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1043);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1142">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						��������ڲ�������ѵ���ִ��֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							�뻹û�б�������ڲ�������ѵ���ִ�ĵ�λ
						</div>
					</td>
					<td align="center">
						2010-10-13 16:14:10.437
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1042);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1141">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						���ڱ�������ڲ�������ѵ���ִ��֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							�뻹û�б�������ڲ�������ѵ���ִ�ĵ�λ
						</div>
					</td>
					<td align="center">
						2010-10-13 16:05:39.997
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1041);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1137">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						������֯��Ա�μ�ȫ������ڲ�������ѵ��Ľ���֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							��������֯��Ա�μ�ȫ������ڲ�������ѵ
						</div>
					</td>
					<td align="center">
						2010-10-12 10:27:40.17
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1037);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1134">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						22
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							22
						</div>
					</td>
					<td align="center">
						2010-10-11 15:15:20.373
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1034);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1130">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						����
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							�Ҿ���10��11��������ʱ���ھ���¥����
						</div>
					</td>
					<td align="center">
						2010-10-09 16:34:23.64
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1030);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1129">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center"></td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							��ã����Ļ��з۳���߶���ƷΣ������ר��
						</div>
					</td>
					<td align="center">
						2010-10-09 09:54:15.217
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1029);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr class=list_td_context>
					<td align="center">
						<input type="checkbox" name="_msg_ck" value="1128">
					</td>
					<td align="center">
						cy
					</td>
					<td align="center">
						�����ٿ��Ļ��з۳���߶���ƷΣ������ר���ж���鸴��׶ι��������֪ͨ
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							��ã����Ļ��з۳���߶���ƷΣ������ר��
						</div>
					</td>
					<td align="center">
						2010-10-09 09:40:57.013
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1028);'>�鿴��ϸ</a>
					</td>

				</tr>

				<tr style="font-size: 12px;">
					<td colspan="5" align="right">

						<TABLE cellSpacing=0 cellPadding=0 width="95%" align=center border=0>
							<TBODY>
							<TBODY>
								<TR class=list_td_bottom>
									<TD align=middle width="20%">
										<DIV align=left>
											ת��
											<INPUT class=input id=pageno onKeyDown="javascript:if(event.keyCode=='13'){event.returnValue = false;doPage(document.getElementById('pageno').value);}"
												onKeyUp="value=value.replace(/[^\d]/g,'')" size=3 name=pageno>
											ҳ
											<A href="javascript:doPage(document.getElementById('pageno').value)"><IMG src="images/goto.jpg" border=0>
											</A>
										</DIV>
									</TD>
									<TD align=left width=154>
										�� 479 ����¼
									</TD>
									<TD align=right width=*>
										�� 48 ҳ����1 ҳ
									</TD>
									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1==1){ alert('�Ѿ��ǵ�һҳ��');} else { doPage('1');}" src="images/up_1.gif" border=0>
									</TD>

									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript: if((1)<(48)) { doPage('2');}else{ alert('�Ѿ������һҳ��');} " src="images/up_.gif" border=0>
									</TD>

									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1!=1) { doPage('0');}else{ alert('�Ѿ��ǵ�һҳ��');} " src="images/down_.gif" border=0>
									</TD>
									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1==48){ alert('�Ѿ������һҳ��');} else { doPage('48');}" src="images/down_1.gif" border=0>
									</TD>
								</TR>
							</TBODY>
						</TABLE>
					</td>
				</tr>
			</table>
			<p>
			<table width="90%" border="0" cellspacing="1" cellpadding="0" class=table align="center">
				<tr>
					<td align="center">

						<input type="button" name="" value="ɾ ��" onclick="delmsg();">

						<input type="button" name="" value="�� ��" onclick="window.history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>

	<SCRIPT>
function checkPageNum()
{
	validatePageNum(document.messageForm.pageno,48);
}
function doPage(pageNum)
{
	if(pageNum =="") {
	    alert("������ҳ����");
	    return;
	}
	if(parseInt(pageNum) > 48) {
	    alert("����ҳ�뷶Χ��");
        document.getElementById('pageno').value="";
	    return;
	}
	if (pageNum<=0) {
	    alert("�����ҳ�벻�ԣ�");
	    document.getElementById('pageno').value="";
	    return;
	}
	//document.form1.pageNum.value=pageNum;
	document.messageForm.action="message.do?action=listSendedMessaegList&pageno="+pageNum;
	document.messageForm.submit();
}
</SCRIPT>
</html>
