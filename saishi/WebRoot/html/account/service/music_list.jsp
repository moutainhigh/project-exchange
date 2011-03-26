<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>${appTitle}</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="${appPath}html/css/style.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="${appPath}html/css/jquery.datepick.css" />
		<script src="${appPath}html/script/jquery.js"></script>
		<script src="${appPath}html/script/common.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick.js"></script>
		<script type="text/javascript" src="${appPath}html/script/jquery.datepick-zh-CN.js"></script>
		<script type="text/javascript">
			
			$(function(){
				//初始化日期输入数据
				$('.datetime').datepick({dateFormat: 'yy-mm-dd'}); 
				var colArr = ['id',null,null,null,'size','createDate'];
				$('.data_list_table tr').eq(0).find('th').each(function(index){
					if(colArr[index]){//空的就没有排序功能
						$(this).css({'cursor':'pointer'});
						$(this).attr('title','升序/降序');
						$(this).click(function(){//click事件
							if($('#orderBy').val()!=colArr[index]){//第一次点击一个新的col
								$('#orderType').val('asc');
							}else{//大于一次点击同一个col排序
								if($('#orderType').val() == 'asc'){
									$('#orderType').val('desc');
								}else{
									$('#orderType').val('asc');
								}
							}							
							orderByCol(colArr[index]);
						});
						//标志col目前的排序方式
						if($('#orderBy').val()==colArr[index]){
							if($('#orderType').val() == 'asc'){
								$(this).append('(↑)');
							}else if($('#orderType').val() == 'desc'){
								$(this).append('(↓)');
							}
						}						
					}
				});
				
			});
			function deleteMusic(id){
				if(window.confirm('您确定删除吗？')){
					self.location.href = '${appPath}data_deleteMusic.action?music.id='+id;
				}
			}
			function query(){
				document.forms[0].action = "${appPath}data_musicList.action";
				document.forms[0].submit();
			}
			
			function orderByCol(colName){
				$('#orderBy').val(colName);
				query();
			}
		</script>
	</head>
	<body>
		<div class="page_title">
			赛事管理系统 > 数据录入 > 音乐管理
		</div>
		<jsp:include page="../../../msg.jsp"></jsp:include>
		<br />
		<form action="${appPath}data_musicList.action" method="get">
		<input type="hidden" id="orderBy" name="orderBy" value="${orderBy}"/>
		<input type="hidden" id="orderType" name="orderType" value="${orderType}"/>
		<table class="query_form_table">
			<tr>
				
				<th height="28">
					歌手
				</th>
				<td>
				<input value="${music.singer}" name="music.singer " id="singer"/>
				</td>
				
				<th height="28">
					歌曲名
				</th>
				<td colspan="3">
					<input value="${music.songName}" name="songName" id="songName"/>
				</td>
			</tr>
			<tr>
				<th height="32">
				格式
				</th>
				<td>
					<input  value="${music.format}" name="music.format" id="format" />
				</td>
				<th height="32">
				大小
				</th>
				<td>
					<input  value="${music.size}" name="music.size" id="size" />
				</td>
				<th height="32">
					创建时间
				</th>
				<td>
					<input size="10" name="fromDate" class="datetime" value="${param.fromDate}"/>
					-
					<input size="10" name="toDate" class="datetime" value="${param.toDate}"/>
				</td>
			</tr>
		</table>
		<div class="button_bar">
		
			<button class="common_button" onclick="to('${appPath}html/account/service/music_edit.jsp');">
				新建
			</button>
			<button class="common_button" onclick="query();">
				查询
			</button>
		
		</div>
		<table class="data_list_table">
			<tr>
				<th>
					编号
				</th>
				<th>
					歌手
				</th>
				<th>
				歌曲名
				</th>
				<th>
					格式
				</th>
				<th>
					大小
				</th>
				<th>
					发布时间
				</th>
				<th>
					操作
				</th>
			</tr>
			<c:forEach items="${pageBean.resultList}" var="f">
			<tr>
				<td class="list_data_number">
					${f.id}
				</td>
				<td class="list_data_text">
					${f.singer}
				</td>
				<td class="list_data_text">
					${f.songName}
				</td>
				<td width="20%" class="list_data_text">
					${f.format }
				</td>
				<td width="20%" class="list_data_text">
					${f.size}
				</td>
				<td class="list_data_text">
					${f.createDate }
				</td>
				<td class="list_data_op">
					<a href="${appPath}data_saveMusic.action?music.id=${f.id}" >修改</a>
					<a href="javascript:deleteMusic(${f.id});">删除</a>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="8" class="pager">
					<div class="pager">
						共${pageBean.totalRow}条记录 每页<input id="pageSize" name="pageSize" value="${pageBean.rowPerPage }" size="2" />
						条 第
						<input value="${pageBean.pageIndex}" size="2" />
						页/共${pageBean.maxPage}页
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(1,$('#pageSize').val());">[首页]</a>
							</c:when>
							<c:otherwise>
								[首页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isFirstPage}">
								<a href="javascript:gotoPage(${pageBean.prePageIndex },$('#pageSize').val());">[前一页]</a>
							</c:when>
							<c:otherwise>
								[前一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.nextPageIndex },$('#pageSize').val());">[后一页]</a>
							</c:when>
							<c:otherwise>
								[后一页]
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${!pageBean.isLastPage}">
								<a href="javascript:gotoPage(${pageBean.maxPage },$('#pageSize').val());">[尾页]</a>
							</c:when>
							<c:otherwise>
								[尾页]
							</c:otherwise>
						</c:choose> 
						转到
						<input value="" size="2" id="targetPage"/>
						页
						<button width="20" onclick="gotoPage($('#targetPage').val(),$('#pageSize').val());return false;">
							GO
						</button>
					</div>
				</th>
			</tr>
		</table>
		</form>
	</body>
</html>
