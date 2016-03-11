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
	function IOSSelected(obj,parentId,selectType){
		var target = $(obj).attr("target");
		if(target == undefined){
			var alist = $("#" + parentId + " li a");
			$.each(alist,function(item,object){
				$(object).removeAttr("target");
				$(object).removeAttr("style");
			});
			$(obj).attr({target:"selected"});
			$(obj).attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;"); 
			if(selectType == 1){
				$("#OSselect a").removeAttr("disable");
				$("#OSselect a").removeAttr("style");
				$("#OSselect a").addClass("btn-link");
				$("#OSselect a").attr("onclick","SingleSelected(this,'OSselect');");
				
				$("#selectContent a[doc='customizations']").removeAttr("disable");
				$("#selectContent a[doc='customizations']").removeAttr("style");
				$("#selectContent a[doc='customizations']").addClass("btn-link");
				$("#selectContent a[doc='customizations']").attr("onclick","SWSelected(this);");
			}else{
				$("#OSselect a").removeClass("btn-link");
				$("#OSselect a").removeAttr("onclick");
				$("#OSselect a").attr({disable:true});
				$("#OSselect a").attr("style","color:#DCDCDC;cursor:text;");
				
				$("#selectContent a[doc='customizations']").removeClass("btn-link");
				$("#selectContent a[doc='customizations']").removeAttr("onclick");
				$("#selectContent a[doc='customizations']").attr({disable:true});
				$("#selectContent a[doc='customizations']").attr("style","color:#DCDCDC;cursor:text;"); 
				
				$("#OSselect a[name='Linux']").attr("style","border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;cursor:text;"); 
				$("#selectContent a[name='WORD']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='EXCEL']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='PPT']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='SharePoint']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='Thunder']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='QQ']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='YouKu']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='11对战平台']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='英雄联盟']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
				$("#selectContent a[name='DOTA 2']").attr("style", "border: 1px solid #00F320;font-size:16px;background-color:#4ec83b;color:white;cursor:text;"); 
			}
		}else{
			$(obj).removeAttr("target");
			$(obj).removeAttr("style");  
			$("#OSselect a").removeClass("btn-link");
			$("#OSselect a").removeAttr("onclick");
			$("#OSselect a").attr({disable:true});
			$("#OSselect a").attr("style","color:#DCDCDC;cursor:text;"); 
			
			$("#selectContent a[doc='customizations']").removeClass("btn-link");
			$("#selectContent a[doc='customizations']").removeAttr("onclick");
			$("#selectContent a[doc='customizations']").attr({disable:true});
			$("#selectContent a[doc='customizations']").attr("style","color:#DCDCDC;cursor:text;"); 
		} 
	}
	//$("#cpuslider").slider("getValue");
	</script> 
</head>

<body>
<div class="con-right" id="conRight">
		<div class="fl yw-lump">
			<div class="yw-lump-title">
				<i id="i_back"  class="yw-icon icon-back" onclick="javascript:history.back();"></i><span>新增虚拟机</span>
				<%-- <i  id="i_back"  class="yw-icon icon-back" onclick="window.location.href='deviceList.do'"></i><span>设备：${projectPoint.name }</span>  --%>
			</div>
				<div class="fr-config">
					<span class="yw-btn bg-green mr26 hide" id="editBtn" onclick="editProjectPoint();">编辑</span> 
					<span class="yw-btn bg-red mr26" id="saveBtn" onclick="$('#i_back').click();">保存</span> 
								<span class="yw-btn bg-green mr26"  onclick="$('#i_back').click();">返回</span>
				</div>
		</div>

		<div class="fl yw-lump" style="overflow: auto;height: 800px;">
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
