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
<title>工单详情</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
<script type="text/javascript"> 
$(document).ready(function(){
    initFault();
    var state = $('#state').val();
    if(state==1||state==2||state==3){
       $('#faultSelect').combobox("disable","true");
       $('#txtcontent').attr("readonly","readonly");
    }
}); 
	function saveIssueInfo(obj,state) { 
	    var faultId = $('#faultSelect').combobox("getValue");
	    if(faultId == ""){
	       $.messager.alert('提示信息', "请选择故障现象", 'info',function() {});
	       return;
	    }
	    //保存时可选择状态
        if(state==0){//保存为草稿
	         $('#state').val(0);
	    }else{//保存并提交
	         $('#state').val(1);
	    }
	    
		if ($('#IssueInfoForm').form('validate')) {
			$(obj).attr("onclick", ""); 
			showProcess(true, '温馨提示', '正在提交数据...'); 
			$('#IssueInfoForm').form('submit',{
				success : function(data) {
					showProcess(false);
					data = $.parseJSON(data);
					if (data.code == 0) {
						$.messager.alert('保存信息', data.message, 'info',function() {
						  window.location.href="issueList.do";
						});
						//$("#i_back").click();
					} else {
						$.messager.alert('错误信息', data.message, 'error',function() {});
						$(obj).attr("onclick","saveIssueInfo(this);");
					}
				}
			});
		} 
	} 
	function initFault(){
	    $('#faultSelect').combobox( {  
          url : 'jsonLoadFault.do',
          valueField:'id',
          textField:'fault',
          onChange:function(){
      	      },
      	  onLoadSuccess:function(node,data){
      	        var faultId = $('#faultId').val();
      	        if(faultId == ""){
      	           $('#faultSelect').combobox("setText","==请选择故障现象==");
      	        }else{
      	           $('#faultSelect').combobox("setValue",faultId);
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
				<i id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>${issueInfo.id == 0 ? "新建工单":"工单处理信息" }</span>
				<%-- <i  id="i_back"  class="yw-icon icon-back" onclick="window.location.href='deviceList.do'"></i><span>设备：${projectPoint.name }</span>  --%>
			</div>
		</div>

		<div class="fl yw-lump mt10">
			<div class="yw-bi-rows">
				<div class="yw-bi-tabs mt5" id="ywTabs">
					<span class="yw-bi-now">工单信息</span>
				</div>
				<div class="fr">
					<!-- <span class="yw-btn bg-green mr26 hide" id="editBtn" onclick="editProjectPoint();">编辑</span>  -->
					<c:if test="${issueInfo.id == 0||issueInfo.state == 0 }">
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveIssueInfo(this,0);">保存 </span>
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveIssueInfo(this,1);">保存并提交</span> 
					</c:if>
					<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div>
			</div>
			<div>
				<form id="IssueInfoForm" name="IssueInfoForm" action="jsonSaveOrUpdateIssue.do" method="post">
					<div id="tab1" class="yw-tab">
						<table class="yw-cm-table font16">
							<tr>
								<td  width="10%" align="right">故障现象：</td>
								<td>
								    <input id="faultId" type="hidden" value="${issueInfo.faultId }"/>
								    <input id="faultSelect" name="faultId" class="easyui-combobox"  data-options="editable:false"   style="width:254px;height:28px;"/>   
								    <span style="color:red">*</span>
								    <input id="id"  name="id" value="${issueInfo.id }" type="hidden"/>
								    <input id="state"  name="state" value="${issueInfo.state }" type="hidden"/>
								</td>
							</tr>
							<tr>
								<td width="10%" align="right">提交内容：</td>
								<td><textarea id="txtcontent" required="true" name="content" rows="4" class="easyui-validatebox" validType="Length[1,120]" style="width:254px;margin-top:20px;overflow:hidden" >
								${issueInfo.content }</textarea>
								<span style="color:red">*</span></td>
							</tr>
						    <c:if test="${issueInfo.id !=0 }">
							<tr>
								<td align="right">状态：</td>
								<c:choose>
								<c:when test="${issueInfo.state==0 }">
								<td><input value="草稿" onblur="valueTrim(this);"   type="text" readonly class="easyui-validatebox" style="width:254px;height:28px;" />
								</td>
								</c:when>
								<c:when test="${issueInfo.state==1 }">
								<td><input value="待处理" onblur="valueTrim(this);"   type="text" readonly class="easyui-validatebox" style="width:254px;height:28px;" />
								</td>
								</c:when>
								<c:when test="${issueInfo.state==2 }">
								<td><input value="处理中" onblur="valueTrim(this);"   type="text" readonly class="easyui-validatebox" style="width:254px;height:28px;" />
								</td>
								</c:when>
								<c:when test="${issueInfo.state==3 }">
								<td><input value="已处理" onblur="valueTrim(this);"   type="text" readonly class="easyui-validatebox" style="width:254px;height:28px;" />
								</td>
								</c:when>
								<c:otherwise>
								<td><input value="未处理" onblur="valueTrim(this);"   type="text" readonly class="easyui-validatebox" style="width:254px;height:28px;" />
								</td>
								</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<td align="right">处理结果：</td>
								<td><textarea onblur="valueTrim(this);" readonly rows="4"  class="easyui-validatebox" style="width:254px;margin-top:20px;overflow:hidden">
								${issueInfo.description }
								</textarea></td>
							</tr>
							</c:if>
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