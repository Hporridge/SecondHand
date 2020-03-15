<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">

	<head lang="en">
		<meta charset="UTF-8">
		<title>登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="css/dlstyle.css" rel="stylesheet" type="text/css">
	</head>

	<body>

		<div class="login-boxtitle">
			<!--<a href="/home/home.html"><img alt="logo" src="/images/logobig.png" /></a>-->
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="images/big.jpg" /></div>
				<form action="login_validate" method="post">
				<div class="login-box">

							<h3 class="title">登录</h3>

							<div class="clear"></div>
						
						<div class="login-form">

							<!--<span th:text="${name}"></span>-->
							   <div class="user-name">
								    <label for="email"><i class="am-icon-user"></i></label>
								    <input type="text" name="email" id="email" placeholder="请输入邮箱">
                 </div>
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password" placeholder="请输入密码">
                 </div>

           </div>
            
            <div class="login-links">
								<!--<a href="#" class="am-fr">忘记密码</a>-->
								<a href="register" class="zcnext am-fr am-btn-default">注 册</a>
								<br />
            </div>
								<div class="am-cf">
									<input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
								</div>
					<div class="am-cf">
						<input type="button" onclick="location.href='shopping';" name="" value="游客登录" class="am-btn am-btn-primary am-btn-sm">
					</div>
					<div><font style="color: red">${es}</font></div>
					<div><font style="color: red">${ms}</font></div>
				</div>
				</form>
			</div>
		</div>
					<div class="footer ">
						<div class="footer-hd ">
							<p>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
							</p>
						</div>
					</div>
	</body>

</html>