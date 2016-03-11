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
<base href="<%=basePath%>">
<title>服务帮助</title>
</head>
<body>
	<div class="study-main">
		<div class="yw-www-wrap">
			<!--  新手入门 -->
			<div class="clearfix">
				<div id="mod-title-line" class="mod-title-line">
					<h1>贴心新手引导，帮您快速入门</h1>
				</div>
				<div class="mod-swiper">
					<!-- mod-swiper -->
					<div class="swiper-rgn yw-www-wrap">
						<div class="swiper-content three" shownum="three">
							<ul class="clearfix" id="newer">
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<ul class="swiper-ul"
											style="width: 3636px; margin-left: -1212px;">

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>新手学堂</h1>
														<p>为刚接触虚拟机管理平台的您提供一站式的介绍和引导，帮助您更好的了解虚拟机管理平台</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1PQiIKVXXXXbkaXXXXXXXXXXX-132-125.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>视频教程</h1>
														<p>丰富生动的产品介绍视频，让您更便捷全面的了解虚拟机管理平台产品</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1CzZrKFXXXXbQXVXXXXXXXXXX-131-118.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>自助服务</h1>
														<p>提供多种快捷入口和便捷工具，让您轻松体验云计算</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1o.yCKVXXXXbPapXXXXXXXXXX-131-107.png">
											</a></li>



											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>新手学堂</h1>
														<p>为刚接触管理平台的您提供一站式的介绍和引导，帮助您更好的了解虚拟机管理平台</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1PQiIKVXXXXbkaXXXXXXXXXXX-132-125.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>视频教程</h1>
														<p>丰富生动的产品介绍视频，让您更便捷全面的了解虚拟机管理平台产品</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1CzZrKFXXXXbQXVXXXXXXXXXX-131-118.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>自助服务</h1>
														<p>提供多种快捷入口和便捷工具，让您轻松了解虚拟机管理平台</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1o.yCKVXXXXbPapXXXXXXXXXX-131-107.png">
											</a></li>



											<!-- <li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>新手学堂</h1>
														<p>为刚接触虚拟机管理平台的您提供一站式的介绍和引导，帮助您更好的了解虚拟机管理平台</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1PQiIKVXXXXbkaXXXXXXXXXXX-132-125.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>视频教程</h1>
														<p>丰富生动的产品介绍视频，让您更便捷全面的了解虚拟机管理平台产品</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1CzZrKFXXXXbQXVXXXXXXXXXX-131-118.png">
											</a></li>

											<li class="swiper-li" style="width: 404px;"><a
												class="swiper-box-item"
												href="javascript:void(0);">
													<div class="newer-cont">
														<h1>自助服务</h1>
														<p>提供多种快捷入口和便捷工具，让您轻松了解拟机管理平台</p>
														<p class="more">查看更多&gt;</p>
													</div> <img
													src="//img.alicdn.com/tps/TB1o.yCKVXXXXbPapXXXXXXXXXX-131-107.png">
											</a></li> -->

										</ul>
									</div>

									<!-- 分页器 -->
									<div class="swiper-pagination" style="display: none;">

										<span class="dots swiper-dots-active" num="1"></span> <span
											class="dots" num="2"></span> <span class="dots" num="3"></span>

									</div>
									<!-- 导航按钮 -->
									<div class="swiper-button-prev" style="display: none;">
										<i class="icon-arrow-left"></i>
									</div>
									<div class="swiper-button-next" style="display: none;">
										<i class="icon-arrow-right"></i>
									</div>
								</div>
							</ul>
						</div>
						<div class="nav"></div>
					</div>
					<!-- /mod-swiper -->
				</div>
			</div>
			<!--  /售后支持-->
			<div class="clearfix" data-spm="1003">
				<div id="mod-title-line" class="mod-title-line">
					<h1>多种系统支持，助您轻松使用</h1>
				</div>
				<ul id="sell-support">
					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div class="topdisp">
								<img
									src="//img.alicdn.com/tps/TB1GTSkKVXXXXaLXFXXXXXXXXXX-101-82.png">
								<h1>windows</h1>
								<p>
									<span>推荐指数</span> <img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

								</p>
							</div>
							<!-- <p>windows系统使用云电脑教程</p> -->
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0)" onclick="custom()">
							<div class="topdisp">
								<img
									src="//img.alicdn.com/tps/TB1Cjl8KVXXXXcPaXXXXXXXXXXX-102-94.png">
								<h1>Linux</h1>
								<p>
									<span>推荐指数</span> <img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

								</p>
							</div>
							<!-- <p>Linux系统使用云电脑教程</p> -->
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div class="topdisp">
								<img
									src="//img.alicdn.com/tps/TB1m9yDKVXXXXXOXXXXXXXXXXXX-102-99.png">
								<h1>IPad</h1>
								<p>
									<span>推荐指数</span> <img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

								</p>
							</div>
							<!-- <p>IPad使用云电脑教程</p> -->
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div class="topdisp">
								<img
									src="//img.alicdn.com/tps/TB1.Y1tKVXXXXbMXpXXXXXXXXXX-99-100.png">
								<h1>Android</h1>
								<p>
									<span>推荐指数</span> <img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

								</p>
							</div>
							<!-- <p>Android使用云电脑教程</p> -->
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div class="topdisp">
								<img
									src="//img.alicdn.com/tps/TB1rjCXKVXXXXaBaXXXXXXXXXXX-101-65.png">
								<h1>MAC</h1>
								<p>
									<span>推荐指数</span> <img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

									<img
										src="//img.alicdn.com/tps/TB1HOSxKVXXXXXtXpXXXXXXXXXX-26-25.png">

								</p>
							</div>
							<!-- <p>MAC使用云电脑教程</p> -->
					</a></li>

				</ul>
			</div>
			<!--  /服务承诺-->
			<div class="clearfix" data-spm="1004">
				<div id="mod-title-line" class="mod-title-line">
					<h1>金牌服务承诺，让你放心无忧</h1>
					<a href="javascript:void(0);" target="_blank"
						data-spm-click="gostr=/aliyun;locaid=">售后服务细则&gt;&nbsp;</a>
				</div>
				<ul id="service-promise">
					<li class="main">
					<a class="highlight"
						href="javascript:void(0);">
							<div>
								<span class="bignum">7</span> <span>
									<p>X24小时</p>
									<p>售后支持</p>
								</span>
							</div>
							<p>7×24×365，不管白天黑夜，虚拟机管理平台一直都在为您保驾护航</p>
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div>
								<span class="bignum">0</span> <span>
									<p>元</p>
									<p>免费快速备案</p>
								</span>
							</div>
							<p>备案0担忧，备多久云服务器免费送多久，最高上限30天</p>
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div>
								<span class="bignum">0</span> <span>
									<p>元</p>
									<p>免费镜像服务</p>
								</span>
							</div>
							<p>通过镜像服务您可以快速部署业务环境，轻松搭建云服务器</p>
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div>
								<span class="bignum">100</span> <span>
									<p>倍</p>
									<p>故障赔偿</p>
								</span>
							</div>
							<p>由于虚拟机管理平台故障导致用户云产品无法正常使用提供100倍的故障时间赔偿</p>
					</a></li>

					<li class="gap"></li>


					<li class="main"><a class="highlight"
						href="javascript:void(0);">
							<div>
								<span class="bignum">5</span> <span>
									<p>天</p>
									<p>无理由退款</p>
								</span>
							</div>
							<p>云服务器ECS、云数据库RDS、云虚拟主机，购买后5天内可无理由退全款</p>
					</a></li>

				</ul>
			</div> 
		</div>
	</div>
</body>
</html>
