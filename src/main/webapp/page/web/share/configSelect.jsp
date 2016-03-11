<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> 
<script type="text/javascript">
	function sltConfigChange(record){
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
	}
</script>
 <div class="yw-vm-span4-1">
	<div class="plan-vm-sub-title">
	<input id="id" name="id" type="hidden" value="${order.id }" />
	<input id="type" name="type" type="hidden" value="${order.type }" /> 
	<input id="state" name="state" type="hidden" value="${order.state }" /> 
	<input id="userId" name="userId" type="hidden" value="${order.userId }" /> 
		预设方案
	</div>
</div>
<div class="yw-vm-span4-1-1"> 
	<div class="cell">
		<!-- <h1>方案</h1>   --> 
		<c:if test="${order.state == 0 }">
			<input id="schemeId" name="schemeId" type="hidden" value="${order.schemeId }"/>
			<ul id="defaultCase" class="nav nav-pills">
				 <c:forEach var="item"  items="${caseList}">
              		 <li><a id="dc_a_${item.id}" class="btn-link" onclick="SingleSelected(this,'defaultCase',${item.id});"><input type="hidden" value="${item.id}" />${item.vmOrderSn}</a></li>
               	</c:forEach>
			</ul>
			<img src="<%=basePath%>source/images/config/bandwidth.png">
		</c:if>
		<c:if test="${order.state > 0 }">
			<input id="schemeId" name="schemeId" type="hidden" value="${order.schemeId }"/>
			<ul id="defaultCase" class="nav nav-pills">
				 <c:forEach var="item"  items="${caseList}">
              		 <li><a id="dc_a_${item.id}" disable="true" style="color:#DCDCDC;cursor:text;">${item.vmOrderSn}</a></li>
               	</c:forEach>
			</ul>
			<img src="<%=basePath%>source/images/config/bandwidth.png">
		</c:if>
	</div> 
</div>
<div class="yw-vm-span4-1">
	<div class="plan-vm-sub-title">
		服务器镜像
	</div>
</div>
<div class="yw-vm-span4-select">
	<div class="cell">
		<input id="imgUuid" name="imgUuid" type="hidden" value="${order.imgUuid }"/>
		<c:if test="${order.state == 0 }">
			<select id="osImg" style="width:660px;height:32px;" class="easyui-combobox" data-options="editable:false,onSelect:function(record){$('#imgUuid').val(record.value)}">
		 	 	<option  value="0">=请选择镜像文件=</option>  
		 	 	<c:forEach var="item"  items="${imgList}">
		 	 		<option  value="${item.id }">${item.name }</option>  
		 	 	</c:forEach>
			</select>
		 </c:if>
		<c:if test="${order.state > 0 }">
			<select id="osImg" style="width:660px;height:32px;" class="easyui-combobox" data-options="disabled:true,editable:false,onSelect:function(record){$('#imgUuid').val(record.value)}">
		 	 	<option  value="0">=请选择镜像文件=</option>  
		 	 	<c:forEach var="item"  items="${imgList}">
		 	 		<option  value="${item.id }">${item.name }</option>  
		 	 	</c:forEach>
			</select>
		 </c:if>
	</div>
</div>
<div class="yw-vm-span4-1">
	<div class="plan-vm-sub-title">
		服务器硬件配置
	</div>
</div>
<div class="yw-vm-span4-select">
	<div class="cell">
		<c:if test="${order.state == 0 }">
			<input id="configUuid" name="configUuid" type="hidden" value="${order.configUuid }"/>
			<select id="config" style="width:660px;height:32px;" class="easyui-combobox" data-options="editable:false,onSelect:sltConfigChange">
		 	 	<option  value="0">=请选择服务器配置=</option>  
		 	 	<c:forEach var="item"  items="${configList}">
		 	 		<option  value="${item.id}" cpuCount="${item.vcpus}" diskCount="${item.disk}" ramCount="${item.ram}">${item.name }</option>  
		 	 	</c:forEach>
			</select>
		</c:if>
		<c:if test="${order.state > 0 }">
			<input id="configUuid" name="configUuid" type="hidden" value="${order.configUuid }"/>
			<select id="config" style="width:660px;height:32px;" class="easyui-combobox" data-options="disabled:true,editable:false,onSelect:sltConfigChange">
		 	 	<option  value="0">=请选择服务器配置=</option>  
		 	 	<c:forEach var="item"  items="${configList}">
		 	 		<option  value="${item.id}" cpuCount="${item.vcpus}" diskCount="${item.disk}" ramCount="${item.ram}">${item.name }</option>  
		 	 	</c:forEach>
			</select>
		</c:if>
	</div>
</div>
<!-- <div class="yw-vm-span4-1">
	<div class="plan-vm-sub-title">
		硬件配置 
	</div>
</div> -->
<div class="yw-vm-span4 ">
	<div class="cell">
		<h1>${cpuConfig.name }</h1><input type="hidden" id="cpuId" name="cpuId" value="${cpuConfig.id }" /><input type="hidden" id="cpuCount" name="cpuCount" value="${order.cpuCount }" />  
		<input id="cpuslider" class="easyui-slider" value="${order.cpuCount }"   style="width:99%;margin: 50px 0 0 0;" data-options="disabled:true,min:${cpuConfig.min },max:${cpuConfig.max },showTip:true,step:${cpuConfig.scale },tipFormatter:function(value){$('#cputotal').text(value);$('#cpuCount').val(value);return value;}" /> 
		<h1 style="margin-top:25px">数量：<span  id="cputotal"   class="bignum">1</span>${cpuConfig.measure }</h1> 
		<img src="<%=basePath%>source/images/config/cpu.png">
	</div>
</div>
<div class="yw-vm-span4 ">
	<div class="cell">
		<h1>${memConfig.name }</h1><input type="hidden" id="ramId"  name="ramId" value="${memConfig.id }" /> <input type="hidden" id="ramCount"  name="ramCount" value="${order.ramCount }" /> 
		<input id="memslider" class="easyui-slider" value="${order.ramCount }"  style="width:99%;margin: 50px 0 0 0;" data-options="disabled:true,min:${memConfig.min },max:${memConfig.max },showTip:true,step:${memConfig.scale },tipFormatter:function(value){$('#memtotal').text(value);$('#ramCount').val(value);return value;}" /> 
		<h1 style="margin-top:25px">大小：<span  id="memtotal"  class="bignum">512</span>${memConfig.measure }</h1>   
		<img src="<%=basePath%>source/images/config/Memory.png">
	</div>
</div> 
<div class="yw-vm-span4 ">
	<div class="cell">
		<h1>${hdConfig.name }</h1> <input type="hidden" id="diskId" name="diskId" value="${hdConfig.id }" /> <input type="hidden" id="diskCount" name="diskCount" value="${order.diskCount }" />
		<input id="hdslider" class="easyui-slider" value="${order.diskCount }"  style="width:99%;margin: 50px 0 0 0;" data-options="disabled:true,min:${hdConfig.min },max:${hdConfig.max },showTip:true,step:${hdConfig.scale },tipFormatter:function(value){$('#hdtotal').text(value);$('#diskCount').val(value);return value;}" /> 
		<h1 style="margin-top:25px">大小：<span  id="hdtotal"  class="bignum">1</span>${hdConfig.measure }</h1>  
		<img src="<%=basePath%>source/images/config/Hard_Disk.png">
	</div>
</div>