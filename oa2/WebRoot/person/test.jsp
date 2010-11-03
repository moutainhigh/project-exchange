<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>新增医生注册</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css">
	</head>

	<body>

		<form name="messageForm" method="post">

			<table border="0" width="90%" class=table align=center>
				<tr>
					<td>
						短信主题：
						<input type="text" name="title" value="" />
						&nbsp;&nbsp;&nbsp;&nbsp;

						<input type="button" name="" value="查 询" onclick="query();">
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
						发送人
					</td>
					<td align="center" width="12%">
						主题
					</td>
					<td align="center" width="36%">
						内容
					</td>
					<td align="center">
						发送时间
					</td>
					<td align="center" width="7%">
						编辑
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
						台风消息
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							据省气象台报道，台风“鲇鱼”将于22日夜
						</div>
					</td>
					<td align="center">
						2010-10-22 09:29:17.62
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1054);'>查看详细</a>
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
						关于做好2009年度基本公共卫生服务项目资金申请表的紧急通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							《关于做好2009年度基本公共卫生服务项
						</div>
					</td>
					<td align="center">
						2010-10-15 10:33:09.87
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1046);'>查看详细</a>
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
						关于做好计生报表工作的通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							你单位计生数据已收到，但你单位还有部分职
						</div>
					</td>
					<td align="center">
						2010-10-13 16:37:39.047
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1043);'>查看详细</a>
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
						报送手足口病救治培训班回执的通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							请还没有报送手足口病救治培训班回执的单位
						</div>
					</td>
					<td align="center">
						2010-10-13 16:14:10.437
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1042);'>查看详细</a>
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
						关于报送手足口病救治培训班回执的通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							请还没有报送手足口病救治培训班回执的单位
						</div>
					</td>
					<td align="center">
						2010-10-13 16:05:39.997
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1041);'>查看详细</a>
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
						关于组织人员参加全市手足口病救治培训班的紧急通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							《关于组织人员参加全市手足口病救治培训
						</div>
					</td>
					<td align="center">
						2010-10-12 10:27:40.17
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1037);'>查看详细</a>
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
						<a href="javascript:" onclick='view(1034);'>查看详细</a>
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
						会议
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							我局于10月11日下午三时，在局四楼会议
						</div>
					</td>
					<td align="center">
						2010-10-09 16:34:23.64
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1030);'>查看详细</a>
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
							你好！“四会市粉尘与高毒物品危害治理专项
						</div>
					</td>
					<td align="center">
						2010-10-09 09:54:15.217
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1029);'>查看详细</a>
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
						关于召开四会市粉尘与高毒物品危害治理专项行动检查复查阶段工作会议的通知
					</td>
					<td align="center">
						<div style="width: 180px; overflow: hidden; text-overflow: ellipsis">
							你好！“四会市粉尘与高毒物品危害治理专项
						</div>
					</td>
					<td align="center">
						2010-10-09 09:40:57.013
					</td>
					<td align="center" width="7%">
						<a href="javascript:" onclick='view(1028);'>查看详细</a>
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
											转到
											<INPUT class=input id=pageno onKeyDown="javascript:if(event.keyCode=='13'){event.returnValue = false;doPage(document.getElementById('pageno').value);}"
												onKeyUp="value=value.replace(/[^\d]/g,'')" size=3 name=pageno>
											页
											<A href="javascript:doPage(document.getElementById('pageno').value)"><IMG src="images/goto.jpg" border=0>
											</A>
										</DIV>
									</TD>
									<TD align=left width=154>
										共 479 条记录
									</TD>
									<TD align=right width=*>
										共 48 页：第1 页
									</TD>
									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1==1){ alert('已经是第一页！');} else { doPage('1');}" src="images/up_1.gif" border=0>
									</TD>

									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript: if((1)<(48)) { doPage('2');}else{ alert('已经是最后一页！');} " src="images/up_.gif" border=0>
									</TD>

									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1!=1) { doPage('0');}else{ alert('已经是第一页！');} " src="images/down_.gif" border=0>
									</TD>
									<TD align=right width=30>
										<IMG style="CURSOR: hand" onClick="javascript:if(1==48){ alert('已经是最后一页！');} else { doPage('48');}" src="images/down_1.gif" border=0>
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

						<input type="button" name="" value="删 除" onclick="delmsg();">

						<input type="button" name="" value="返 回" onclick="window.history.go(-1);">
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
	    alert("请输入页数！");
	    return;
	}
	if(parseInt(pageNum) > 48) {
	    alert("超出页码范围！");
        document.getElementById('pageno').value="";
	    return;
	}
	if (pageNum<=0) {
	    alert("输入的页码不对！");
	    document.getElementById('pageno').value="";
	    return;
	}
	//document.form1.pageNum.value=pageNum;
	document.messageForm.action="message.do?action=listSendedMessaegList&pageno="+pageNum;
	document.messageForm.submit();
}
</SCRIPT>
</html>
