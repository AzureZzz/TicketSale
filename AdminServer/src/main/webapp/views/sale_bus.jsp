<%--
  Created by IntelliJ IDEA.
  User: 王涛
  Date: 2018/5/15
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>售票管理系统</title>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0"/>
    <!-- CSS-Libs -->
    <link rel="stylesheet" href="../views/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/font-awesome.min.css">
    <link rel="stylesheet" href="../views/css/animate.min.css">
    <link rel="stylesheet" href="../views/layui/css/modules/layer/default/layer.css">
    <link rel="stylesheet" href="../views/layui/css/layui.css"  media="all">
    <link rel="stylesheet" href="../views/css/style.css">

</head>
<body>
<div class="app-container">
    <div class="row content-container">
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <div class="title">售票记录</div>
                        <div class="title">汽车票</div>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-times icon"></i>
                    </button>
                    <li class="dropdown profile">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">管理员<span
                                class="caret"></span></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li>
                                <div class="profile-info">
                                    <h4 class="username">${admin.username}</h4>
                                    <div class="btn-group margin-bottom-2x" style="margin-top: 10px" role="group">
                                        <button id="c_password" type="button" class="btn btn-default" data-toggle="modal" data-target="#passwordModal"><i class="fa fa-pencil"></i>修改密码</button>
                                        <button id="c_logout" type="button" class="btn btn-default"><i class="fa fa-sign-out"></i>退出</button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="side-menu sidebar-inverse">
            <nav class="navbar navbar-default" role="navigation">
                <div class="side-menu-container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="/index">
                            <div class="icon fa fa-shield"></div>
                            <div class="title">售票管理系统</div>
                        </a>
                        <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="/index">
                                <span class="icon fa fa-tachometer"></span><span class="title">总览</span>
                            </a>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-ticket">
                                <span class="icon fa fa-calendar-o"></span><span class="title">车票管理</span>
                            </a>
                            <div id="dropdown-ticket" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/bus/ticket">汽车票</a>
                                        </li>
                                        <li><a href="/train/ticket">火车票</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-train">
                                <span class="icon fa fa-bus"></span><span class="title">车次管理</span>
                            </a>
                            <div id="dropdown-train" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/bus/num">汽车车次</a>
                                        </li>
                                        <li><a href="/train/num">火车车次</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-user">
                                <span class="icon fa fa-user"></span><span class="title">用户管理</span>
                            </a>
                            <div id="dropdown-user" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/user/info">用户信息管理</a>
                                        </li>
                                        <li><a href="/user/ticket">用户购票信息查询</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <%--<li class="active panel panel-default dropdown">--%>
                            <%--<a data-toggle="collapse" href="#dropdown-sale">--%>
                                <%--<span class="icon fa fa-area-chart"></span><span class="title">销售记录</span>--%>
                            <%--</a>--%>
                            <%--<div id="dropdown-sale" class="panel-collapse collapse">--%>
                                <%--<div class="panel-body">--%>
                                    <%--<ul class="nav navbar-nav">--%>
                                        <%--<li><a href="/bus/sale">汽车票</a>--%>
                                        <%--</li>--%>
                                        <%--<li><a href="/train/sale">火车票</a>--%>
                                        <%--</li>--%>
                                    <%--</ul>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</li>--%>
                        <li>
                            <a href="/train/late">
                                <span class="icon fa fa-tags"></span><span class="title">火车晚点管理</span>
                            </a>
                        </li>
                        <li>
                            <a href="/stuAuth">
                                <span class="icon fa fa-id-card"></span><span class="title">学生认证管理</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <%--<div class="layui-card-header">卡片标题</div>--%>
                            <div class="layui-card-body">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a href="#">
                                            <div class="green summary-inline">
                                                <div class="card-body">
                                                    <i class="icon fa fa-user fa-4x"></i>
                                                    <div class="content">
                                                        <div class="title">50</div>
                                                        <div class="sub-title">近一周销售</div>
                                                    </div>
                                                    <div class="clear-both"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6">
                                        <a href="#">
                                            <div class="blue summary-inline">
                                                <div class="card-body">
                                                    <i class="icon fa fa-tags fa-4x"></i>
                                                    <div class="content">
                                                        <div class="title">11</div>
                                                        <div class="sub-title">今日销售</div>
                                                    </div>
                                                    <div class="clear-both"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md6">
                        <div class="layui-card">
                            <div class="layui-card-body">
                                <div class="row" style="padding: 10px">
                                    <canvas id="chart1" class="chart" style="margin-top: 30px"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer navbar-fixed-bottom " style="background: cadetblue">
        <div class="modal-footer" style="text-align: center; padding: 10px" >
            <span><small style="color: white">2018 @Copyright.</small></span>
        </div>
    </footer>
</div>

<!-- change-password-Modal-->
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <fieldset class="layui-elem-field layui-field-title" data-dismiss="modal" aria-label="Close" style="margin-top: 10px;">
                    <legend>修改密码</legend>
                </fieldset>
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="old-password">原密码</label>
                        <div class="layui-input-inline">
                            <input id="old-password" type="password" name="old-password" lay-verify="oldpass" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="new-password">新密码</label>
                        <div class="layui-input-inline">
                            <input id="new-password" type="password" name="new-password" lay-verify="pass" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="re-password">重复密码</label>
                        <div class="layui-input-inline">
                            <input id="re-password" type="password" name="re-password" lay-verify="repass" placeholder="请输入重复密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button id="mps_btn" class="layui-btn" lay-submit="" lay-filter="mps">修改</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- JS-Libs  -->
<script src="../views/js/jquery-3.3.1.min.js"></script>
<script src="../views/layui/lay/modules/layer.js"></script>
<script src="../views/layui/layui.js" charset="utf-8"></script>
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/Chart.js"></script>
<script src="../views/js/main.js"></script>
<script>
    $(function () {
        var chart1 = new Chart($("#chart1"), {
            type: 'line',
            data: {
                labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
                datasets: [{
                    label: '本人销售保单数量',
                    data: [5,4,3,7,2,5,6],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255,99,132,1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero:true
                        }
                    }]
                },
                title: {
                    display: true,
                    text: '本周销售统计'
                }
            }
        });
    });
</script>
</body>
</html>

