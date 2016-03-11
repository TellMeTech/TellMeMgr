<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<div id="slider-container">
	<div class="box_skitter box_skitter_large">
		<ul class="yw-center">
			<li class="yw-center"> 
				<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/source/images/logo-bg.jpg" alt="" /></a>
				<div class="label_text">
					<h3 class="colortext uppercase"> 虚拟机产品介绍
					</h3>
					<span class="apply-btn"  onclick="window.location.href='${pageContext.request.contextPath}/admin.do'">立即申请</span>
					<%-- <span class="apply-btn"  onclick="window.location.href='${pageContext.request.contextPath}/customer/product/gotoApply.do'">立即申请</span> --%>
				</div>
			</li>
			<li class="yw-center">
				<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/source/images/logo-bg.jpg" alt="" /></a> 
				<div class="label_text">
					<h3 class="colortext uppercase">广告位2
					</h3>
					<span>产品推广2
					</span>
				</div> 
			</li>
			<li class="yw-center">
				<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/source/images/logo-bg.jpg" alt="" /></a>
				<div class="label_text">
					<h3 class="colortext uppercase">广告位3
					</h3>
					<span>产品推广3
					</span>
				</div>
			</li>
		</ul>
	</div>
	<div id="shadow-img-slider"></div>
</div>
