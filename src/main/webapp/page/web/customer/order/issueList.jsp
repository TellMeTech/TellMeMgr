<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<title>工单管理</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	<script src="${pageContext.request.contextPath}/source/js/pager/jquery.pager.js"></script>
	<link href="${pageContext.request.contextPath}/source/js/pager/Pager.css" rel="stylesheet" />
	
<script type="text/javascript">
$(document).ready(function(){
	$("#pager").pager({
			    pagenumber:'${issue.pageNo}',                         /* 表示初始页数 */
			    pagecount:'${issue.pageCount}',                      /* 表示总页数 */
			    totalCount:'${issue.totalCount}',
			    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
	});
	/* $("#IssueList tr").each(function(i){
		if(i>0){
			$(this).bind("dblclick",function(){
				var issueId = $(this).find("td").first().text();
				 window.location.href="issueInfo.do?issueId="+issueId;
			});
		}
	});  */
});
PageClick = function(pageclickednumber) {
	$("#pager").pager({
	    pagenumber:pageclickednumber,                 /* 表示启示页 */
	    pagecount:'${issue.pageCount}',                  /* 表示最大页数pagecount */
	    buttonClickCallback:PageClick                 /* 表示点击页数时的调用的方法就可实现javascript分页功能 */            
	});
	
	$("#pageNumber").val(pageclickednumber);          /* 给pageNumber从新赋值 */
	/* 执行Action */
	pagesearch();
}
function search(){
	$("#pageNumber").val("1");
	pagesearch();
}

function pagesearch(){
	if ($('#IssueForm').form('validate')) {
		IssueForm.submit();
	}
}
function commit(id){
            $.ajax({
				url :  "jsonUpdateIssue.do?id="+id,
				type : "POST",
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.code == 0) {
						$.messager.alert('提示信息', data.message, 'info',function() {
						  window.location.href="issueList.do";
						});
					} else {
						$.messager.alert('错误信息', data.message, 'error',function() {});
					}
				}
			});
}
 
</script>
</head>

<body>
 	
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i class="yw-icon icon-partner"></i><span>工单列表</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           <form  id="IssueForm" name="IssueForm" action="issueList.do" method="get">
           	<div class="pd10-28">
                  <!--  <div class="fl">
                       <button class="yw-btn bg-blue cur">硬件列表</button>
                       <button class="yw-btn bg-gray ml20 cur">满意度调查</button>
                   </div> -->
                   <div class="fr">
                   	<%-- <input type="text" name="searchName" validType="SpecialWord" class="easyui-validatebox" placeholder="搜索" value="${issue.searchName}" />
                   	<span class="yw-btn bg-orange ml30 cur" onclick="search();">开始查找</span> --%>
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='issueInfo.do?issueId=0'">新建工单</span>
                   </div>
                   <div class="cl"></div>
               </div>
               
               <input type="hidden" id="pageNumber" name="pageNo" value="${issue.pageNo}" />
               </form>
           </div> 
           <div class="fl yw-lump mt10">
           	<div class="yw-cm-title">
               	<span class="ml26">全部工单</span>
               </div>
           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="IssueList">
               	<tr style="background-color:#D6D3D3;font-weight: bold;">
                   	<th width="4%" style="display:none"></th>
                   	<th><span style="margin-left:40px">处理状态</span></th>
                   	<th>提交用户</th>
                   	<th>故障现象</th>
                   	<th>提交时间</th>
                   	<th>故障描述</th>
                   	<th>处理结果描述</th>
                   	<th></th>
                </tr>
                <c:forEach var="item"  items="${issueList}">
              		<tr>
		            	<td align="center" style="display:none">${item.id}</td>
		            	<c:choose>
		            	  <c:when test="${item.state==0 }">
		            	  <td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" align="left" ><span style="margin-left:40px">草稿</span></td></c:when>
		            	  <c:when test="${item.state==1 }">
		            	  <td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'"  align="left" ><span style="margin-left:40px">未处理</span></td></c:when>
		            	  <c:when test="${item.state==2 }">
		            	  <td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'"  align="left" ><span style="margin-left:40px">处理中</span></td></c:when>
		            	  <c:when test="${item.state==3 }">
		            	  <td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'"  align="left" ><span style="margin-left:40px">已完成</span></td></c:when>
		            	  <c:otherwise>
		            	  <td> </td></c:otherwise>
		            	</c:choose>
		            	<td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" >${item.userName}</td>
		            	<td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" >${item.faultName}</td>
		            	<td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" >${item.cTime}</td>
		            	<td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" >${item.content}</td>
		            	<td onclick=" window.location.href='issueInfo.do?issueId=${item.id}'" >${item.description}</td>
		            	<c:choose>
		            	  <c:when test="${item.state==0 }">
		            	  <td><span onclick="commit(${item.id})" class="yw-btn bg-green ml20 cur">提交</span></td></c:when>
		            	  <c:otherwise>
		            	  <td> </td></c:otherwise>
		            	</c:choose>
		            </tr>
                </c:forEach>
               </table>
                <div class="page" id="pager">
        		</div>
           </div>
 	  </div>
</body>
</html>
