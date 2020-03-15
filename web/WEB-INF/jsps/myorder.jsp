<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org" lang="zh">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

	<title>我发布的商品</title>

	<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
	<link href="public/css/font.css" rel="stylesheet" type="text/css">
	<link href="public/css/xadmin.css" rel="stylesheet"  type="text/css">

	<link href="css/personal.css" rel="stylesheet" type="text/css">
	<link href="css/colstyle.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="public/lib/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="public/js/xadmin.js"></script>


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

			<div class="user-collection">
				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong></div>
				</div>
				<hr/>

				<div class="you-like">
					<div class="s-content">
						<!--商品分类管理   商品类别名称  商品类别描述-->
						<table class="layui-table">
							<thead>
							<tr>
								<th>
									<div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
								</th>
								<th>订单号</th>
								<th>商品</th>
								<th>图片</th>
								<th>价格</th>
								<th>数量</th>
								<th>收货人</th>
								<th>收货人电话</th>
								<th>收货地址</th>
								<th>发货人电话</th>
								<th>操作</th>
							</thead>
							<tbody>
							<c:forEach items="${requestScope.list}" var="list" varStatus="num">
								<tr>
									<td>
										<div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
									</td>
									<td>${list.orderId}</td>
									<td>${list.shopping_name}</td>
									<td><img src="${list.photo}"></td>
									<td>￥${list.money} 元</td>
									<td>${list.num}</td>
									<td>${list.revceiving_name}</td>
									<td>${list.revceiving_phone}</td>
									<td>${list.revceiving_address}</td>
									<td>${list.send_phone}</td>
									<td class="td-manage">
										<a title="删除" onclick="member_del(this,'${list.order_id }')" href="javascript:;">
											<i class="layui-icon">&#xe640;</i>
										</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
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
				<a href="myorder?client=${sessionScope.user.id}">我的购买</a>

			</li>

			<li class="person">
				<a href="mycart">我的购物车</a>

			</li>


		</ul>

	</aside>
</div>

<script>
	/*用户-删除*/
	function member_del(obj,id){
		layer.confirm('确认要删除吗？',function(index){
			//发异步删除数据
			//等以后再使用异步，这里先使用
			$.get("order/delete?id="+id);
			$(obj).parents("tr").remove();
			layer.msg('已删除!',{icon:1,time:1000});
		});
	}
	function delAll (argument) {

		var data = tableCheck.getData();

		layer.confirm('确认要删除吗？'+data,function(index){
			//捉到所有被选中的，发异步进行删除
			layer.msg('删除成功', {icon: 1});
			$(".layui-form-checked").not('.header').parents('tr').remove();
		});
	}
</script>

</body>


</html>