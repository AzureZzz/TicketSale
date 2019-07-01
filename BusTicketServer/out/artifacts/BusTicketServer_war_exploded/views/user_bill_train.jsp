
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="trainURL" var="trainURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人信息管理</title>
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/bootstrap-datepicker3.css">
    <link rel="stylesheet" type="text/css" href="../views/layui/css/layui.css" />

</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">用户后台界面</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item">
                <a href="/index">首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">车票预订</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="${trainURL}/trainTicket">火车票预订</a>
                    </dd>
                    <dd>
                        <a href="/busTicket">汽车票预订</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    ${userBase.realName}
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="/userInfo">基本资料</a>
                    </dd>
                    <dd>
                        <a href="/userSafe">安全设置</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="/logout">退出</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">订单管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/userBusBill">汽车票订单</a>
                        </dd>
                        <dd>
                            <a href="/userTrainBill">火车票订单</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">信息管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/userInfo">我的信息</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">安全管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/userSafe">我的安全</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">联系人管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/userPassenger">我的联系人</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">

        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <div class="layui-show-xs-block">
                <font size="5">火车票订单</font>
            </div>
            <div style="margin-top: 50px;">
                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this">未完成订单</li>
                        <li>已完成订单</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <table id="unFinish_train" lay-filter="unfinish_train"></table>
                        </div>
                        <div class="layui-tab-item">
                            <table id="finish_train" lay-filter="finish_train"></table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-footer">

    </div>
</div>

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script type="text/javascript" src="../views/js/utils.js"></script>

<script type="text/html" id="unfinish_op">
    <button class="layui-btn" lay-event="pay_btn">支付</button>
    <button class="layui-btn layui-btn-danger" lay-event="del">退票</button>
</script>
<script type="text/html" id="finish_op">
    <button class="layui-btn" lay-event="change_btn">改签</button>
    <button class="layui-btn layui-btn-danger" lay-event="del">退票</button>
</script>
<script>
    layui.use(['element','table','layer','form'], function() {
        var element = layui.element,
            table = layui.table,
            $ =layui.jquery,
            layer = layui.layer,
            form = layui.form;

        element.on('nav(left_navagation)', function(elem) {
            layer.msg(elem.text());
        });

        $('.close_frame').click(function () {
            layer.closeAll();
        });

        table.render({
            elem: '#unFinish_train'
            ,url:'trainbills/0'
            ,cellMinWidth: 40 //全局定义常规单元格的最小宽度
            ,size:'lg'
            ,cols: [[
                {title: '车次信息',width:220, unresize:true,align:'center',templet: function(d){
                        return new Date(d.trainSeat.trainTicket.goOff).Format("yyyy-MM-dd HH:mm")+'开<br>' +
                            d.trainSeat.trainTicket.trainNum.trainNo+'<br>'+
                            d.trainSeat.trainTicket.startStation+'-'+
                            d.trainSeat.trainTicket.desStation;
                    }}
                ,{title: '座位信息',unresize:true,align:'center',templet: function(d){
                        return d.trainSeat.seatNo+'<br>' + d.trainSeat.seatType;
                    }}
                ,{title: '旅客信息',unresize:true,align:'center',templet: function(d){
                        return d.passenger.realName+'<br>' +d.passenger.idCardType;
                    }}
                ,{title: '票款金额',unresize:true,align:'center',templet: function(d){
                        if(d.type=='成人'){
                            return d.type+'票<br>' + d.trainSeat.piece+'元';
                        }else{
                            return d.type+'票<br>' + d.trainSeat.piece/2+'元';
                        }
                    }}
                ,{title: '车票状态',unresize: true,align:'center',templet: function(d){
                        return '未支付';
                    }}
                ,{title: '操作', unresize:true,align:'center',templet: '#unfinish_op', unresize: true}
            ]]
            ,id:'unfinish_table'
        });

        table.render({
            elem: '#finish_train'
            ,url:'trainbills/1'
            ,cellMinWidth: 40
            ,size:'lg'
            ,cols: [[
                {title: '车次信息',width:220, unresize:true,align:'center',templet: function(d){
                        return new Date(d.trainSeat.trainTicket.goOff).Format("yyyy-MM-dd HH:mm")+'开<br>' +
                            d.trainSeat.trainTicket.trainNum.trainNo+'<br>'+
                            d.trainSeat.trainTicket.startStation+'-'+
                            d.trainSeat.trainTicket.desStation;
                    }}
                ,{title: '座位信息',unresize:true,align:'center',templet: function(d){
                        return d.trainSeat.seatNo+'<br>' + d.trainSeat.seatType;
                    }}
                ,{title: '旅客信息',unresize:true,align:'center',templet: function(d){
                        return d.passenger.realName+'<br>' +d.passenger.idCardType;
                    }}
                ,{title: '票款金额',unresize:true,align:'center',templet: function(d){
                    if(d.type=='成人'){
                        return d.type+'票<br>' + d.trainSeat.piece+'元';
                    }else{
                        return d.type+'票<br>' + d.trainSeat.piece/2+'元';
                    }
                }}
                ,{title: '车票状态',unresize: true,align:'center',templet: function(d){
                        return '已支付';
                    }}
                ,{title: '操作', unresize:true,align:'center',templet: '#finish_op', unresize: true}
            ]]
            ,id:'finish_table'
        });

        table.on('tool(finish_train)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确认退票？', function(index){
                    $.ajax({
                        url: '${billURL}/trainbill/' + data.tbId,
                        type: 'DELETE',
                        xhrFields: {
                            withCredentials: true
                        },
                        crossDomain: true,
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (data) {
                            if (data.err != null) {
                                layer.msg(data.err, {icon: 2});
                            } else {
                                layer.msg(data.msg, {icon: 1});
                                obj.del();
                                layer.close(index);
                            }
                        }
                    });
                });
            } else if(obj.event === 'change_btn'){
                window.location.replace('http://localhost:8081/changeTrainTicket?tbId='+data.tbId);
                // window.location.href='http://localhost:8081/changeTrainTicket?tbId='+data.tbId;
            }
        });

        table.on('tool(unfinish_train)', function(obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('确认退票？', function (index) {
                    $.ajax({
                        url: '${billURL}/trainbill/' + data.tbId,
                        type: 'DELETE',
                        xhrFields: {
                            withCredentials: true
                        },
                        crossDomain: true,
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (data) {
                            if (data.err != null) {
                                layer.msg(data.err, {icon: 2});
                            } else {
                                layer.msg(data.msg, {icon: 1});
                                obj.del();
                                layer.close(index);
                            }
                        }
                    });
                });
            } else if (obj.event === 'pay_btn') {
                if(data.billType == '学生'){
                    $('#pay_piece').val(data.trainSeat.piece/2);
                }else{
                    $('#pay_piece').val(data.trainSeat.piece);
                }
                $('#tbId').val(data.tbId);
                layer.open({
                    type: 1
                    ,title: ['确认支付']
                    ,closeBtn: false
                    ,area: ['400px','240px']
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1
                    ,content:  $('#pay_alert')
                });
            }
        });
        form.on('submit(pay_btn)', function (datas) {
            var data={
                "tbId":datas.field.tbId,
                "payPass":datas.field.payPass
            };
            $.ajax({
                url: "${billURL}/trainbill",
                type: 'PUT',
                data:JSON.stringify(data),
                contentType: 'application/json',
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                dataType:'json',
                success: function(res){
                    if(res.err != null){
                        layer.msg(res.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('finish_table',{});
                        table.reload('unfinish_table',{});
                        layer.msg(res.msg, {icon: 1});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>

<div id="pay_alert" style="height: 190px;padding: 20px;display: none">
    <form class="layui-form">
        <input id="tbId" class="hidden" name="tbId" value="">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">支付金额</label>
            <div class="layui-input-block">
                <input id="pay_piece" disabled type="text" lay-verify="required " autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">支付密码</label>
            <div class="layui-input-block">
                <input id="payPass" name="payPass" type="password" lay-verify="required " autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item float-right">
            <div class="layui-input-block">
                <input type="button" lay-submit="" lay-filter="pay_btn" class="layui-btn" value="支付"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>
</html>
