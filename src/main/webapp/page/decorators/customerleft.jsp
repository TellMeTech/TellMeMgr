<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function gotoChildMenu(url) {
		window.location.href = url;
	}
	var number = 5; //定义条目数

	function LMYC() {
		var lbmc;
		for (i = 1; i <= number; i++) {
			lbmc = eval('LM' + i);
			//lbmc.style.display = 'none';
		}
	}

	function ShowFLT(i) {
		lbmc = eval('LM' + i);

		if (lbmc.style.display == 'none') {
			LMYC();
			lbmc.style.display = '';
		} else {
			lbmc.style.display = 'none';
		}
	}
</script>
<div class="con-left" id="conLeft">
	<div class="yw-user">
		<div class="yw-userhead">
			<img
				src="${pageContext.request.contextPath}/source/images/userhaed.png" />
		</div>
		<p class="yw-usertxt">${user.name}</p>
		<p class="yw-usertxt font-size14">${user.email}</p>
	</div>

	<div class="yw-left-menu"> 
		<ul>
			<li class="yw-left-menu-now">
				<em></em>
				<span>
					<i class="fl yw-icon icon-todayjob"></i>控制台管理
				</span>
				<div>
					<span
						onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>虚拟机监控
					</span>
					<span
						onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>配置管理
					</span>
					<span
						onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>虚拟机市场
					</span> 
				</div>
			</li>
			
			<li class="yw-left-menu-now">
				<em></em>
				<span>
					<i class="fl yw-icon icon-todayjob"></i>个人中心
				</span>
				<div>
					<span onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
						<i class="fl yw-icon icon-job"></i>个人资料
					</span> 
					<span onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/caseInfo.do')">
						<i class="fl yw-icon icon-job"></i>账号管理
					</span> 
					<span onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>认证管理
					</span> 
					<span
						onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>订单管理
					</span> 
					<span onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
							<i class="fl yw-icon icon-job"></i>工单管理
					</span> 
				 	<span onclick="gotoChildMenu('${pageContext.request.contextPath}/customer/product/productInfo.do')">
						<i class="fl yw-icon icon-job"></i>消息管理
					</span> 
				</div>
			</li>
		</ul>
	</div>
</div>