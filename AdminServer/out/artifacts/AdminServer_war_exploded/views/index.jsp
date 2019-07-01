<%--
  Created by IntelliJ IDEA.
  User: 王涛
  Date: 2018/5/15
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                        <li class="active">总览</li>
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
                        <li class="active">
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
                        <%--<li class="panel panel-default dropdown">--%>
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
                <div class="row">
                    <div class="col-lg-8 col-md-8">
                        <div class="layui-row layui-col-space15">
                            <div>
                                <div class="layui-card">
                                    <div class="layui-card-header">数量统计</div>
                                    <div class="layui-card-body">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-3 col-xs-6">
                                                <a href="/user/info">
                                                    <div class="green summary-inline">
                                                        <div class="card-body">
                                                            <i class="icon fa fa-user fa-4x"></i>
                                                            <div class="content">
                                                                <div class="title">${userAllCount}</div>
                                                                <div class="sub-title">用户总数</div>
                                                            </div>
                                                            <div class="clear-both"></div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-6">
                                                <a href="/train/late">
                                                    <div class="blue summary-inline">
                                                        <div class="card-body">
                                                            <i class="icon fa fa-tags fa-4x"></i>
                                                            <div class="content">
                                                                <div class="title">${lateTrainAllCount}</div>
                                                                <div class="sub-title">火车晚点</div>
                                                            </div>
                                                            <div class="clear-both"></div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-6">
                                                <a href="/train/ticket">
                                                    <div class="red summary-inline">
                                                        <div class="card-body">
                                                            <i class="icon fa fa-train fa-4x"></i>
                                                            <div class="content">
                                                                <div class="title">${trainTicketAllCount}</div>
                                                                <div class="sub-title">火车票总数</div>
                                                            </div>
                                                            <div class="clear-both"></div>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-md-3 col-sm-3 col-xs-6">
                                                <a href="/bus/ticket">
                                                    <div class="yellow summary-inline">
                                                        <div class="card-body">
                                                            <i class="icon fa fa-bus fa-4x"></i>
                                                            <div class="content">
                                                                <div class="title">${busTicketAllCount}</div>
                                                                <div class="sub-title">汽车票总数</div>
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
                            <div class="col-lg-6 col-md-6">
                                <div class="layui-card">
                                    <div class="layui-card-body">
                                        <div class="row" style="padding: 10px">
                                            <canvas id="chart1" class="chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="layui-card">
                                    <div class="layui-card-body">
                                        <div class="row" style="padding: 10px">
                                            <canvas id="chart2" class="chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-12">
                                <div class="layui-row layui-col-space15">
                                    <div class="layui-col-md12">
                                        <div class="layui-card">
                                            <div class="layui-card-header">最新销售</div>
                                            <div class="layui-card-body">
                                                <div class="layui-tab">
                                                    <ul class="layui-tab-title">
                                                        <li class="layui-this">汽车票</li>
                                                        <li>火车票</li>
                                                    </ul>
                                                    <div class="layui-tab-content">
                                                        <div class="layui-tab-item layui-show">
                                                            <table class="layui-hide" id="bus" lay-filter="late_filter"></table>
                                                        </div>
                                                        <div class="layui-tab-item">
                                                            <table class="layui-hide" id="train" lay-filter="late_filter2"></table>
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
                    <div class="col-lg-4 col-md-4">
                        <div class="layui-row layui-col-space15">
                            <div class="layui-card">
                                <%--<div class="layui-card-header">卡片标题</div>--%>
                                <div class="layui-card-body">
                                    <div class="row" style="padding: 5%">
                                        <fieldset class="layui-elem-field layui-field-title">
                                            <legend>销售进度</legend>
                                        </fieldset>
                                        <h3>汽车票&nbsp<small>剩余${busReCount}张</small></h3><br/>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="${busReCount}" aria-valuemin="0" aria-valuemax="${busTicketAllCount}" style="width: 91%">
                                                <span class="sr-only"></span>
                                            </div>
                                        </div>
                                        <h3>火车票&nbsp<small>剩余${trainReCount}张</small></h3><br/>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${trainReCount}" aria-valuemin="0" aria-valuemax="${trainTicketAllCount}" style="width: 95%">
                                                <span class="sr-only"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-card">
                                <div class="layui-card-header">登陆日志</div>
                                <div class="layui-card-body">
                                    <div class="layui-form">
                                        <table class="layui-table">
                                            <tbody>
                                            <tr>
                                                <td>上次登陆时间</td>
                                                <td><fmt:formatDate value="${admin.log.lastLogin}" pattern="yyyy年MM月dd日 HH:mm:ss" /></td>
                                            </tr>
                                            <tr>
                                                <td>上次登陆IP</td>
                                                <td>${admin.log.ip}</td>
                                            </tr>
                                            <tr>
                                                <td>上次登陆地点</td>
                                                <td>${admin.log.lastSite}</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
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
                <form class="layui-form layui-form-pane">
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="old-password">原密码</label>
                        <div class="layui-input-inline">
                            <input id="old-password" type="password" name="old_password" lay-verify="oldpass" placeholder="请输入原密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="new-password">新密码</label>
                        <div class="layui-input-inline">
                            <input id="new-password" type="password" name="new_password" lay-verify="pass" placeholder="请输入新密码" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label" for="re-password">重复密码</label>
                        <div class="layui-input-inline">
                            <input id="re-password" type="password" name="re_password" lay-verify="repass" placeholder="请输入重复密码" autocomplete="off" class="layui-input">
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

<div id="ticket_info_bus" class="layui-form" style="height: 250px;padding: 30px;display: none" >
    <table class="layui-table" lay-even="" lay-skin="nob" >
        <tbody>
        <tr>
            <td>始发站</td>
            <td> </td>
            <td>终点站</td>
            <td> </td>
        </tr>
        <tr>
            <td>出发时间</td>
            <td> </td>
            <td>到达时间</td>
            <td> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td> </td>
            <td>车型</td>
            <td> </td>
        </tr>
        <tr>
            <td>乘车人</td>
            <td> </td>
            <td>证件号</td>
            <td> </td>
        </tr>
        </tbody>
    </table>
    <div class="layui-form-item float-right">
        <div class="layui-input-block">
            <input type="button" class="layui-btn close_frame" value="确认"/>
        </div>
    </div>
</div>

<div id="ticket_info_train" class="layui-form" style="height: 250px;padding: 30px;display: none" >
    <table class="layui-table" lay-even="" lay-skin="nob" >
        <tbody>
        <tr>
            <td>始发站</td>
            <td> </td>
            <td>终点站</td>
            <td> </td>
        </tr>
        <tr>
            <td>出发时间</td>
            <td> </td>
            <td>到达时间</td>
            <td> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td> </td>
            <td>车型</td>
            <td> </td>
        </tr>
        <tr>
            <td>座位类型</td>
            <td> </td>
            <td>价格</td>
            <td> </td>
        </tr>
        <tr>
            <td>乘车人</td>
            <td> </td>
            <td>证件号</td>
            <td> </td>
        </tr>
        </tbody>
    </table>
    <div class="layui-form-item float-right">
        <div class="layui-input-block">
            <input type="button" class="layui-btn close_frame" value="确认"/>
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
<script type="text/html" id="toolbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看详情</a>
</script>
<script>
    layui.use(['table','element','form'], function(){
        var table = layui.table,
            element = layui.element,
            $=layui.jquery,
            form = layui.form;

        table.render({
            elem: '#bus'
            ,url:'/busBill/today'
            ,cellMinWidth: 80
            ,cols: [[
                {title:'车次', width:100, unresize: true, sort: true,templet: function(d){
                        return d.busSeat.busNum.numNo;
                    }}
                ,{title:'出发站', width:100, unresize: true, sort: true,templet: function(d){
                        return d.busSeat.busNum.startStation;
                    }}
                ,{title:'到达站', width:100, unresize: true, sort: true,templet: function(d){
                        return d.busSeat.busNum.desStation;
                    }}
                ,{title:'乘客姓名',width:100, templet: function(d){
                        return d.passenger.realName;
                    }}
                ,{field:'billType', title:'票种',width:100}
                ,{title:'价格',width:100, templet: function(d){
                        return d.piece+'元';
                    }}
                ,{title:'出单时间',templet: function(d){
                        var date = new Date(d.buyTime);
                        return date.getMonth()+'月'+date.getDay()+'日'+date.getHours()+':'+date.getMinutes();
                    }}
                ,{field:'billNo', title:'出单号'}
                // ,{fixed: 'right', width:90, align:'center', toolbar: '#toolbar'}
            ]]
            ,page: true
            ,id:'today_bus_sale'
        });

        table.render({
            elem: '#train'
            ,url:'/trainBill/today'
            ,cellMinWidth: 80
            ,cols: [[
                {title:'车次', width:100, unresize: true, templet: function(d){
                        return d.trainSeat.trainTicket.trainNum.trainNo;
                    }}
                ,{title:'出发站', width:100, unresize: true, templet: function(d){
                        return d.trainSeat.trainTicket.startStation;
                    }}
                ,{title:'到达站', width:100, unresize: true, templet: function(d){
                        return d.trainSeat.trainTicket.desStation;
                    }}
                ,{title:'乘客姓名',width:100, templet: function(d){
                        return d.passenger.realName;
                    }}
                ,{title:'座位类型',width:100, templet: function(d){
                        return d.trainSeat.seatType;
                    }}
                ,{field:'type', title:'票种',width:100}
                ,{title:'价格',width:100, templet: function(d){
                        return d.trainSeat.piece+'元';
                    }}
                ,{title:'出单时间',templet: function(d){
                        var date = new Date(d.buyTime);
                        return date.getMonth()+'月'+date.getDay()+'日'+date.getHours()+':'+date.getMinutes();
                    }}
                ,{field:'tNo', title:'出单号'}
                // ,{fixed: 'right', width:90, align:'center', toolbar: '#toolbar'}
            ]]
            ,page: true
            ,id:'today_train_sale'
        });

        table.on('tool(late_filter)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                    type: 1
                    ,title: ['车票详情']
                    ,closeBtn: false
                    ,area:['700px', '300px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#ticket_info_sale')
                });
            }
        });

        table.on('tool(late_filter2)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                    type: 1
                    ,title: ['车票详情']
                    ,closeBtn: false
                    ,area:['700px', '320px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#ticket_info_sale')
                });
            }
        });

        var $ = layui.$, active = {
            reload: function(){
                var lateReload = $('#late_reload');
                table.reload('late_table', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        keyWord: {
                            id: lateReload.val()
                        }
                    }
                });
            }
        };

        $('.layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
<script>
    var randomScalingFactor = function() {
        return Math.round(Math.random() * 100);
    };
    window.chartColors = {
        red: 'rgb(255, 99, 132)',
        orange: 'rgb(255, 159, 64)',
        yellow: 'rgb(255, 205, 86)',
        green: 'rgb(75, 192, 192)',
        blue: 'rgb(54, 162, 235)',
        purple: 'rgb(153, 102, 255)',
        grey: 'rgb(201, 203, 207)'
    };
    $(function () {
        var chart1 = new Chart($('#chart1'), {
            type: 'line',
            data: {
                labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
                datasets: [{
                    label: '火车票',
                    backgroundColor: window.chartColors.red,
                    borderColor: window.chartColors.red,
                    data: ${trainBillSale},
                    // data:[7,6,5,4,3,2,1],
                    fill: false
                }, {
                    label: '汽车票',
                    fill: false,
                    backgroundColor: window.chartColors.blue,
                    borderColor: window.chartColors.blue,
                    data: ${busBillSale}
                    // data:[1,2,3,4,5,6,7]
                }]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: '过去一周销售曲线图'
                }
            }
        });
        var chart2 = new Chart($('#chart2'), {
            type: 'pie',
            data: {
                datasets: [{
                    data: ${saleScale},
                    // data:[198,276],
                    backgroundColor: [
                        window.chartColors.red,
                        window.chartColors.blue
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    '汽车票',
                    '火车票'
                ]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: '销售占比'
                }
            }
        });
    });
</script>
</body>
</html>

