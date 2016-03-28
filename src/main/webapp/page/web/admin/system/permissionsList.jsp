<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>权限管理</title>
<script type="text/javascript">
	var sel_role_obj = null;
	var sel_id = 0;
	var init_resource = [];
	function roleSelect(obj, id){
		if(sel_id == id){
			return ;
		}
		sel_id = id;
		obj.style.backgroundColor = "#E3FEFE";
		if(sel_role_obj != null){
			sel_role_obj.style.backgroundColor = "";
		}
		sel_role_obj = obj;
		clear();
		getPermission(id);
	}
	
	function getPermission(roleId){
		$.ajax({
			url : "jsonLoadRoleResource.do?id="+roleId,
			type : "post",  
			dataType:"json",
			success : function(data) { 
	  			if(data.code == 0){ 
	  				init_resource = data.list;
	  				for(var i = 0; i < init_resource.length; i ++){
	  					setChckedValue(init_resource[i].id);
	  				}
	  			}else{
					$.messager.alert('错误信息',data.message,'error');
	  			} 
			}
		});
	}
	
	//保存权限
	function save(){
		if(sel_id == 0){
			$.messager.alert('错误信息',"请先选择需要设置的角色",'error');
			return;
		}
		
		var needAdd = [];
		var needDelete = [];
		
		var single = false;
		var ckds = getChecked();
		if(init_resource.length == 0){
			needAdd = ckds;
			single = true;
		}
		if(ckds.length == 0){
			needDelete = init_resource;
			single = true;
		}
		
		if(!single){
			for(var i = 0; i < init_resource.length; i ++){
				var checkFind = false;
				for(var j = 0; j < ckds.length; j ++){
					if(init_resource[i].id == ckds[j]){
						ckds = removeByIndex(ckds, j);
						checkFind = true;
						break;
					}
				}
				if(!checkFind){
					needDelete.push(init_resource[i]);
				}
			}
			if(ckds.length > 0){
				needAdd = ckds;
			}
		}
		
		var stradd = toString(needAdd, false);
		var strdelete = toString(needDelete, true);
		$.ajax({
			url : "jsonUpdateRoleResource.do?id="+sel_id+"&needAdd="+stradd+"&needDelete="+strdelete,
			type : "post",  
			dataType:"json",
			success : function(data) { 
	  			if(data.code == 0){ 
	  				$.messager.alert('温馨提示',data.message,'info',function(){
	  					window.location.reload();
	  				});
	  			}else{
					$.messager.alert('错误信息',data.message,'error');
	  			} 
			}
		});
	}
	
	function toString(arr, isObj){
		var res = "";
		for(var i = 0; i < arr.length; i ++){
			if(i == arr.length - 1){
				if(isObj){
					res += arr[i].id;
				}else{
					res += arr[i];
				}
			}else{
				if(isObj){
					res += arr[i].id +",";
				}else{
					res += arr[i] +",";
				}
			}
		}
		return res;
	}
	
	function removeByIndex(arr, index){
		var temp = [];
		for(var i = 0; i < arr.length; i ++){
			if(i != index){
				temp.push(arr[i]);
			}
		}
		return temp;
	}
	
	//清空勾选数据
	function clear(){
		var eles = document.getElementsByName("cb_resource");
		for(var i = 0; i < eles.length; i ++){
			if(eles[i].checked){
				eles[i].checked = false;
			}
		}
	}
	
	//获取已勾选的数据值数组
	function getChecked(){
		var eles = document.getElementsByName("cb_resource");
		var temp = [];
		for(var i = 0; i < eles.length; i ++){
			if(eles[i].checked){
				temp.push(eles[i].value);
			}
		}
		return temp;
	}
	
	//勾选指定值的数据
	function setChckedValue(id){
		var eles = document.getElementsByName("cb_resource");
		for(var i = 0; i < eles.length; i ++){
			if(eles[i].value == id){
				eles[i].checked = true;
				break;
			}
		}
	}
</script>
</head>
<body>
 	
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i class="yw-icon icon-partner"></i><span>权限列表</span>  
			</div>
		</div> 
           <div class="fl yw-lump mt10">
           	<div class="pd10-28">
                   <div class="fr">
                   	<span class="yw-btn bg-green ml20 cur" onclick="save()">保存</span> 
                   </div>
                   <div class="cl"></div>
               </div>
               
           </div> 
		<div class="fl">
			<div class="fl yw-lump wid250 mt10">
				<div class="yw-cm-title">
					<span class="ml26">角色列表</span>
				</div>
				<table class="yw-cm-table yw-leftSide yw-bg-hover">
					<tr style="background-color:#D6D3D3;font-weight: bold;">
	                   	<th width="4%" style="display:none"></th>
	                </tr>
	                <c:forEach var="item"  items="${roles}">
	                	<c:if test="${item.id !=1}">
	                		<tr onclick="roleSelect(this, '${item.id}')">
				            	<td align="left" ><span style="margin-left:40px">${item.name}</span></td>
				            </tr>
	                	</c:if>
	                </c:forEach>
	               </table>
			</div>
	           <div class="yw-lump wid-atuo ml260 mt10"">
	           	<div class="yw-cm-title">
	               	<span class="ml26">全部权限</span>
	               </div>
	           	<table class="yw-cm-table yw-leftSide yw-bg-hover"  id="userList">
	               	<tr style="background-color:#D6D3D3;font-weight: bold;">
	                   	<th width="4%" style="display:none"></th>
	                   	<th><span style="margin-left:40px">选择</span></th>
	                   	<th>序号</th>
	                   	<th>模块</th>
	                </tr>
	                <c:forEach var="item"  items="${resources}">
	              		<tr>
			            	<td align="center" style="display:none"></td>
			            	<td align="left" ><span style="margin-left:40px"></span><input name="cb_resource" value="${item.id}" type="checkbox"/></td>
			            	<td align="left" >${item.sort}</td>
			            	<td align="left" >${item.name}</td>
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
