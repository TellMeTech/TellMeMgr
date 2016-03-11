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
<title>控制台</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
	 
</head>

<body>
 	
	<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i class="yw-icon icon-partner"></i><span>控制台</span>  
			</div>
		</div>
		
						
		<div class="fl yw-lump mt10">
			<form id="projectPointForm" name="projectPointForm"
				action="deviceList.do" method="get">
				<div class="pd10">
					<div class="fl">
						<span class="ml26">设备信息</span>
					</div>
					<div class="fr">
						<span class="fl yw-btn bg-green cur" onclick="showdialog();">新建设备</span>
					</div>
					<div class="cl"></div>
				</div> 
			</form>
		</div>
           <div class="fl yw-lump"> 
				<table class="yw-cm-table yw-center yw-bg-hover" id="deviceinfoList">
					<tr style="background-color:#D6D3D3;font-weight: bold;">
						<th width="4%" style="display:none">&nbsp;</th>
						<th>设备ID</th>
						<th>设备编号</th>
						<th>设备名称</th>
						<th>设备IP</th>  
					</tr> 
				</table> 
		</div> 
</body>
</html>
