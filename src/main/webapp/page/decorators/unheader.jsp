<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hotel.model.User" %>
<%@ page import="com.hotel.common.utils.Constants" %> 
	
	<div class="head-tool-bar"> 
    </div>  
	<div class="fl head-logo yw-right">
        <img src="${pageContext.request.contextPath}/source/images/inlogo_1.png" class="ml26" />
    </div>
    <div class="head-menu">
    	<ul class="fl">
        	<li onclick="window.location.href='${pageContext.request.contextPath}/customer/product/productInfo.do'">产品</li>
        	<li onclick="window.location.href='${pageContext.request.contextPath}/customer/product/caseInfo.do'">解决方案</li>
        	<li onclick="window.location.href='${pageContext.request.contextPath}/customer/product/helpInfo.do'">服务与帮助</li>
        	<li onclick="window.location.href='${pageContext.request.contextPath}/customer/console/consoleInfo.do'" target="_blank" >控制台管理</li> 
        	<%-- <li onclick="window.location.href='${pageContext.request.contextPath}/customer/product/consoleInfo.do'" target="_blank" >个人中心</li>  --%>
        </ul>
        <div class="fr head-menu-right ml40">
            <!-- <a href="#"><i class="fl yw-icon icon-dot"></i><span>你有新消息</span></a> -->
            <span  style="color:white;font-size:16px; float:left; margin-right:20px;">用户：${user.name }，欢迎您！</span>
            <a href="${pageContext.request.contextPath}/logout.do"><i class="fl yw-icon icon-fork"></i><span  style="color:white;font-size:16px;">退出</span></a> 
            
        </div>
    </div> 