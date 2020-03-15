<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>后台管理系统</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/infstyle.css" rel="stylesheet" type="text/css">
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="../js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="../js/fkjava_timer.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#nowTime").runTimer();
        })
    </script>

</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
            <!--顶部导航条 -->
            <div class="am-container header" style="margin-left: -400px;margin-top: 30px">
                <ul class="message-r" >
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="indexBackstage" target="_top" class="h"><font size="6px" color="#408fcd">二手交易后台管理系统</font></a></div>
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
<div class="nav-table" style="margin-left: 450px">
    欢迎<span class="x-red">管理员</span>登录系统！&nbsp;&nbsp;&nbsp;&nbsp; 当前时间:<span id="nowTime"></span></blockquote>  <span style="margin-left: 100px"><a href="exit" style="color: #de4835"><strong>退出系统</strong></a></span>
</div>
<b class="line"></b>
<div class="center">
    <div class="col-main">
        <div class="main-wrap">

            <div class="user-info">
                <!--标题 -->
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单编辑</strong></div>
                </div>
                <hr/>
                <!--用户信息 用户名 邮箱 需要提交按钮-->
                <div class="info-main">
                    <form class="am-form am-form-horizontal" method="POST" id="deptForm"  action="../order/edit">
                        <input type="hidden" name="order_id" id="order_id" value="${list.order_id}" >
                        <div class="am-form-group">
                            <label  class="am-form-label">商品名称</label>
                            <div class="am-form-content">
                                <input type="text" id="shopping_name" name="shopping_name" value="${list.shopping_name}">

                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">数量</label>
                            <div class="am-form-content">
                                <input type="text" id="num" name="num"  value="${list.num}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">金额</label>
                            <div class="am-form-content">
                                <input type="text" id="money" name="money"  value="${list.money}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">收货地址</label>
                            <div class="am-form-content">
                                <input type="text" id="revceiving_address" name="revceiving_address"  value="${list.revceiving_address}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">收货人</label>
                            <div class="am-form-content">
                                <input type="text" id="revceiving_name" name="revceiving_name"  value="${list.revceiving_name}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">收货人电话</label>
                            <div class="am-form-content">
                                <input type="text" id="revceiving_phone" name="revceiving_phone"  value="${list.revceiving_phone}">
                            </div>
                        </div>
                        <div class="am-form-group">
                            <label class="am-form-label">寄件人电话</label>
                            <div class="am-form-content">
                                <input type="text" id="send_phone" name="send_phone"  value="${list.send_phone}">
                            </div>
                        </div>
                        <div class="am-cf">
                        <input type="submit" name="" value="提交" class="am-btn am-btn-primary am-btn-sm" style="margin-left: 240px;width: 200px">
                    </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
    <aside class="menu">
        <ul>
            <li class="person">
                <a href="indexBackstage" style="color: #aa4b00">用户管理</a>
            </li>
            <li class="person">
                <a href="addshoppingclass" style="color: #aa4b00">商品分类管理</a>
            </li>
            <li class="person">
                <a href="shoppings" style="color: #aa4b00">商品管理</a>
            </li>
            <li class="person">
                <a href="shoppingorder" style="color: #aa4b00">订单管理</a>
            </li>
        </ul>
    </aside>
</div>
</body>
</html>