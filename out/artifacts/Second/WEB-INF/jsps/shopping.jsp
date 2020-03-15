<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns:th="http://www.thymeleaf.org" lang="zh">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>首页</title>
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	</head>
	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
			<div class="am-container header">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<!--<a href="#" target="_top" class="h">亲，请登录</a>-->
							<!--<a href="#" target="_top">免费注册</a>-->
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
			<div class="shopMainbg">
					<div class="am-container ">
						<div class="shopTitle ">
							<ul>
								<li><h4>全部商品</h4></li>
								<li><h4>&nbsp;&nbsp;&nbsp;选择分类&nbsp;&nbsp;</h4></li>

								<form method="POST" id="deptForm"  action="ensure">
								<li style="padding-top: 8px">
									<select id="shopping_type" name="shopping_type" class="valid" >
										<c:forEach items="${requestScope.shopingclass_list}" var="line" varStatus="stat">
											<option value="${line.id}" <c:if test="${shopping_type == line.id }">selected</c:if>>${line.shoppingclass_name}</option>
										</c:forEach>
									</select>
									&nbsp;&nbsp;<input type="submit" name="" value="确定" class="am-btn am-btn-primary am-btn-sm" style="width: 50px">
									&nbsp;&nbsp;&nbsp;&nbsp;<input id="message" type="hidden" value="${addMessage}">
								</li>
								</form>
							</ul>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 ">
						<ul class="am-thumbnails ">
							<c:forEach items="${requestScope.list}" var="list" varStatus="num">
							<li>
								<div class="list ">
									<a >
										<img src="${list.photo}"/>
										<div class="pro-title ">${list.title}</div>
										<span class="e-price " >￥<span>${list.money}</span></span><br>
										<a href='addcart?id=${list.id}' class="e-price ">添加到购物车</a>
									</a>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
					<div class="footer ">
					</div>
				</div>
        <script>
            $(function(){
                if(!!"${addMessage}"){
                    alert("${addMessage}");
                }
            })
        </script>
	</body>
</html>