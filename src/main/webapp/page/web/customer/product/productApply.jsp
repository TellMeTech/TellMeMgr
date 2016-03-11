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
<title>申请虚拟机</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" />
	<script type="text/javascript">
	function SWSelected(obj){
		var target = $(obj).attr("target");
		if(target == undefined){
			$(obj).attr({target:"selected"});
			$(obj).attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;");
		}else{
			$(obj).removeAttr("target");
			$(obj).removeAttr("style");
		}
	};
	function SingleSelected(obj,parentId){
		var target = $(obj).attr("target");
		if(target == undefined){
			var alist = $("#" + parentId + " li a");
			$.each(alist,function(item,object){
				$(object).removeAttr("target");
				$(object).removeAttr("style");
			});
			$(obj).attr({target:"selected"});
			$(obj).attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;");
		}else{
			$(obj).removeAttr("target");
			$(obj).removeAttr("style");
		} 
	}; 
	</script> 
</head>

<body>
<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>申请虚拟机</span>
				<%-- <i  id="i_back"  class="yw-icon icon-back" onclick="window.location.href='deviceList.do'"></i><span>设备：${projectPoint.name }</span>  --%>
			</div>
				<div class="fr-config">
					<span class="yw-btn bg-green mr26 hide" id="editBtn" onclick="editProjectPoint();">编辑</span> 
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveHWInfo(this);">提交</span> 
								<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">取消</span>
				</div>
		</div>

		<div class="fl yw-lump">
			<!-- <div class="yw-bi-rows">
				<div class="yw-bi-tabs mt5" id="ywTabs">
					<span class="yw-bi-now">配置选择</span>
				</div>
				<div class="fr">
					<span class="yw-btn bg-green mr26 hide" id="editBtn" onclick="editProjectPoint();">编辑</span> 
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="saveHWInfo(this);">保存</span> 
								<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div>
			</div> -->
			<jsp:include page="/page/web/share/configSelect.jsp"></jsp:include>
	</div>
</div>
</body>
</html>
