<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>角色列表</title>
<script type="text/javascript">
	function deleteRole(roleId){
		
		$.ajax({
		url : "jsonDeleteRole.do?id="+roleId,
		type : "post",  
		dataType:"json",
		success : function(data) { 
  			if(data.code == 0){ 
  				 window.location.reload();
  			}else{
				$.messager.alert('错误信息',data.message,'error');
  			} 
		}
	});
	}
	function updateRole(roleId){
		window.location.href="roleInfo.do?roleId="+roleId;
	}
</script>
</head>
<body>
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i class="yw-icon icon-partner"></i><span>角色列表</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           	<div class="pd10-28">
                   <div class="fr">
                   	<span class="yw-btn bg-green ml20 cur" onclick="window.location.href='roleInfo.do?roleId=0'">新建角色</span> 
                   </div>
                   <div class="cl"></div>
               </div>
               
           </div> 
		<div class="fl">
	           <div class="yw-lump wid-atuo mt10"">
	           	<div class="yw-cm-title">
	               	<span class="ml26">全部角色</span>
	               </div>
	           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="userList">
	               	<tr style="background-color:#D6D3D3;font-weight: bold;">
	                   	<th width="4%" style="display:none"></th>
	                   	<th><span style="margin-left:40px">角色名称</span></th>
	                   	<th>角色描述</th>
	                   	<th>操作</th>
	                </tr>
	                <c:forEach var="item"  items="${roles}">
	              		<tr>
			            	<td align="left" ><span style="margin-left:40px">${item.name}</span></td>
			            	<td align="left" >${item.description}</td>
			            	<td>
			            		<c:if test="${item.id != 1}">
			            		<a href="javascript:void(0);" onclick="updateRole('${item.id}')" style="padding-left:5px;margin-top:25px" >修改</a>
			            		<a href="javascript:void(0);" onclick="deleteRole('${item.id}')" style="padding-left:5px;margin-top:25px" >删除</a>
			            		</c:if>
			            		
			            	</td>
			            </tr>
	                </c:forEach>
	               </table>
	        		</div>
	           </div>
	 	  </div>
		</div> 
</body>
</html>
