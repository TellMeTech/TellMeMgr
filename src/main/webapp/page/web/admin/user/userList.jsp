<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>酒店列表</title>
<script src="${pageContext.request.contextPath}/source/js/pager/jquery.pager.js"></script>
<link href="${pageContext.request.contextPath}/source/js/pager/Pager.css" rel="stylesheet" />
<script type="text/javascript">
var topClick = false;
$(document).ready(function(){
	//showProcess(true, '温馨提示', '正在加载数据...'); 
	$("#pager").pager({
			    pagenumber:'${pageUser.pageNo}',                         /* 表示初始页数 */
			    pagecount:'${pageUser.pageCount}',                      /* 表示总页数 */
			    totalCount:'${pageUser.totalCount}',
			    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
	});
});
PageClick = function(pageclickednumber) {
	$("#pager").pager({
	    pagenumber:pageclickednumber,                 /* 表示启示页 */
	    pagecount:'${userInfo.pageCount}',                  /* 表示最大页数pagecount */
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
	if ($('#UserForm').form('validate')) {
		UserForm.submit();
	}
}
function OperatUser(id, status){
	topClick = true;
	showProcess(true, '温馨提示', '正在操作，请等待...');  
	$.ajax({
		url : "jsonUpdateSystemUserStatus.do?id="+id+"&isUsed="+status,
		type : "post",  
		dataType:"json",  
		success : function(data) { 
			showProcess(false);  
  			if(data.code == 0){ 
				$.messager.alert('操作信息', data.message, 'info',function() {
					window.location.href="userList.do";
				});
  			}else{
  				$.messager.alert('操作信息', data.message, 'error',function() {
				});
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
				<i class="yw-icon icon-partner"></i><span>用户列表</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           <form  id="UserForm" name="UserForm" action="userList.do" method="get">
           	<div class="pd10-28">
                   <div class="fr">
                   	<input type="text" name="searchName" validType="SpecialWord" class="easyui-validatebox" placeholder="搜索关键字：姓名" value="${pageUser.searchName}" />
                   	<span class="yw-btn bg-orange ml30 cur" onclick="search();">开始查找</span>
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='userInfo.do?id=0'">新建用户</span> 
                   </div>
                   <div class="cl"></div>
               </div>
               
               <input type="hidden" id="pageNumber" name="pageNo" value="1" />
               </form>
           </div> 
		<div class="fl">
	           <div class="yw-lump wid-atuo mt10"">
	           	<div class="yw-cm-title">
	               	<span class="ml26">全部用户</span>
	               </div>
	           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="userList">
	               	<tr style="background-color:#D6D3D3;font-weight: bold;">
	                   	<th width="4%" style="display:none"></th>
	                   	<th><span style="margin-left:40px">系统编号</span></th>
	                   	<th>用户账号</th>
	                   	<th>使用状况</th> 
	                   	<th>创建时间</th> 
	                   	<th>角色</th> 
	                   	<th>操作</th>
	                </tr>
	                <c:forEach var="item"  items="${users}">
	              		<tr>
			            	<td align="center" style="display:none">${item.id}</td>
			            	<td align="left" ><span style="margin-left:40px">${item.id}</span></td>
			            	<td align="left" >${item.name}</td>
			            	<td align="left" >${item.isUsed}</td> 
			            	<td align="left" >${item.createTime}</td> 
			            	<td align="left" >未知</td> 
			            	<td>
			            		<c:if test="${item.id!=1}">
			            			<c:if test="${item.isUsed}">
				            			<a href="javascript:void(0);" onclick="OperatUser('${item.id}',0,'${item.name}')" style="padding-left:5px;margin-top:25px" >禁用</a>
									</c:if>
									<c:if test="${!item.isUsed}">
				            			<a href="javascript:void(0);" onclick="OperatUser('${item.id}',1,'${item.name}')" style="padding-left:5px;margin-top:25px" >启用</a>
									</c:if>
			            		</c:if>
			            	</td>
			            </tr>
	                </c:forEach>
	               </table>
	                <div class="page" id="pager">
	        		</div>
	           </div>
	 	  </div>
		</div> 
</body>
</html>
