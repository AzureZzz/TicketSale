<%--
  Created by IntelliJ IDEA.
  User: 王涛
  Date: 2018/5/15
  Time: 18:48
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
                        <li class="active">车票管理</li>
                        <li class="active">火车票</li>
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
                        <li class="active panel panel-default dropdown">
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
            <div class="row-fluid" >
                <div class="col-md-9 col-lg-9">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <%--<div class="layui-card-header">卡片标题</div>--%>
                                <div class="layui-card-body">
                                    <div class="layui-tab">
                                        <ul class="layui-tab-title">
                                            <li class="layui-this">未出售</li>
                                            <li>已出售</li>
                                        </ul>
                                        <div class="layui-tab-content">
                                            <div class="layui-tab-item layui-show">
                                                <div class="layui-btn-group demoTable">
                                                    <button class="layui-btn" data-type="delAll">全部删除</button>
                                                </div>
                                                <%--<div class="demoTable float-right">--%>
                                                    <%--搜索ID：--%>
                                                    <%--<div class="layui-inline">--%>
                                                        <%--<input class="layui-input" name="id" id="train_reload" autocomplete="off">--%>
                                                    <%--</div>--%>
                                                    <%--<button class="layui-btn" data-type="reload">搜索</button>--%>
                                                <%--</div>--%>
                                                <table class="layui-hide" id="test" lay-filter="train_filter"></table>
                                            </div>
                                            <div class="layui-tab-item">

                                                <%--<div class="demoTable">--%>
                                                    <%--搜索ID：--%>
                                                    <%--<div class="layui-inline">--%>
                                                        <%--<input class="layui-input" name="id" id="train_reload2" autocomplete="off">--%>
                                                    <%--</div>--%>
                                                    <%--<button class="layui-btn" data-type="reload2">搜索</button>--%>
                                                <%--</div>--%>
                                                <table class="layui-hide" id="test2" lay-filter="train_filter2"></table>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                        <legend>票数管理</legend>
                    </fieldset>
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-body">
                                    <div>
                                        <a href="#">
                                            <div class="blue summary-inline">
                                                <div class="card-body">
                                                    <i class="icon fa fa-user fa-4x"></i>
                                                    <div class="content">
                                                        <div class="title">${remainCount}</div>
                                                        <div class="sub-title">剩余数量</div>
                                                    </div>
                                                    <div class="clear-both"></div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="layui-card">
                                <div>
                                    <div class="col-lg-6">
                                        <button class="layui-btn layui-btn-fluid" data-type="add_train_ticket">添加车票</button>
                                    </div>
                                    <div class="col-lg-6">
                                        <a href="/download/2"><button class="layui-btn layui-btn-warm layui-btn-fluid">导出销售数据</button></a>
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

<div id="new_train_tickets" style="height: 380px;padding: 30px;display: none">
    <form class="layui-form" id="new_form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">始发站</label>
                <div class="layui-input-block">
                    <input id="startStation" name="startStation" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">终点站</label>
                <div class="layui-input-block">
                    <input id="desStation" name="desStation" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">出发</label>
                <div class="layui-input-block">
                    <input id="goOff" name="goOff" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">到达</label>
                <div class="layui-input-block">
                    <input id="arriveTime" name="arriveTime" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">座位类型</label>
                <div class="layui-input-block" style="width: 150px">
                    <select name="seatType" lay-filter="seatType">
                        <option value="无座">无座</option>
                        <option value="硬座" selected="">硬座</option>
                        <option value="软座">软座</option>
                        <option value="硬卧">硬卧</option>
                        <option value="动卧">动卧</option>
                        <option value="软卧">软卧</option>
                        <option value="高级软卧">高级软卧</option>
                        <option value="二等座">二等座</option>
                        <option value="一等座">一等座</option>
                        <option value="特等座">特等座</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">车次</label>
                <div class="layui-input-block" style="width: 160px;">
                    <input id="trainNo" name="trainNo" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">价格</label>
                <div class="layui-input-block">
                    <input id="piece" name="piece" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 110px;">座位信息</label>
                <div class="layui-input-block">
                    <input id="seatNo" name="seatNo" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item float-right">
            <div class="layui-input-block">
                <input id="add_tickets" type="button" lay-submit="" lay-filter="add_tickets" class="layui-btn" value="添加"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<div id="update_train_ticket" style="height: 280px;padding: 30px;display: none">
    <form class="layui-form" id="update_form">
        <input type="hidden" id="tsId" name="tsId">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">始发站</label>
                <div class="layui-input-block">
                    <input id="startStation1" name="startStation" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">终点站</label>
                <div class="layui-input-block">
                    <input id="desStation1" name="desStation" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">出发</label>
                <div class="layui-input-block">
                    <input id="goOff1" name="goOff" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">到达</label>
                <div class="layui-input-block">
                    <input id="arriveTime1" name="arriveTime" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">车次</label>
            <div class="layui-input-block" style="width: 160px;">
                <input id="trainNo1" name="trainNo" type="text" required lay-verify="newpassword" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label" style="width: 100px;">座位类型</label>
                <div class="layui-input-block">
                    <select id="seatType1" name="seatType" lay-filter="seatType">
                        <option value="无座">无座</option>
                        <option value="硬座" selected="">硬座</option>
                        <option value="软座">软座</option>
                        <option value="硬卧">硬卧</option>
                        <option value="动卧">动卧</option>
                        <option value="软卧">软卧</option>
                        <option value="高级软卧">高级软卧</option>
                        <option value="二等座">二等座</option>
                        <option value="一等座">一等座</option>
                        <option value="特等座">特等座</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">价格</label>
                <div class="layui-input-block">
                    <input id="piece1" name="piece" type="text" required lay-verify="newpassword" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item float-right">
            <div class="layui-input-block">
                <input id="update_ticket" type="button" lay-submit="" lay-filter="update_ticket" class="layui-btn" value="修改"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<div id="ticket_info" class="layui-form" style="height: 250px;padding: 30px;display: none" >
    <table class="layui-table" lay-even="" lay-skin="nob" >
        <tbody>
        <tr>
            <td>始发站</td>
            <td id="u_start"> </td>
            <td>终点站</td>
            <td id="u_des"> </td>
        </tr>
        <tr>
            <td>出发时间</td>
            <td id="u_goOff"> </td>
            <td>到达时间</td>
            <td id="u_arrive"> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td id="u_trainNo"> </td>
        </tr>
        <tr>
            <td>座位类型</td>
            <td id="u_seatType"> </td>
            <td>价格</td>
            <td id="u_piece"> </td>
        </tr>
        </tbody>
    </table>
    <div class="layui-form-item float-right">
        <div class="layui-input-block">
            <input type="button" class="layui-btn close_frame" value="确认"/>
        </div>
    </div>
</div>

<div id="ticket_info_sale" class="layui-form" style="height: 250px;padding: 30px;display: none" >
    <table class="layui-table" lay-even="" lay-skin="nob" >
        <tbody>
        <tr>
            <td>始发站</td>
            <td id="s_start"> </td>
            <td>终点站</td>
            <td id="s_des"> </td>
        </tr>
        <tr>
            <td>出发时间</td>
            <td id="s_goOff"> </td>
            <td>到达时间</td>
            <td id="s_arrive"> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td id="s_trainNo"> </td>
        </tr>
        <tr>
            <td>座位类型</td>
            <td id="s_seatType"> </td>
            <td>价格</td>
            <td id="s_piece"> </td>
        </tr>
        <tr>
            <td>乘车人</td>
            <td id="s_name"> </td>
            <td>证件号</td>
            <td id="s_idCard"> </td>
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
<script src="../views/layui/layui.js" charset="utf-8"></script>
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/main.js"></script>
<script src="../views/js/utils.js"></script>

<script type="text/html" id="toolbar">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="toolbar2">
    <a class="layui-btn layui-btn-xs" lay-event="detail">查看详情</a>
</script>
<script>
    layui.use(['table','element','form','laydate'], function(){
        var table = layui.table,
            $ = layui.jquery,
            form = layui.form,
            laydate = layui.laydate,
            element = layui.element;

        laydate.render({
            elem: '#goOff'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#arriveTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#goOff1'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#arriveTime1'
            ,type: 'datetime'
        });

        $('.close_frame').click(function () {
            layer.closeAll();
        });

        table.render({
            elem: '#test2'
            ,url:'/trainTicket/sale'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'trainNo', width:80,title:'车次',  unresize: true}
                ,{field:'startStation', title:'出发站', unresize: true}
                ,{field:'desStation', title:'到达站', unresize: true}
                ,{title:'出发时间',width:150, templet: function(d){
                        return new Date(d.goOff).Format("MM月dd日 HH:mm");
                    }}
                ,{title:'到达时间',width:150, templet: function(d){
                        return new Date(d.arriveTime).Format("MM月dd日 HH:mm");
                    }}
                ,{field:'seatType', width:80,title: '座位类型'}
                ,{field:'piece', width:80,title: '价格'}
                ,{fixed: 'right', width:100, align:'center', toolbar: '#toolbar2'}
            ]]
            ,page: true
            ,id:'train_table'
        });

        table.render({
            elem: '#test'
            ,url:'/trainTicket/remain'
            ,cellMinWidth: 80
            ,cols: [[
                {type: 'checkbox'}
                ,{field:'trainNo', width:80,title:'车次', unresize: true}
                ,{field:'startStation', title:'出发站', unresize: true}
                ,{field:'desStation', title:'到达站', unresize: true}
                ,{title:'出发时间',width:150,templet: function(d){
                        return new Date(d.goOff).Format("MM月dd日 HH:mm");
                    }}
                ,{title:'到达时间',width:150, templet: function(d){
                        return new Date(d.arriveTime).Format("MM月dd日 HH:mm");
                    }}
                ,{field:'seatType', width:80,title: '座位类型'}
                ,{field:'piece', width:80,title: '价格'}
                ,{fixed: 'right', width:178, align:'center', toolbar: '#toolbar'}
            ]]
            ,page: true
            ,id:'train_table2'
        });

        table.on('tool(train_filter)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                $('#u_start').html(data.startStation);
                $('#u_des').html(data.desStation);
                $('#u_goOff').html(new Date(data.goOff).Format("yyyy-MM-dd HH:mm:ss"));
                $('#u_arrive').html(new Date(data.arriveTime).Format("yyyy-MM-dd HH:mm:ss"));
                $('#u_trainNo').html(data.trainNo);
                $('#u_seatType').html(data.seatType);
                $('#u_piece').html(data.piece);
                layer.open({
                    type: 1
                    ,title: ['车票详情']
                    ,closeBtn: false
                    ,area:['700px', '300px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#ticket_info')
                });
            } else if(obj.event === 'del'){
                layer.confirm('是否删除该车票？', function(index){
                    $.ajax({
                        url: "/trainTicket/remain/"+data.tsId,
                        type: 'DELETE',
                        contentType: 'application/json',
                        dataType:'json',
                        success: function(res){
                            if(res.err != null){
                                layer.msg(res.err, {icon: 2});
                            }else{
                                obj.del();
                                layer.closeAll();
                                layer.msg(res.msg, {icon: 1});
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                $('#tsId').val(data.tsId);
                $('#startStation1').val(data.startStation);
                $('#desStation1').val(data.desStation);
                $('#goOff1').val(new Date(data.goOff).Format("yyyy-MM-dd HH:mm:ss"));
                $('#arriveTime1').val(new Date(data.arriveTime).Format("yyyy-MM-dd HH:mm:ss"));
                $('#seatType1').val(data.seatType);
                $('#piece1').val(data.piece);
                $('#trainNo1').val(data.trainNo);
                layer.open({
                    type: 1
                    ,title: ['修改火车票']
                    ,closeBtn: false
                    ,area:['700px', '410px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#update_train_ticket')
                });
            }
        });
        table.on('tool(train_filter2)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                $.ajax({
                    url: "/trainpassenger/"+data.tsId,
                    type: 'GET',
                    contentType: 'application/json',
                    dataType:'json',
                    success: function(res){
                        if(res.err != null){
                            layer.msg(res.err, {icon: 2});
                        }else{
                            $('#s_start').html(data.startStation);
                            $('#s_des').html(data.desStation);
                            $('#s_goOff').html(new Date(data.goOff).Format("yyyy-MM-dd HH:mm:ss"));
                            $('#s_arrive').html(new Date(data.arriveTime).Format("yyyy-MM-dd HH:mm:ss"));
                            $('#s_trainNo').html(data.trainNo);
                            $('#s_seatType').html(data.seatType);
                            $('#s_piece').html(data.piece);
                            $('#s_name').html(res.passenger.realName);
                            $('#s_idCard').html(res.passenger.idCard);
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
                    }
                });
            }
        });

        //提交新增信息
        form.on('submit(add_tickets)', function (datas) {
            var data={
                "startStation":datas.field.startStation,
                "desStation":datas.field.desStation,
                "goOff":datas.field.goOff,
                "arriveTime":datas.field.arriveTime,
                "trainNo":datas.field.trainNo,
                "seatType":datas.field.seatType,
                "piece":datas.field.piece,
                "seatNo":datas.field.seatNo
            };
            $.ajax({
                url: "/trainTicket/remain",
                type: 'POST',
                data:JSON.stringify(data),
                contentType: 'application/json',
                dataType:'json',
                success: function(res){
                    if(res.err != null){
                        layer.msg(res.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('train_table2',{});
                        layer.msg(res.msg, {icon: 1});
                    }
                }
            });

            return false;
        });

        //提交更新信息
        form.on('submit(update_ticket)', function (datas) {
            var data={
                "tsId":datas.field.tsId,
                "seatType":datas.field.seatType,
                "startStation":datas.field.startStation,
                "desStation":datas.field.desStation,
                "goOff":datas.field.goOff,
                "arriveTime":datas.field.arriveTime,
                "piece":datas.field.piece,
                "trainNo":datas.field.trainNo
            };
            $.ajax({
                url: "/trainTicket/remain",
                type: 'PUT',
                data:JSON.stringify(data),
                contentType: 'application/json',
                dataType:'json',
                success: function(res){
                    if(res.err != null){
                        layer.msg(res.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('train_table2',{});
                        layer.msg(res.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        var $ = layui.$, active = {
            delAll: function(){ //获取选中数据
                var checkStatus = table.checkStatus('train_table2')
                    ,datas = checkStatus.data;
                var ids = new Array(datas.length);
                datas.forEach(function(value,index,array){
                    ids[index] = value.tsId;
                });
                var data = {
                    "ids":ids
                };
                $.ajax({
                    url: "/trainTicket/remain",
                    type: 'DELETE',
                    data:JSON.stringify(data),
                    contentType: 'application/json',
                    dataType:'json',
                    success: function(res){
                        if(res.err != null){
                            layer.msg(res.err, {icon: 2});
                        }else{
                            table.reload('train_table2',{});
                            layer.closeAll();
                            layer.msg(res.msg, {icon: 1});
                        }
                    }
                });
            },
            add_train_ticket:function () {
                layer.open({
                    type: 1
                    ,title: ['新增火车票']
                    ,closeBtn: false
                    ,area:['700px', '420px']
                    ,shade: 0.8
                    ,id: 'LAY_layuipro'
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#new_train_tickets')
                });
            },
            reload: function(){
                var lateReload = $('#train_reload');
                table.reload('train_table', {
                    page: {
                        curr: 1
                    }
                    ,where: {
                        keyWord: {
                            id: lateReload.val()
                        }
                    }
                });
            },
            reload2: function(){
                var lateReload = $('#train_reload2');
                table.reload('train_table2', {
                    page: {
                        curr: 1
                    }
                    ,where: {
                        keyWord: {
                            id: lateReload.val()
                        }
                    }
                });
            }
        };

        $(' .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>

