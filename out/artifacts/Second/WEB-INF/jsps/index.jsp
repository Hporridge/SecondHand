<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
			
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="shopping" target="_top" class="h">二手交易首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="index" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="mycart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span></a></div>
							</div>

							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="" href="exit" target="_top"><span>退出系统</span></a></div>
							</div>
							
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="search-bar pr">
								<form action="search_shopping">
									<input id="searchInput" name="content" type="text" placeholder="搜索你想找的商品" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="index">首页</a></li>
							</ul>
						   
						</div>
			</div>
			<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong></div>
						</div>
						<hr/>
						<!--个人信息 -->
						<div class="info-main">
							<div><strong style="color: red">修改完个人信息后需要重新登陆系统</strong></div>
							<form class="am-form am-form-horizontal" method="POST" id="deptForm"  action="mymessage/edit">
								<input type="hidden" name="id" id="id" value="${list.id }" >
								<div class="am-form-group">
									<label class="am-form-label">用户名</label>
									<div class="am-form-content">
										<input type="text" id="username" name="username" placeholder="name" value="${list.username}">

									</div>
								</div>
								<div class="am-form-group">
									<label class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="email" name="email" placeholder="Email" type="text" value="${list.email}">
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">联系电话</label>
									<div class="am-form-content">
										<input id="phone" name="phone" placeholder="Phone" type="text" value="${list.phone}">
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">收货地址</label>
									<div class="am-form-content">
										<input id="address" name="address" placeholder="Address" type="text" value="${list.address}">
									</div>
								</div>

								<div class="am-cf">
									<input type="submit" name="" value="保存修改" class="am-btn am-btn-primary am-btn-sm" style="margin-left: 240px;width: 200px">
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index">个人资料</a>
					</li>
					<li class="person">
						<a href="addshopping">发布商品</a>
					</li>
					<li class="person">
						<a href="myshopping">我的发布</a>
					</li>
					<li class="person">
						<a href="myorder?client=${sessionScope.user.id}">我的购买</a>
					</li>
					<li class="person">
						<a href="mycart">我的购物车</a>
					</li>
				</ul>
			</aside>
		</div>
	</body>
</html>