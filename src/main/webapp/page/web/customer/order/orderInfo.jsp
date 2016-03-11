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
<title>新建虚拟机</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	<script type="text/javascript">
		$(document).ready(function(){  
		var orderId = $("#id").val();
		var state = $("#state").val();
		if(orderId>0){
		
			var schemeId = $("#schemeId").val();
			var schemeObj = $("#dc_a_"+schemeId);
			if(state>0){
				$("#dc_a_"+schemeId).removeAttr("style");
				$("#dc_a_"+schemeId).attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;");
			}else{
				SingleSelected(schemeObj,"defaultCase",schemeId)
			}
			var osImgId = $("#imgUuid").val();
			$("#osImg").combobox("setValue",osImgId);
			var configId = $("#configUuid").val();
			$("#config").combobox("setValue",configId);
		}else{
			$("#osImg").combobox("setValue",0); 
			$("#config").combobox("setValue",0);
		}
	});
	function SingleSelected(obj,parentId,objId){
		var target = $(obj).attr("target");
		if(target == undefined){
			var alist = $("#" + parentId + " li a");
			$.each(alist,function(item,object){
				$(object).removeAttr("target");
				$(object).removeAttr("style");
			});
			$(obj).attr({target:"selected"});
			$(obj).attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;");
			$("#schemeId").val(objId);
			getDefaultCaseDetail(objId);
		}else{
			$("#schemeId").val("");
			$("#osImg").combobox("setValue",0);
			$("#config").combobox("setValue",0);
		 	$("#cpuslider").slider("setValue",1); 
		 	$("#memslider").slider("setValue",64); 
		 	$("#hdslider").slider("setValue",0);
			$(obj).removeAttr("target");
			$(obj).removeAttr("style");
		}  
	};  
	/* function sltConfigChange(record){
		var selectId = record.value;
		$("#configUuid").val(selectId);
		var configList = $("#config"); 
		$.each(configList[0],function(index,obj){
			 if(obj.value == selectId){
			 	var cpuCount = obj.attributes.diskCount.value;
			 	$("#cpuslider").slider("setValue",cpuCount);
			 	var ramCount = obj.attributes.ramCount.value;
			 	$("#memslider").slider("setValue",ramCount);
			 	var diskCount = obj.attributes.diskCount.value; 
			 	$("#hdslider").slider("setValue",diskCount);
			 }
		});
	} */
	function getDefaultCaseDetail(cId){ 
		$.ajax({
			url : "<%=basePath %>admin/vmware/jsonloadDefaultValById.do",
			type : "post",  
			dataType:"json",
			data: {caseId:cId},
			success : function(data) {  
	  			if(data.code == 0){ 
					$("#osImg").combobox("select",data.obj.imgUuid);
					$("#imgUuid").val(data.obj.imgUuid);
					$("#config").combobox("select",data.obj.configUuid);
					$("#configUuid").val(data.obj.configUuid);
	  			}else{
	  				$.messager.alert('错误信息', data.message, 'error');
	  			} 
			}
		}); 
	}
	function saveOrder(obj,status){ 
		$("#state").val(status);
		if($.trim($("#imgUuid").val())=="0"||$.trim($("#imgUuid").val())==0){
			$.messager.alert('创建信息',"请选择镜像文件", 'error');
			return;
		}
		if($.trim($("#configUuid").val())=="0"||$.trim($("#configUuid").val())==0){
			$.messager.alert('创建信息',"请选择硬件配置", 'error');
			return;
		}
		if ($('#orderForm').form('validate')) {
			$(obj).attr("onclick", "");
			showProcess(true, '温馨提示', '正在提交数据，请稍后......');  
			$('#orderForm').form(
				'submit',
				{
				success : function(data) {
					showProcess(false);
					data = $.parseJSON(data);
					if (data.code == 0) {
						$.messager.alert('创建信息', data.message, 'info',function() {
							window.location.href = 'orderList.do';
						});
					} else {
						$.messager.alert('创建信息', data.message, 'error',function() {
							$(obj).attr("onclick","saveOrder(this);");
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
				<!-- <i id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span></span> -->
				<i  id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>订单信息：${order.id == "" ? "新建订单":order.vmOrderSn }</span>
			</div>
				<div class="fr-config">
					<c:if test="${order.state == 0 }">
						<span class="yw-btn bg-orange mr26" id="editBtn" onclick="saveOrder(this,0);">保存</span> 
						<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveOrder(this,1)">保存并提交</span> 	
					</c:if>
					<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div>
		</div>
 
	<form id="orderForm" name="orderForm"
		action="jsonsaveOrUpdateOrder.do" method="post">
		<div class="fl yw-lump" style="overflow: auto;height: 800px;">
			<div class="plan-vm-cell yw-vm-row">
					<div class="plan-vm-cell plan-vm-easy yw-vm-row yw-clear"> 
						<jsp:include page="/page/web/share/configSelect.jsp"></jsp:include>
					</div>
				</div>
		</div>
	</form>
</div>
</body>
</html>
