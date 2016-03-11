<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
function gotoMainMenu(url,selectedMainMemu) {
	$.ajax({  
        type : "post",  
        url : "${pageContext.request.contextPath}/jsonLoadSession.do?selectedMainMemu="+selectedMainMemu,  
        async : false
        });  
	
	window.location.href = url;
}
</script>
	<div class="fl head-logo">
        <img src="${pageContext.request.contextPath}/source/images/inlogo_1.png" class="ml26" />
    </div>
    <div class="fr head-menu">
    	<ul class="fl">
    		<c:forEach var="item" items="${sessionScope.userResources}">
    			
    			<li <c:if test="${item.id == sessionScope.userInfo.selectedMainMemu}">class="head-menu-now"</c:if> onclick="gotoMainMenu('${pageContext.request.contextPath}${item.url}','${item.id}')">${item.name}</li>
    		    
    		</c:forEach>
        </ul>
        <div class="fr head-menu-right ml40">
            <!-- <a href="#"><i class="fl yw-icon icon-dot"></i><span>你有新消息</span></a> --> 
            <a href="${pageContext.request.contextPath}/logout.do"><i class="fl yw-icon icon-fork"></i><span  style="color:white;font-size:16px;">退出</span></a>
        </div>
    </div>
