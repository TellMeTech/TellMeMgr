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
<title>修改密码</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
<script type="text/javascript"> 
$(document).ready(function(){
}); 
	function saveUserInfo(obj) {
	    if(!verification()){
	        return;
	    }
		if ($('#UserInfoForm').form('validate')) {
			$(obj).attr("onclick", ""); 
			showProcess(true, '温馨提示', '正在提交数据...'); 
			$('#UserInfoForm').form('submit',{
				success : function(data) {
					showProcess(false);
					data = $.parseJSON(data);
					if (data.code == 0) {
						$.messager.alert('保存信息', data.message, 'info',function() {
						});
						window.location.href="vmwareList.do";
						//$("#i_back").click();
					} else {
						$.messager.alert('错误信息', data.message, 'error',function() {});
						$(obj).attr("onclick","saveUserInfo(this);");
					}
				}
			});
		} 
	} 
	var verification = function(){
	    var psd1 = $('#psd1').val();
	    var psd2 = $('#psd2').val(); 
	    if(psd1 != psd2){
	        $.messager.alert('错误信息', "两次密码不一致！", 'error',function() {});
	        return false;
	    }else{
	        return true;
	    }
    }  
</script>
</head>

<body>
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>修改密码</span>
				<%-- <i  id="i_back"  class="yw-icon icon-back" onclick="window.location.href='deviceList.do'"></i><span>设备：${projectPoint.name }</span>  --%>
			</div>
		</div>

		<div class="fl yw-lump mt10">
			<div class="yw-bi-rows">
				<div class="yw-bi-tabs mt5" id="ywTabs">
					<span class="yw-bi-now">修改密码</span>
				</div>
				<div class="fr">
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveUserInfo(this);">保存 </span>
					<!-- <span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span> -->
				</div>
			</div>
			<div>
				<form id="UserInfoForm" name="UserInfoForm" action="jsonUpdatePsd.do" method="post">
					<div id="tab1" class="yw-tab">
						<table class="yw-cm-table font16">
							<tr>
								<td width="10%" align="right">登录名称：</td>
								<td>
								    <input id="id" name="id" type="hidden" value="${userInfo.id }"/>
								    <input id="account" name="account" type="hidden" value="${userInfo.account }"/>
								    ${userInfo.account }
								    <!-- <input id="account" name="account" value="${userInfo.account }" type="text" class="easyui-validatebox" validType="Length[4,22]" onblur="valueTrim(this);" style="width:254px;height:28px;"/> -->
								</td>
							</tr>
							<tr>
								<td align="right">旧密码：</td>
								<td><input id="old_psd" name="oldPassword" type="password" placeholder="请输入旧密码" required="true" class="easyui-validatebox" validType="Length[4,22]" onblur="valueTrim(this);" style="width:254px;height:28px;" >
								<span style="color:red">*</span></td>
							</tr>
							<tr>
								<td align="right">新密码：</td>
								<td><input id="psd1" type="password" placeholder="请输入新密码" required="true" class="easyui-validatebox" validType="Length[4,22]" onblur="valueTrim(this);" style="width:254px;height:28px;" >
								<span style="color:red">*</span></td>
							</tr>
							<tr>
								<td align="right">新密码：</td>
								<td><input id="psd2" name="password" type="password" placeholder="请再次输入新密码" required="true" class="easyui-validatebox" validType="Length[4,22]" onblur="valueTrim(this);" style="width:254px;height:28px;" >
								<span style="color:red">*</span></td>
							</tr>
						</table> 
						
					</div>  
				</form>
			</div>
		</div>
		<div class="cl"></div>
	</div>
	<div class="cl"></div>
	 
</body>
</html>