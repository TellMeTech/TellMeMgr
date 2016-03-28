<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<meta charset="utf-8">
<title>用户信息</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
<script type="text/javascript"> 
	$(document).ready(function() {
		/*
		$("#cmbOrgan").combotree({
				 url: 'jsonLoadOrganParent.do?rootId='+0,   
				 editable:false,
   				 required: false,
   				 onSelect:function(record){   
 				 	$("#organId").val(record.id); 
   				 },
   				 onLoadSuccess:function(){ 
   				 	var userId = $("#hid_userId").val();
   				 	if(userId>0){
						var organId = $("#organId").val();
						$("#cmbOrgan").combotree("setValue",organId); 
						//$("#cmbOrgan").combotree("disable",true);
					}else{
	   				 	$("#cmbOrgan").combotree("setText","=请选择所属组织机构=");
					}
   				 }
			}); 
			*/
		//setShowStates();
		
		//roleTypeChange();
	}); 
	function roleTypeChange(name){
		if(name == '管理员角色'){
			$("#hid_userType").val(3);
		}else{
			$("#hid_userType").val(1);
		}
	}; 
	function setShowStates(){
		var userId = $("#hid_userId").val();
		if(userId>0){
			var roleId = $("#hid_roleId").val();  
			$("#role"+roleId).prop("checked","checked");
			$("#userAccount").addClass("hide");
			$("#userPassword").addClass("hide");
		}
	};
	function saveUser(obj) { 
		if ($('#userForm').form('validate')) {
			var val = $("#cmbOrgan").combotree("getValue");
			if(val == ""){
				alert("请选择组织结构");
				return ;
			}
			if(!checkRole()){
				alert("请选择角色");
				return ;
			}
			$(obj).attr("onclick", "");
			showProcess(true, '温馨提示', '正在提交数据...');  
			$('#userForm').form(
				'submit',
				{
				success : function(data) {
					showProcess(false);
					data = $.parseJSON(data);
					if (data.code == 0) {
						$.messager.alert('保存信息', data.message, 'info',function() {
							window.location.href = 'userList.do';
						});
					} else {
						$.messager.alert('错误信息', data.message, 'error',function() {
							$(obj).attr("onclick","saveUser(this);");
						});
					}
				}
			});
	};
	function checkRole(){
		var res = false; 
		var arr = document.getElementsByName("roleId");
		if(arr.length > 0){
			for(var i = 0; i < arr.length; i++){
				if(arr[i].checked){
					res = true;
					break;
				}
			}
		}
		return res;
	};
} 
</script>
</head>

<body>
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<%-- <i class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>员工：${userinfo.name}</span> --%>
				<i id="i_back" class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>用户：${userInfo.id == 0 ? "新建用户":userInfo.name }</span>
			</div>
		</div>

		<div class="fl yw-lump mt10">
			<div class="yw-bi-rows">
				<div class="yw-bi-tabs mt5" id="ywTabs">
					<span class="yw-bi-now">用户详情</span>
				</div>
				<div class="fr">
					<span class="yw-btn bg-green mr26 hide" id="editBtn" onclick="editUser();">编辑</span> 
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveUser(this);">保存</span>
					<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div>
			</div>
			<div id="tab1" class="yw-tab">
				<form id="userForm" name="userForm"
					action="jsonSaveOrUpdateUser.do" method="post">
					<table class="yw-cm-table font16">
						<tr>
							<td width="10%" align="center">用户姓名：</td>
							<td>
								<input name="name" onblur="valueTrim(this);"   type="text" value="${userInfo.name}" placeholder="请输入用户姓名"  class="easyui-validatebox" required="true" validType="Length[1,10]" style="width:254px;height:28px;" /> 
								<span style="color:red">*</span>
								<input id="hid_userId" name="id" type="hidden" value="${userInfo.id}" />  
								<%-- <input id="hid_userType" name="userType" type="hidden" value="${userInfo.userType}" />  --%>
							</td>
						</tr>  
						<tr>
							<td align="center">所属机构：</td>
							<td>
								<input id="organId" name="orgId" type="hidden" value="${userInfo.orgId}"/> 
								<input id="cmbOrgan" class="easyui-combotree"  style="width:254px;height:32px;" />
								<span style="color:red">*</span>
							</td>
						</tr> 
						<tr>
							<td align="center">手机号码：</td>
							<td><input name="mobile"  onblur="valueTrim(this);"   placeholder="请输入用户手机号码"   type="text" value="${userInfo.id}" class="easyui-validatebox"  validType="mobile" style="width:254px;height:28px;" /></td>
						</tr> 
						<tr>
							<td align="center">电子邮箱：</td>
							<td><input name="email"  onblur="valueTrim(this);"   placeholder="请输入用户电子邮箱"   type="text" value="${userInfo.id}" class="easyui-validatebox"  validType="EMAIL" style="width:254px;height:28px;" /></td>
						</tr> 
						<tr id="userAccount" >
							<td align="center">登陆账号：</td>
							<td><input name="account"  onblur="valueTrim(this);"   placeholder="请输入登陆账号"   type="text" value="${userInfo.id}" class="easyui-validatebox" required="true" validType="Length[4,22]" style="width:254px;height:28px;" /><span style="color:red">*</span></td>
						</tr> 
						<tr id="userPassword" >
							<td align="center">登陆密码：</td>
							<td><input name="password"  onblur="valueTrim(this);"   placeholder="请输入登陆密码"   type="password" value="${userInfo.id}" class="easyui-validatebox" required="true" validType="Length[1,100]" style="width:254px;height:28px;" /><span style="color:red">*</span></td>
						</tr> 
						<tr>
							<td align="center">角色分配：</td>
							<td>
        						<p class="yw-window-p"> 
        							<input type="hidden" id="hid_roleId" value="${userInfo.id }" />
						        	<c:forEach var="item" items="${roleList}">
						        		<input  id="role${item.id}" onclick="roleTypeChange('${item.name }');" name="roleId" type="radio" value="${item.id} " />${item.name }
						        	</c:forEach>
						        	<span style="color:red">*</span>
        						</p>
							</td>
						</tr>  
					</table>
				</form>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<div class="cl"></div>

	</div>

</body>
</html>
