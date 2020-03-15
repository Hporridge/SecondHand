<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>

	<body>

		<div class="login-boxtitle">
			<!--<a href="home/demo.html"><img alt="" src="/images/logobig.png" /></a>-->
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify" style="margin: auto;">

								<li class="am-active"><a href="">注册用户</a></li>

							</ul>
							<div><font style="color: red">${es}</font></div>
							<div class="am-tabs-bd">
								<form method="post" action="register_validate">
								<div class="am-tab-panel am-active">

										
							   <div class="user-email">
										<label for="username"><i class="am-icon-user"></i></label>
										<input type="text" name="username" id="username" placeholder="请输入用户名">
								   <div class="user-email">
									   <label for="username"><i class="am-icon-envelope-o"></i></label>
									   <input type="text" name="email" id="email" placeholder="请输入邮箱">
                 </div>										
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password" placeholder="设置密码">
                 </div>										
                 <div class="user-pass">
								    <label for="password2"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="password2" placeholder="确认密码">
                 </div>	
                 

                 
								 <div class="login-links">

							  	</div>
										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
									<div class="am-cf">
										<input type="button" onclick="location.href='login';" name="" value="返回登录" class="am-btn am-btn-primary am-btn-sm am-fl">
									</div>
								</div>
								</form>
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>

				</div>
			</div>
			
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<!--<a href="# ">恒望科技</a>-->
								<!--<b>|</b>-->
								<!--<a href="# ">商城首页</a>-->
								<!--<b>|</b>-->
								<!--<a href="# ">支付宝</a>-->
								<!--<b>|</b>-->
								<!--<a href="# ">物流</a>-->
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<!--<a href="# ">Rain开发</a>-->
								<!--<a href="# ">版权所有</a>-->
								<!--<a href="# ">如有需要</a>-->
								<!--<a href="# ">关注我的GitHub</a>-->
								<!--<em>github.rain1024.com</em>-->
							</p>
						</div>
					</div>
	</body>

</html>