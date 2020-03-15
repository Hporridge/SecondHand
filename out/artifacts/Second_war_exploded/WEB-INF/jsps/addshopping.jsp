<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发布商品</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/refstyle.css" rel="stylesheet" type="text/css">

		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

		<script>
			$(function(){
				$("#inputPic").change(function(){
					$filePath=URL.createObjectURL(this.files[0]);
					$("#preview").attr('src',$filePath);
				})
			})
		</script>

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
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
						
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发布商品</strong><small></small></div>
					</div>
					<hr/>
					<div class="comment-list">
					<!--进度条-->
					
					
					
				<form enctype="multipart/form-data" method="post" action="shoppinguploadimg">
						<div class="refund-main">
							<div class="item-comment">

								<div class="am-form-group">
									<label  class="am-form-label">商品名称<span></span></label>
									<div class="am-form-content">
										<input type="text" name="title">
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">商品价格<span></span></label>
									<div class="am-form-content">
										<input type="text" name="money">
									</div>
								</div>
								<div class="am-form-group">
									<label class="am-form-label">商品介绍<span></span></label>
									<div class="am-form-content">
										<textarea placeholder="" name="content"></textarea>
									</div>
								</div>
								<%--商品分类选择--%>
								<div class="am-form-group">
									<label class="am-form-label">类别</label>
									<div class="am-form-content">
										<select id="shopping_type" name="shopping_type" class="valid" >
											<c:forEach items="${requestScope.shopingclass_list}" var="line" varStatus="stat">
												<option value="${line.id}" <c:if test="${shopping_type == line.id }">selected</c:if>>${line.shoppingclass_name}</option>
											</c:forEach>
										</select>
									</div>
								</div>

							</div>
							<div class="refund-tip">
								<div class="filePic">
									<input type="file" class="inputPic" id="inputPic" value="选择图片" name="file" max="5" maxsize="5120" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
									<img src="images/image.jpg" alt="" name="photo">
								</div>
								<div class="filePic" style="margin-top:-100px;margin-left: 200px;">
									<img id="preview" src="" alt="">
								</div>
								<span class="desc">上传商品图片</span>
							</div>
							<div class="info-btn">
								<button type="submit" class="am-btn am-btn-danger">提交申请</button>
							</div>
							<div><font style="color: red">${message}</font></div>
						</div>
				</form>
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
							<a href="myorder">我的购买</a>

						</li>

						<li class="person">
							<a href="mycart">我的购物车</a>

						</li>
				
								</ul>

			</aside>
		</div>

	</body>

</html>
