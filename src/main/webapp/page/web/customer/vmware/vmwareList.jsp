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
<title>虚拟机管理</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	<script src="${pageContext.request.contextPath}/source/js/pager/jquery.pager.js"></script>
	<link href="${pageContext.request.contextPath}/source/js/pager/Pager.css" rel="stylesheet" />
	
<script type="text/javascript">
$(document).ready(function(){
	$("#pager").pager({
			    pagenumber:'${OSServerVM.pageNo}',                         /* 表示初始页数 */
			    pagecount:'${OSServerVM.pageCount}',                      /* 表示总页数 */
			    totalCount:'${OSServerVM.totalCount}',
			    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
	}); 
});
PageClick = function(pageclickednumber) {
	$("#pager").pager({
	    pagenumber:pageclickednumber,                 /* 表示启示页 */
	    pagecount:'${OSServerVM.pageCount}',                  /* 表示最大页数pagecount */
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
	if ($('#VMWareForm').form('validate')) {
		VMWareForm.submit();
	}
}
function sltChange(obj,serverId){
	if($(obj).val() == "MORE"){
		return;
	} 
	OperatServer(serverId,$(obj).val());
} 
 
function OperatServer(serverId,status){
	if(serverId==undefined||serverId==""||serverId==null){
		 $.messager.alert('操作信息', "服务器id为空，不能删除，请联系管理员", 'info');
		 return;
	}
	if(status == "DELETE"){
		$.messager.confirm('删除提示', '确定要删除该虚拟机?', function(r){
			if (r){
				OperatServerAction(serverId,status);
			}
		});
	}else{
		OperatServerAction(serverId,status);
	}
}
function OperatServerAction(serverId,status){
	showProcess(true, '温馨提示', '正在操作，请等待...');  
	$.ajax({
		url : "<%=basePath %>admin/vmware/jsonOperatServer.do?serverId="+serverId+"&status="+status,
		type : "post",  
		dataType:"json",  
		success : function(data) { 
			showProcess(false);  
  			if(data.code == 0){  
  				$.messager.show({
					title:'操作信息',
					msg:'服务器响应操作，请稍后。。。',
					showType:'fade',
					width:300,
					height:150,
					timeout:5000,
					style:{
						right:'',
						bottom:''
					}
				});  
				 setTimeout(function () { 
			        $.messager.alert('操作信息', data.message, 'info',function() {
						window.location.href="vmwareList.do";
					});
			    }, 5000);
  			}else{
  				$.messager.alert('操作信息', data.message, 'error',function() {
					$(obj).attr("onclick","shutDownServer('"+serverId+"','"+status+"');");
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
				<i class="yw-icon icon-partner"></i><span>虚拟机</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           <form  id="VMWareForm" name="VMWareForm" action="vmwareList.do" method="get">
           	<div class="pd10-28">
                  <!--  <div class="fl">
                       <button class="yw-btn bg-blue cur">硬件列表</button>
                       <button class="yw-btn bg-gray ml20 cur">满意度调查</button>
                   </div> -->
                   <div class="fr">
                   	<%-- <input type="text" name="searchName" validType="SpecialWord" class="easyui-validatebox" placeholder="搜索" value="${OSServerVM.searchName}" />
                   	<span class="yw-btn bg-orange ml30 cur" onclick="search();">开始查找</span> --%>
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='vmwareAdd.do?orderId=0'">申请虚拟机</span>
                   </div>
                   <div class="cl"></div>
               </div>
               
               <input type="hidden" id="pageNumber" name="pageNo" value="${OSServerVM.pageNo}" />
               </form>
           </div> 
           <div class="fl yw-lump mt10">
           	<div class="yw-cm-title">
               	<span class="ml26">全部虚拟机</span>
               </div>
           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="VMWareList">
               	<tr style="background-color:#D6D3D3;font-weight: bold;">
                   	<th width="4%" style="display:none"></th>
                   	<th><span style="margin-left:40px">状态</span></th>
                   	<th>虚拟机名称</th> 
                   	<th>IP</th> 
                   	<th>MAC地址</th>
                   	<th>创建时间</th>
                   	<th>操作</th>  
                </tr>
                <c:forEach var="item"  items="${OSServerList}">
              		<tr>
		            	<td align="center" style="display:none">${item.id}</td>
		            	<td align="left" >
							<c:if test="${item.status == 'ACTIVE'}">
								<span style="margin-left:40px;margin-top:25px"><img width="14px" title="正在运行" src="<%=basePath%>source/images/operation/running.png">
								 正在运行</span>
							</c:if>
							<c:if test="${item.status == 'BUILD'}">
								<span style="margin-left:40px">正在创建</span>
							</c:if>
							<c:if test="${item.status == 'REBUILD'}">
								<span style="margin-left:40px">正在重建</span>
							</c:if>
							<c:if test="${item.status == 'SUSPENDED'}">
								<span style="margin-left:40px">挂起</span>
							</c:if>
							<c:if test="${item.status == 'PAUSED'}">
								<span style="margin-left:40px">暂停</span>
							</c:if>
							<c:if test="${item.status == 'DELETED'}">
								<span style="margin-left:40px">已删除</span>
							</c:if>
							<c:if test="${item.status == 'UNKNOWN'}">
								<span style="margin-left:40px">未知主机</span>
							</c:if>
							<c:if test="${item.status == 'ERROR'}">
							<span style="margin-left:40px">
								<img width="14px" title="错误" src="<%=basePath%>source/images/operation/delete.png"> 
								错误</span>
							</c:if>
							<c:if test="${item.status == 'STOPPED'}">
								<span style="margin-left:40px">停止</span>
							</c:if>
							<c:if test="${item.status == 'SHUTOFF'}">
								<span style="margin-left:40px">管理员关闭</span>
							</c:if>
							<c:if test="${item.status == 'UNRECOGNIZED'}">
								<span style="margin-left:40px">不能识别</span>
							</c:if>
						</td>
		            	<td>${item.name}</td> 
		            	<td>${item.ipv4}</td> 
		            	<td>${item.macaddr}</td> 
		            	<td>${item.created}</td> 
		            	<td>
		            		<c:if test="${item.status == 'ACTIVE'}">  
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','STOP')" style="padding-left:5px;margin-top:25px" >停止</a>
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','SOFT')"  style="padding-left:5px;margin-top:25px" >系统重启</a>  
								<select onchange="sltChange(this,'${item.id}');" id="slt_${item.id}" style="color:#4a9bd3;font-size: 14px;font-family: Arial, '微软雅黑', '宋体' !important;border:0px;background-color: transparent;"> 
							 	 	<option value="MORE">更多</option>  
							 	 	<option value="HARD">硬件重启</option>  
							 	 	<option value="PAUSE">暂停</option>    
								</select> 
							</c:if>
							<c:if test="${item.status == 'BUILD'}">
								 
							</c:if>
							<c:if test="${item.status == 'REBUILD'}">
								 
							</c:if>
							<c:if test="${item.status == 'SUSPENDED'}"> 
							</c:if>
							<c:if test="${item.status == 'PAUSED'}">
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','UNPAUSE')" style="padding-left:5px;margin-top:25px" >继续</a>
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','STOP')"  style="padding-left:5px;margin-top:25px" >停止</a> 
								<select onchange="sltChange(this,'${item.id}');" id="slt_${item.id}" style="color:#4a9bd3;font-size: 14px;font-family: Arial, '微软雅黑', '宋体' !important;border:0px;background-color: transparent;"> 
							 	 	<option value="MORE">更多</option>  
							 	 	<option value="SOFT">系统重启</option>  
							 	 	<option value="HARD">硬件重启</option>    
								</select>  
							</c:if>
							<c:if test="${item.status == 'DELETED'}">
								 
							</c:if>
							<c:if test="${item.status == 'UNKNOWN'}">  
							</c:if>
							<c:if test="${item.status == 'ERROR'}">  
							</c:if>
							<c:if test="${item.status == 'STOPPED'}">
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','START')" style="padding-left:5px;margin-top:25px" >启动</a> 
							</c:if>
							<c:if test="${item.status == 'SHUTOFF'}">
								<a href="javascript:void(0);" onclick="OperatServer('${item.id}','START')" style="padding-left:5px;margin-top:25px" >启动</a>  
							</c:if>
							<c:if test="${item.status == 'UNRECOGNIZED'}"> 
							</c:if>
		            	</td>
		            </tr>
                </c:forEach>
               </table>
                <div class="page" id="pager">
        		</div>
           </div>
 	  </div>
</body>
</html>
