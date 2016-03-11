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
<title>订单管理</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	<script src="${pageContext.request.contextPath}/source/js/pager/jquery.pager.js"></script>
	<link href="${pageContext.request.contextPath}/source/js/pager/Pager.css" rel="stylesheet" />
	
<script type="text/javascript">
$(document).ready(function(){
	$("#pager").pager({
			    pagenumber:'${order.pageNo}',                         /* 表示初始页数 */
			    pagecount:'${order.pageCount}',                      /* 表示总页数 */
			    totalCount:'${order.totalCount}',
			    buttonClickCallback:PageClick                     /* 表示点击分页数按钮调用的方法 */                  
	});
	/* $("#OrderList tr").each(function(i){
		if(i>0){
			$(this).bind("click",function(){
				var orderId = $(this).find("td").first().text();
				 window.location.href="vmwareAdd.do?orderId="+orderId;
			});
		}
	});  */
});
PageClick = function(pageclickednumber) {
	$("#pager").pager({
	    pagenumber:pageclickednumber,                 /* 表示启示页 */
	    pagecount:'${order.pageCount}',                  /* 表示最大页数pagecount */
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
	if ($('#OrderForm').form('validate')) {
		OrderForm.submit();
	}
}
 
function submitOrder(obj,orderId){
	showProcess(true, '温馨提示', '正在提交订单...');  
	$.ajax({
		url : "jsonUpdateOrder.do",
		type : "post",  
		dataType:"json",
		data: {orderId:orderId},
		success : function(data) { 
			showProcess(false);  
  			if(data.code == 0){ 
				$.messager.alert('提交信息', data.message, 'info',function() {
					window.location.href = 'orderList.do';
				});
  			}else{
  				$.messager.alert('错误信息', data.message, 'error',function() {
					$(obj).attr("onclick","checkOrder(this,"+orderId+");");
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
				<i class="yw-icon icon-partner"></i><span>订单列表</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           <form  id="OrderForm" name="OrderForm" action="" method="get">
           	<div class="pd10-28">
                  <!--  <div class="fl">
                       <button class="yw-btn bg-blue cur">硬件列表</button>
                       <button class="yw-btn bg-gray ml20 cur">满意度调查</button>
                   </div> -->
                   <div class="fr">
                   	<%-- <input type="text" name="searchName" validType="SpecialWord" class="easyui-validatebox" placeholder="搜索" value="${order.searchName}" />
                   	<span class="yw-btn bg-orange ml30 cur" onclick="search();">开始查找</span> --%>
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='vmwareAdd.do?orderId=0'">新建订单</span>
                   </div>
                   <div class="cl"></div>
               </div>
               
               <input type="hidden" id="pageNumber" name="pageNo" value="${order.pageNo}" />
               </form>
           </div> 
           <div class="fl yw-lump mt10">
           	<div class="yw-cm-title">
               	<span class="ml26">全部订单</span>
               </div>
           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="OrderList">
               	<tr style="background-color:#D6D3D3;font-weight: bold;">
                   	<th width="4%" style="display:none"></th>
                   	<th><span style="margin-left:40px">处理状态</span></th>
                   	<th>订单编号</th>
                   	<th>订单时间</th>
                   	<th>用户</th> 
                   	<th>操作</th>
                </tr>
                <c:forEach var="item"  items="${OrderList}">
              		<tr>
		            	<td align="center" style="display:none">${item.id}</td>
		            	<c:choose>
		            	  <c:when test="${item.state==0 }">
		            	  <td align="left"  onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'"><span style="margin-left:40px">草稿</span></td></c:when>
		            	  <c:when test="${item.state==1 }">
		            	  <td align="left"  onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'"><span style="color:green;margin-left:40px">未审核</span></td></c:when>
		            	  <c:when test="${item.state==2 }">
		            	  <td align="left" onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'" >
		            	  		<span style="margin-left:40px;color:orange;">虚拟机创建中</span>
		            	  </td></c:when>
		            	  <c:when test="${item.state==3 }">
		            	  <td align="left" onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'" >
		            	  		<c:if test="${item.vmUuid != null }">
		            	  			<span style="color:blue;margin-left:40px">已完成</span>
		            	  		</c:if>
		            	  		<c:if test="${item.vmUuid == null }">
		            	  			<span style="color:blue;margin-left:40px">虚拟机创建中</span>
		            	  		</c:if>
		            	  </td></c:when>
		            	  <c:when test="${item.state==10 }">
		            	  <td align="left" onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'" ><span style="color:red;margin-left:40px">已拒绝</span></td></c:when>
		            	  <c:otherwise> 
		            	  <td> </td></c:otherwise>
		            	</c:choose> 
		            	<td onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'">${item.vmOrderSn}</td>
		            	<td onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'">${item.cTime}</td>
		            	<td onclick="window.location.href='vmwareAdd.do?orderId=${item.id}'">${item.userName}</td>  
		            	
		            	<c:choose>
		            	  <c:when test="${item.state==0 }">
		            	  <td><a href="javascript:void(0);" onclick="submitOrder(this,${item.id})" style="padding-left:5px;margin-top:25px" >提交</a> 
		            	  </td></c:when>
		            	  <c:when test="${item.state==1 }">
		            	  <td>已提交</td></c:when>
		            	  <c:when test="${item.state==2 }">
		            	  <td>处理中</td></c:when>
		            	  <c:when test="${item.state==3 }">
        	  			<td><c:if test="${item.vmUuid != null }">
		            	  			已完成 
		            	  		</c:if>
		            	  		<c:if test="${item.vmUuid == null }">
		            	  			虚拟机创建中 
		            	  		</c:if></td></c:when>
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