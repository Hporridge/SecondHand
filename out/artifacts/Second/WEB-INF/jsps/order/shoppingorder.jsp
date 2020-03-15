<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>后台管理系统</title>

    <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="css/personal.css" rel="stylesheet" type="text/css">
    <link href="css/infstyle.css" rel="stylesheet" type="text/css">
    <link href="public/css/font.css" rel="stylesheet" type="text/css">
    <link href="public/css/xadmin.css" rel="stylesheet"  type="text/css">

    <script src="AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="public/js/xadmin.js"></script>


    <script type="text/javascript" src="js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
    <script type="text/javascript" src="js/fkjava_timer.js"></script>
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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong></div>
                </div>
                <hr/>
                <!--订单信息-->
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th>
                            <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
                        </th>
                        <th>订单编号</th>
                        <th>商品名称</th>
                        <th>图片</th>
                        <th>数量</th>
                        <th>金额</th>
                        <th>收货地址</th>
                        <th>收货人</th>
                        <th>收货人电话</th>
                        <th>寄件人电话</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.orders}" var="list" varStatus="num">
                        <tr>
                            <td>
                                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                            </td>
                            <td>${list.orderId}</td>
                            <td>${list.shopping_name}</td>
                            <td><img src="${list.photo}"></td>
                            <td>${list.num}</td>
                            <td>${list.money}</td>
                            <td>${list.revceiving_address}</td>
                            <td>${list.revceiving_name}</td>
                            <td>${list.revceiving_phone}</td>
                            <td>${list.send_phone}</td>
                            <td class="td-manage">
                                <a title="编辑"  href='order/edit?order_id=${list.order_id}'>
                                    <i class="layui-icon">&#xe642;</i>
                                </a>
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