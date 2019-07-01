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
                        <li class="active">车票管理</li>
                        <li class="active">汽车票</li>
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
                                                    <%--搜索指定车站：--%>
                                                    <%--<div class="layui-inline">--%>
                                                        <%--<input class="layui-input" name="id" id="bus_reload" autocomplete="off">--%>
                                                    <%--</div>--%>
                                                    <%--<button class="layui-btn" data-type="reload">搜索</button>--%>
                                                <%--</div>--%>
                                                <table class="layui-hide" id="test" lay-filter="bus_filter"></table>
                                            </div>
                                            <div class="layui-tab-item">
                                                <%--<div class="demoTable">--%>
                                                    <%--搜索指定车站：--%>
                                                    <%--<div class="layui-inline">--%>
                                                        <%--<input class="layui-input" name="id" id="bus_reload2" autocomplete="off">--%>
                                                    <%--</div>--%>
                                                    <%--<button class="layui-btn" data-type="reload2">搜索</button>--%>
                                                <%--</div>--%>
                                                <table class="layui-hide" id="test2" lay-filter="bus_filter2"></table>
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
                                                    <i class="icon fa fa-tags fa-4x"></i>
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
                                        <button class="layui-btn layui-btn-fluid" data-type="add_bus_tickets">批量添加车票</button>
                                    </div>
                                    <div class="col-lg-6">
                                        <a href="/download/1"><button class="layui-btn layui-btn-warm layui-btn-fluid" href="/download/1">导出销售数据</button></a>
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

<div id="new_bus_tickets" style="height: 200px;padding: 30px;display: none">
    <form class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">车次</label>
            <div class="layui-input-block">
                <input id="numNo1" name="numNo" type="text" required lay-verify="newpassword" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-block">
                <input id="count" name="count" type="text" required lay-verify="newpassword" autocomplete="off"
                       class="layui-input">
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

<div id="update_bus_ticket" style="height: 200px;padding: 30px;display: none">
    <form class="layui-form">
        <input type="hidden" id="bsId" name="bsId" value="">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">座位号</label>
            <div class="layui-input-block">
                <input id="seatNo" name="seatNo" type="text" lay-verify="required " autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">车次</label>
            <div class="layui-input-block">
                <input id="numNo" name="numNo" type="text" lay-verify="required " autocomplete="off" class="layui-input">
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
            <td>价格</td>
            <td id="u_piece"> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td id="u_numNo"> </td>
            <td>车型</td>
            <td id="u_type"> </td>
        </tr>
        </tbody>
    </table>
    <div class="layui-form-item float-right">
        <div class="layui-input-block">
            <input type="button" class="layui-btn close_frame" value="确认"/>
        </div>
    </div>
</div>

<div id="ticket_info_sale" class="layui-form" style="height: 220px;padding: 30px;display: none" >
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
            <td>价格</td>
            <td id="s_piece"> </td>
        </tr>
        <tr>
            <td>车次</td>
            <td id="s_numNo"> </td>
            <td>车型</td>
            <td id="s_type"> </td>
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
            elem: '#test'
            ,url:'/busTicket/remain'
            ,cellMinWidth: 80
            ,cols: [[
                {type: 'checkbox'}
                ,{field:'numNo', width:80,title:'车次'}
                ,{field:'startStation', title:'出发站', unresize: true}
                ,{field:'desStation', title:'到达站', unresize: true}
                ,{title:'出发时间',width:150,templet: function(d){
                        return new Date(d.goOff).Format("MM月dd日 HH:mm");
                    }}
                ,{field:'busType', title:'车型',sort:true}
                ,{field:'piece',width:80, title: '价格', sort: true}
                ,{field:'seatNo', width:80,title: '座位号', sort: true}
                ,{fixed: 'right', width:178, align:'center', toolbar: '#toolbar'}
            ]]
            ,page: true
            ,id:'bus_ticket_remain'
        });
        table.render({
            elem: '#test2'
            ,url:'/busTicket/sale'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'numNo', width:80,title:'车次'}
                ,{field:'startStation', title:'出发站', unresize: true, sort: true}
                ,{field:'desStation', title:'到达站', unresize: true, sort: true}
                ,{title:'出发时间',width:150,templet: function(d){
                        return new Date(d.goOff).Format("MM月dd日 HH:mm");
                    }}
                ,{field:'busType', title:'车型',sort:true}
                ,{field:'piece', width:80,title: '价格',sort: true}
                ,{field:'seatNo', width:80,title: '座位号',sort: true}
                ,{fixed: 'right', width:100, align:'center', toolbar: '#toolbar2'}
            ]]
            ,page: true
            ,id:'bus_ticket_sale'
        });
        
        table.on('tool(bus_filter)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                $('#u_start').html(data.startStation);
                $('#u_des').html(data.desStation);
                $('#u_type').html(data.busType);
                $('#u_goOff').html(new Date(data.goOff).Format("yyyy-MM-dd HH:mm:ss"));
                $('#u_piece').html(data.piece);
                $('#u_numNo').html(data.numNo);
                layer.open({
                    type: 1
                    ,title: ['车票详情']
                    ,closeBtn: false
                    ,area:['700px', '280px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#ticket_info')
                });
            } else if(obj.event === 'del'){
                layer.confirm('是否删除该车票？', function(index){
                    // alert(JSON.stringify(data))
                    $.ajax({
                        url: "/busTicket/remain/"+data.bsId,
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
                $('#bsId').val(data.bsId);
                $('#seatNo').val(data.seatNo);
                $('#numNo').val(data.numNo);
                layer.open({
                    type: 1
                    ,title: ['修改汽车票']
                    ,closeBtn: false
                    ,area:['400px', '280px']
                    ,shade: 0.8
                    ,id: 'LAY_layuipro1'
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#update_bus_ticket')
                });
            }
        });

        table.on('tool(bus_filter2)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail') {
                $.ajax({
                    url: "/buspassenger/"+data.bsId,
                    type: 'GET',
                    contentType: 'application/json',
                    dataType:'json',
                    success: function(res){
                        if(res.err != null){
                            layer.msg(res.err, {icon: 2});
                        }else{
                            $('#s_start').html(data.startStation);
                            $('#s_des').html(data.desStation);
                            $('#s_type').html(data.busType);
                            $('#s_goOff').html(new Date(data.goOff).Format("yyyy-MM-dd HH:mm:ss"));
                            $('#s_piece').html(data.piece);
                            $('#s_numNo').html(data.numNo);
                            $('#s_name').html(res.passenger.realName);
                            $('#s_idCard').html(res.passenger.idCard);
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
                    }
                });
            }
        });

        //提交新增信息
        form.on('submit(add_tickets)', function (datas) {
            var data={
                "count":datas.field.count,
                "numNo":datas.field.numNo
            };
            $.ajax({
                url: "/busTicket/remain",
                type: 'POST',
                data:JSON.stringify(data),
                contentType: 'application/json',
                dataType:'json',
                success: function(res){
                    if(res.err != null){
                        layer.msg(res.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('bus_ticket_remain',{});
                        layer.msg(res.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        //提交更新信息
        form.on('submit(update_ticket)', function (datas) {
            var data={
                "seatNo":datas.field.seatNo,
                "bsId":datas.field.bsId,
                "numNo":datas.field.numNo
            };
            $.ajax({
                url: "/busTicket/remain",
                type: 'PUT',
                data:JSON.stringify(data),
                contentType: 'application/json',
                dataType:'json',
                success: function(res){
                    if(res.err != null){
                        layer.msg(res.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('bus_ticket_remain',{});
                        layer.msg(res.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        var $ = layui.$, active = {
            delAll: function(){ //获取选中数据
                var checkStatus = table.checkStatus('bus_ticket_remain')
                    ,datas = checkStatus.data;
                var ids = new Array(datas.length);
                datas.forEach(function(value,index,array){
                    ids[index] = value.bsId;
                });
                var data = {
                    "ids":ids
                };
                $.ajax({
                    url: "/busTicket/remain",
                    type: 'DELETE',
                    data:JSON.stringify(data),
                    contentType: 'application/json',
                    dataType:'json',
                    success: function(res){
                        if(res.err != null){
                            layer.msg(res.err, {icon: 2});
                        }else{
                            table.reload('bus_ticket_remain',{});
                            layer.closeAll();
                            layer.msg(res.msg, {icon: 1});
                        }
                    }
                });
            },
            add_bus_tickets:function () {
                layer.open({
                    type: 1
                    ,title: ['新增汽车票']
                    ,closeBtn: false
                    ,area:['400px', '280px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: $('#new_bus_tickets')
                });
            },
            reload: function(){
                var lateReload = $('#bus_reload');
                table.reload('bus_ticket_remain', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        keyWord: {
                            id: lateReload.val()
                        }
                    }
                });
            },
            reload2: function(){
                var lateReload = $('#bus_reload2');
                table.reload('bus_ticket_sale', {
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
</body>
</html>

