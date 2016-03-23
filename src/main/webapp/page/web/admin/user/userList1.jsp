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
<title>系统用户管理</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	<script src="${pageContext.request.contextPath}/source/js/pager/jquery.pager.js"></script>
	<link href="${pageContext.request.contextPath}/source/js/pager/Pager.css" rel="stylesheet" />
	
<script type="text/javascript">
var topClick = false;
$(document).ready(function(){
	showProcess(true, '温馨提示', '正在加载数据...'); 
	$("#pager").pager({
			    pagenumber:'${userInfo.pageNo}',                         /* 表示初始页数 */
			    pagecount:'${userInfo.pageCount}',                      /* 表示总页数 */
			    totalCount:'${userInfo.totalCount}',
			    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
	});  
	$("#userList tr").each(function(i){
		if(i>0){
			$(this).bind("click",function(){
				if(topClick){
					topClick = false;
					return;
				}
				var userId = $(this).find("td").first().text();
				 window.location.href="userInfo.do?userId="+userId;
			});
		}
	}); 
	$("#treeList").tree({
	 url: 'jsonLoadOrganParent.do?rootId='+0,   
		 onClick:function(node){ 
	 		var orgId = node.id; 
	 		getUserListByOrganId(orgId); 
		 },
		 onLoadSuccess:function(){
			showProcess(false);
		   /*  var cyId = $.trim($("#hid_companyId").val());
		 	if(cyId.length>0){
		 		var node = $("#treeList").tree("find",cyId); 
			$('#treeList').tree("select", node.target);
		 		
		 	}  */
		 }
	});
});
function getUserListByOrganId(organId){
  $.ajax({
		url : "jsonLoadUserListByOrganId.do?organId="+organId,
		type : "post",  
		dataType:"json",
		success : function(data) { 
  			if(data.code == 0){ 
  				 $("#pageNumber").val(1); 
  				 $("#pager").pager({
				    pagenumber:data.obj.pageNo,                         /* 表示初始页数 */
				    pagecount:data.obj.pageCount,                      /* 表示总页数 */
				    totalCount:data.obj.totalCount,
				    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
				});
				$("#userList").html("");
				fillUserList(data.list);
  			}else{
				$.messager.alert('错误信息',data.message,'error');
  			} 
		}
	});
}
function fillUserList(lst){
	var html = "<tbody>";
	html += "<tr style='background-color:#D6D3D3;font-weight: bold;'><th width='4%' style='display:none'>&nbsp;</th><th><span style='margin-left:40px'>姓名</span></th><th>用户账号</th><th>联系电话</th><th>电子邮箱</th><th>组织机构</th><th>角色</th> </tr>";
	for(var i = 0; i<lst.length;i++){
		html += "<tr onclick=window.location.href='userInfo.do?userId='+"+lst[i].id+">";
		html += "<td style='display:none'>"+lst[i].id+"</td>";
		html += "<td  align='left' ><span style='margin-left:40px'>"+lst[i].name+"</span></td>";
		html += "<td  align='left' >"+lst[i].account+"</td>";
		html += "<td  align='left' >"+lst[i].mobile+"</td>";
		html += "<td  align='left' >"+lst[i].email+"</td>";
		html += "<td  align='left' >"+lst[i].organName+"</td>";
		html += "<td>"+lst[i].roleName+"</td>";
		html += "</tr>";
	}
	html += "</tbody>";
	$("#userList").html(html);
}
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
function OperatUser(id, status,name){
	topClick = true;
	showProcess(true, '温馨提示', '正在操作，请等待...');  
	$.ajax({
		url : "jsonUpdateUserFlag.do?id="+id+"&flag="+status+"&name="+name,
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
                  <!--  <div class="fl">
                       <button class="yw-btn bg-blue cur">硬件列表</button>
                       <button class="yw-btn bg-gray ml20 cur">满意度调查</button>
                   </div> -->
                   <div class="fr">
                   	<input type="text" name="searchName" validType="SpecialWord" class="easyui-validatebox" placeholder="搜索关键字：姓名" value="${userInfo.searchName}" />
                   	<span class="yw-btn bg-orange ml30 cur" onclick="search();">开始查找</span>
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='userInfo.do?userId=0'">新建用户</span> 
                   </div>
                   <div class="cl"></div>
               </div>
               
               <input type="hidden" id="pageNumber" name="pageNo" value="${userInfo.pageNo}" />
               </form>
           </div> 
		<div class="fl">
			<div class="fl yw-lump wid250 mt10">
				<div class="yw-cm-title">
					<span class="ml26">机构列表</span>
				</div>
				<div class="yw-organ-tree-list" style="height: 639px;">
					<ul  id="treeList" ></ul>
				</div>
			</div>
	           <div class="yw-lump wid-atuo ml260 mt10"">
	           	<div class="yw-cm-title">
	               	<span class="ml26">全部用户</span>
	               </div>
	           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="userList">
	               	<tr style="background-color:#D6D3D3;font-weight: bold;">
	                   	<th width="4%" style="display:none"></th>
	                   	<th><span style="margin-left:40px">姓名</span></th>
	                   	<th>用户账号</th>
	                   	<th>联系电话</th> 
	                   	<th>电子邮箱</th> 
	                   	<th>组织机构</th>
	                   	<th>角色</th> 
	                   	<th>操作</th>
	                </tr>
	                <c:forEach var="item"  items="${userList}">
	              		<tr>
			            	<td align="center" style="display:none">${item.id}</td>
			            	<td align="left" ><span style="margin-left:40px">${item.name}</span></td>
			            	<td align="left" >${item.account}</td>
			            	<td align="left" >${item.mobile}</td> 
			            	<td align="left" >${item.email}</td> 
			            	<td align="left" >${item.organName}</td> 
			            	<td align="left" >${item.roleName}</td> 
			            	<td>
			            		<c:if test="${item.flag == 1}">
			            			<a href="javascript:void(0);" onclick="OperatUser('${item.id}',0,'${item.name}')" style="padding-left:5px;margin-top:25px" >禁用</a>
								</c:if>
								<c:if test="${item.flag == 0}">
			            			<a href="javascript:void(0);" onclick="OperatUser('${item.id}',1,'${item.name}')" style="padding-left:5px;margin-top:25px" >启用</a>
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
