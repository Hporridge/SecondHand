<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js"></script>

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
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
						
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!--交易成功-->
											<div class="order-status5">
												<div class="order-content">
													<div class="order-left">
														<ul class="item-list" th:each="line : ${list}">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="" th:src="${line.photo}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p th:text="${line.title}"></p>
																			<p class="info-little" th:text="${line.content}">

																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price" th:text="${line.money}">

																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>1
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	删除订单</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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