<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>购物车页面</title>
		<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="css/optstyle.css" rel="stylesheet" type="text/css" />
		<link href="public/css/font.css" rel="stylesheet" type="text/css">
		<link href="public/css/xadmin.css" rel="stylesheet"  type="text/css">
		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/colstyle.css" rel="stylesheet" type="text/css">

		<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">

		<link href="css/personal.css" rel="stylesheet" type="text/css">
		<link href="css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="public/lib/layui/layui.js" charset="utf-8"></script>
		<script type="text/javascript" src="public/js/xadmin.js"></script>

		<script type="text/javascript" src="/js/jquery.js"></script>
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
			<!--购物车 -->
			<div class="concent">
				<!--商品分类管理   商品类别名称  商品类别描述-->
				<table class="layui-table">
					<thead>
					<tr>
						<th>
							<div class="layui-unselect header layui-form-checkbox price-check" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
						</th>
						<th>商品名称</th>
						<th>商品信息</th>
						<th>价格</th>
						<th>操作</th>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.list}" var="list" varStatus="num">
						<tr>
							<td>
								<div class="layui-unselect layui-form-checkbox price-check" lay-skin="primary" data-id='2' data-price="${list.money}" data-ids="${list.id}"><i class="layui-icon">&#xe605;</i></div>
							</td>
							<td>${list.title}</td>
							<td><img src="${list.photo}" title="${list.content}"></td>
							<td>${list.money}</td>
							<td class="td-manage">
								<a title="删除" onclick="member_del(this,'${list.id }')" href="javascript:;">
									<i class="layui-icon">&#xe640;</i>
								</a>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<div class="float-bar-right">
						<div class="amount-sum">
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="btn-area">
							<a onclick="fun()" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
								<span>结&nbsp;算</span></a>
						</div>
					</div>
				</div>
				<script type="text/javascript">
                    var sum = 0;
                    let ids = 0;
                    $(function () {
                        $('.price-check').on('click', function () {
                            sum = 0;
                            ids = 0;
                            let x = $('.price-check.layui-form-checked').map(
                                function (index, item) { return $(item).attr('data-price')}).toArray();

                            ids = $('.price-check.layui-form-checked').map(
                                function (index, item) { return $(item).attr('data-ids')}).toArray();

                            for (var i=0; i<x.length; i++) {
                                sum += parseFloat((x[i]));
                            }
                            console.log(x)
                            console.log(sum)
                            console.log(ids)
                        })
                    })
					function fun() {
                    	if (sum == 0) {
                    		alert("请选择你要结算的物品!!!")
						}else {
							var flag = confirm("是否确认购买？共计"+sum+"元");
							if (flag==true){
								location.href = 'buyshopping?sumPrice='+sum+'&ids='+ids+'&client='+${sessionScope.user.id};
							}
						}
                    }
				</script>
				<script>
					/*用户-删除*/
					function member_del(obj,id){
						layer.confirm('确认要删除吗？',function(index){
							//发异步删除数据
							//等以后再使用异步，这里先使用
							$.get("mycart/delete?id="+id);
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
			</div>
	</body>
</html>