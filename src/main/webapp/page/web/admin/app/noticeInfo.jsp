<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>公告信息</title>
<script type="text/javascript"> 
	
	$(document).ready(function(){
		
	});
	
	function saveUser(obj) { 
		return ;
		
		if ($('#roleForm').form('validate')) {
			$(obj).attr("onclick", "");
			showProcess(true, '温馨提示', '正在提交数据...');  
			$('#roleForm').form(
				'submit',
				{
				success : function(data) {
					showProcess(false);
					data = $.parseJSON(data);
					if (data.code == 0) {
						$.messager.alert('保存信息', data.message, 'info',function() {
							window.location.href = 'roleList.do';
						});
					} else {
						$.messager.alert('错误信息', data.message, 'error',function() {
							$(obj).attr("onclick","saveRole(this);");
						});
					}
				}
			});
	}
} 
</script>
</head>
<body>
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i id="i_back" class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>公告：${u.id == 0 ? "新建公告":u.name }</span>
			</div>
		</div>

		<div class="fl yw-lump mt10">
			<div class="yw-bi-rows">
				<div class="yw-bi-tabs mt5" id="ywTabs">
					<span class="yw-bi-now">公告详情</span>
				</div>
				<div class="fr"> 
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveUser(this);">保存</span>
					<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div> 
			</div>
			<div id="tab1" class="yw-tab">
				<form id="roleForm" name="roleForm"
					action="jsonSaveOrUpdateRole.do" method="post">
					<table class="yw-cm-table font16">
						<tr>
							<td width="10%" align="center">模板标题：</td>
							<td>
								<input name="name" onblur="valueTrim(this);"   type="text" value="${u.name}" placeholder="请输入公告标题"  class="easyui-validatebox" required="true" validType="Length[1,25]" style="width:254px;height:28px;" /> 
								<span style="color:red">*</span>
								<input id="hid_roleId" name="id" type="hidden" value="${u.id}" />  
							</td>
						</tr>
						<tr>
							<td align="center">模板介绍：</td>
							<%-- <td><input name="description"  onblur="valueTrim(this);"   placeholder="请输入电话号码"   type="text" value="${u.name}" class="easyui-validatebox"  validType="Length[1,122]" style="width:254px;height:28px;" /></td>--%>
							<td><textarea rows="2" cols="33" class="easyui-validatebox" style="padding: 2px; font-size: 14px; font-family: '微软也黑';"></textarea></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="cl"></div>
	</div>
</body>
</html>
