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
<title>解决方案</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1  ,maximum-scale=1, user-scalable=no" /> 
</head>

<body>
<!-- <div class="plan-cell yw-row plan-2016">
    <div class="plan-title">
        办公云，满足您各种办公需求
        <a class="yw-right more" href=""></a>
    </div>
    <p class="info">解放办公限制，畅享工作乐趣，任何时间，任何地点，任何设备。</p>
    <div class="yw-clear"> 
        <div style="width: 20%;" class="cell yw-left">
            <a href="javascript:void(0);" target="_blank">
                <div class="box">
                    <h1>域名注册</h1>
                    <p class="dotdotdot" style="height: 40px; word-wrap: break-word;">国内域名市场NO.1，19年专业域名服务，超30种域名供您选择。</p>
                    <img id="img1" onmouseover="$('#img1').addClass('action');$('#img2').removeClass('action');" src="//img.alicdn.com/tps/i2/TB1F5UFKXXXXXa6XXXX5rDaIVXX-80-80.png">
                    <img id="img2" onmouseleave="$('#img2').addClass('action');$('#img1').removeClass('action');"  class="action" src="//img.alicdn.com/tps/i3/TB1K1MDKXXXXXcrXXXX5rDaIVXX-80-80.png">
                    <p class="btn">了解详情</p>
                </div>
            </a>
        </div> 
        <div style="width: 20%;" class="cell yw-left">
            <a href="javascript:void(0);" target="_blank">
                <div class="box">
                    <h1>云服务器托管</h1>
                    <p class="dotdotdot" style="height: 40px; word-wrap: break-word;">可弹性伸缩、安全稳定、简单易用。28.8元/月起</p>
                    <img id="img3" onmouseover="$('#img3').addClass('action');$('#img4').removeClass('action');"  src="//img.alicdn.com/tps/i4/TB1YmkHKXXXXXamXXXXknENJpXX-90-80.png">
                    <img id="img4" onmouseleave="$('#img4').addClass('action');$('#img3').removeClass('action');"  class="action" src="//img.alicdn.com/tps/i1/TB1ed7mKXXXXXbnXFXXknENJpXX-90-80.png">
                    <p class="btn">了解详情</p>
                </div>
            </a>
        </div> 
        <div style="width: 20%;" class="cell yw-left">
            <a href="javascript:void(0);" target="_blank">
                <div class="box">
                    <h1>建站服务</h1>
                    <p class="dotdotdot" style="height: 40px; word-wrap: break-word;">服务全程监管，不满意全额退款。</p>
                    <img id="img5" onmouseover="$('#img5').addClass('action');$('#img6').removeClass('action');"  src="//img.alicdn.com/tps/i2/TB1ss.sKXXXXXcRXpXXknENJpXX-90-80.png">
                    <img id="img6" onmouseleave="$('#img6').addClass('action');$('#img5').removeClass('action');"  class="action" src="//img.alicdn.com/tps/i3/TB1I6.uKXXXXXa.XpXXknENJpXX-90-80.png">
                    <p class="btn">了解详情</p>
                </div>
            </a>
        </div> 
        <div style="width: 20%;" class="cell yw-left">
            <a href="javascript:void(0);" target="_blank">
                <div class="box">
                    <h1>云解析</h1>
                    <p class="dotdotdot" style="height: 40px; word-wrap: break-word;">提供安全、稳定、极速的域名解析服务，每天超百亿次解析响应</p>
                    <img id="img7" onmouseover="$('#img7').addClass('action');$('#img8').removeClass('action');"  src="//img.alicdn.com/tps/i4/TB1OMIbKXXXXXa5aXXX5rDaIVXX-80-80.png">
                    <img id="img8" onmouseleave="$('#img8').addClass('action');$('#img7').removeClass('action');"  class="action" src="//img.alicdn.com/tps/i1/TB1ZtcjKXXXXXX8XVXX5rDaIVXX-80-80.png">
                    <p class="btn">了解详情</p>
                </div>
            </a>
        </div> 
        <div style="width: 20%;" class="cell yw-left">
            <a href="javascript:void(0);" target="_blank">
                <div class="box">
                    <h1>备案</h1>
                    <p class="dotdotdot" style="height: 40px; word-wrap: break-word;">备案0担忧，备多久云服务器免费送多久</p>
                    <img id="img9" onmouseover="$('#img9').addClass('action');$('#img0').removeClass('action');"  src="//img.alicdn.com/tps/i2/TB1Zi7jKXXXXXX6XVXX5rDaIVXX-80-80.png">
                    <img id="img0" onmouseleave="$('#img0').addClass('action');$('#img9').removeClass('action');"  class="action" src="//img.alicdn.com/tps/i1/TB1H7geKXXXXXczXVXX5rDaIVXX-80-80.png">
                    <p class="btn">了解详情</p>
                </div>
            </a>
        </div>
    </div>
</div>  -->
<div class="plan-cell yw-row plan-2017">

    <div class="plan-title">
        办公云，满足您各种办公需求
        <a class="yw-right more" href=""></a>
    </div> 
    <p class="info">解放办公限制，畅享工作乐趣，任何时间，任何地点，任何设备。</p>
    <div class="yw-clear"> 
        <div class="yw-span6 ">
            <div class="cell">
                <h1>工作随时待命，设备触手可得</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:526px;">
                手机、电脑、笔记本、平板，从此你的电脑只是一个屏幕桌面。通过账号访问云桌面，体验pc同样效果，让工作变得更轻松、快捷。无论是异地办公，BYOD，云端强大的数据处理能力，都能快速实现协同，打破传统企业业务部署模式的限制。
                </p>
            </div>
        </div> 
        <div class="yw-span6 yw-last">
            <div class="cell">
                <h1>软件云端升级，系统自动维护</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:526px;">
                免安装，免杀毒，不必再为兼容性问题苦恼。无需购置更多新的应用软件，云桌面即可带来全新的、更便捷的企业日常工作方式的革新。业务系统和数据都在云端服务器存储和管理，既能实现快速维护升级，升级管理过程也不会影响日常工作。
                </p>
            </div>
        </div> 
        <div class="yw-span6 ">
            <div class="cell">
                <h1>数据安全管控，桌面一键复位</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:526px;">
                所有数据和应用在云端存储，云桌面平台上的资源和应用都不会再本地设备上备份，所见全部存储在云端；企业级的IT维护，杜绝数据泄露和病毒木马的危害，任何一个用户桌面都可快速复位，保障业务工作的延续性。
                </p>
            </div>
        </div> 
        <div class="yw-span6 yw-last">
            <div class="cell">
                <h1>资源即时访问，习惯无缝迁移</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:526px;">
                出门和客户交谈，无需带着冗余德设备，无需带上大叠A4材料，一个账户，任意设备远端登录访问办公资源，让每一场商务谈判都变得时尚现代。熟悉的windows操作环境，将原有工作环境和操作习惯无缝迁移。即时分配新的资源到终端用户设备，随时随地都可轻松获得办公所需的环境和资源。
                </p>
            </div>
        </div>
	</div>
</div>
<div class="plan-cell yw-row plan-2017">

    <div class="plan-title">
        教育云
        <a class="yw-right more" href=""></a>
    </div> 
    <p class="info">解放孩子天性，保障绿色上网，每一台电脑将是为孩子私人定制。</p>
    <div class="yw-clear"> 
        <div class="yw-span4 ">
            <div class="cell">
                <h1>简易操作，时尚健康</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:322px;">
                服务器稳定、可靠，基本不需要维护。虚拟化云桌面的隔离性和易还原性，让学生远离病毒和各种故障。终端设备精简、价格低廉。
                </p>
                <a href="javascript:void(0);">了解更多&nbsp;&gt;</a>
            </div>
        </div> 
        <div class="yw-span4 ">
            <div class="cell">
                <h1>解放天性，私人定制</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:322px;">
                云里雾里教育云桌面，能够植入任意的设备，并且能够根据年级需要，或是个人习惯去制定不一样的桌面内容。
                </p>
                <a href="javascript:void(0);">了解更多&nbsp;&gt;</a>
            </div>
        </div> 
        <div class="yw-span4 yw-last">
            <div class="cell">
                <h1>电子作业，师生互动</h1>
                <p class="dotdotdot" style="word-wrap: break-word;width:322px;">
                云里雾里教育云桌面，每个孩子将依靠账户密码，获得自己的私人学习空间，老师可以在后台进行作业布置，学习资料的分发，学生可以及时与老师互动。
                </p>
                <a href="javascript:void(0);">了解更多&nbsp;&gt;</a>
            </div>
        </div> 
	</div>
</div>    
<div class="plan-cell plan-easy yw-row yw-clear">
 <div class="plan-title">
      游戏云
     <a class="yw-right more" href=""></a>
 </div>
 <p class="info">硬件租赁扩容，游戏免下载安装，居家享受云网吧魅力</p> 
    <div class="yw-span4 ">
        <div class="cell">
            <h1>硬件升级，即购即享</h1>
            <h2>只需动动手指，就能享受高端游戏电脑的配置。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i2/TB1oJb3KXXXXXX3XFXXezUPJpXX-90-90.jpg">
        </div>
    </div>


    <div class="yw-span4 ">
        <div class="cell">
            <h1>云端游戏，永不断线</h1>
            <h2>再也不必为游戏掉线而丢失经验和胜利场次了。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i4/TB1k7HQKXXXXXcbXVXXezUPJpXX-90-90.jpg">
        </div>
    </div>

    <div class="yw-span4   yw-last">
        <div class="cell">
            <h1>海量游戏，网吧体验 </h1>
            <h2>无需下载、安装、更新，直接登陆体验最新最好玩的游戏。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i3/TB1hSIbKXXXXXcqXXXXezUPJpXX-90-90.jpg">
        </div>
    </div>
</div>
<div class="plan-cell plan-easy yw-row yw-clear">
 <div class="plan-title">
      DAAS
     <a class="yw-right more" href=""></a>
 </div>
 <p class="info">颠覆传统，开启电脑自由云时代。</p> 
    <div class="yw-span4 ">
        <div class="cell">
            <h1>按需订购，弹性选择</h1>
            <h2> DAAS为企业和个人提供更加灵活、弹性的IT基础设施投资选择。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i2/TB1ZnbUKXXXXXaNXFXX5qTAJFXX-92-92.jpg">
        </div>
    </div>

    <div class="yw-span4  yw-last ">
        <div class="cell">
            <h1>专属环境，安全便捷</h1>
            <h2>DAAS帮助企业和个人用户随时随地获取兼顾便利性和私密性的电脑环境。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i1/TB1ztEgKXXXXXX5XXXXezUPJpXX-90-90.jpg">
        </div>
    </div>
    <div class="yw-span4 ">
        <div class="cell">
            <h1>云端运维，成本低廉</h1>
            <h2>无需关心桌面维护，不必操心电脑的实际硬件情况和系统架构。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i1/TB17o.gKXXXXXXYXXXXezUPJpXX-90-90.jpg">
        </div>
    </div>
    <div class="yw-span4  yw-last ">
        <div class="cell">
            <h1>资源整合，最佳方案</h1>
            <h2>以更少的系统资源消耗实现传统VDI技术的虚拟化效果，能与DAAS现有的云管理平台无缝整合。</h2>
            <p><a href="javascript:void(0);" target="_blank">了解详情&nbsp;&gt;</a></p>
            <img src="//img.alicdn.com/tps/i1/TB1ztEgKXXXXXX5XXXXezUPJpXX-90-90.jpg">
        </div>
    </div>
 </div> 
</body>
</html>
