
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
                <li class="layui-nav-item">
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
                <li class="layui-nav-item layui-nav-itemed">
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
                <font size="5">我的安全</font>
            </div>
            <div style="margin-top: 50px;">
                <table class="layui-table" lay-even="" lay-skin="nob">
                    <colgroup>
                        <col width="150">
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>
                            <label>登录密码：</label>
                        </td>
                        <td>***********</td>
                        <td>
                            <div id="alterPass_btn">
                                <button data-method="newpass" class="layui-btn layui-btn-danger">修改</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>支付密码：</label>
                        </td>
                        <td>***********</td>
                        <td>
                            <div id="alterPayPass_btn">
                                <button data-method="newpaypass" class="layui-btn layui-btn-danger">修改</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>手机号码</label>
                        </td>
                        <td>${userBase.phoneNumber}</td>
                        <td>
                            <div id="alterPhone_btn">
                                <button data-method="newphone" class="layui-btn layui-btn-danger">修改</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>邮箱</label>
                        </td>
                        <td>${userBase.email}</td>
                        <td>
                            <div id="alterEmail_btn">
                                <button data-method="newemail" class="layui-btn layui-btn-danger">修改</button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>

<div id="alter_pass" style="height: 300px;padding: 30px;display: none">
    <form class="layui-form" id="pass_form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">原密码</label>
            <div class="layui-input-block">
                <input id="password" type="password" name="password" required lay-verify="password" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">新密码</label>
            <div class="layui-input-block">
                <input id="newpassword" name="newPassword" type="password" required lay-verify="newpassword" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">确认密码</label>
            <div class="layui-input-block">
                <input type="password" name="repassword" required lay-verify="repassword" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="save_pass" type="button" lay-submit="" lay-filter="save_pass" class="layui-btn" value="修改"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<div id="alter_paypass" style="height: 300px;padding: 30px;display: none">
    <form class="layui-form" id="paypass_form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">原支付密码</label>
            <div class="layui-input-block">
                <input id="payPass" type="password" name="payPass" required lay-verify="password" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">新支付密码</label>
            <div class="layui-input-block">
                <input id="newPayPass" name="newPayPass" type="password" required lay-verify="newpassword" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">确认支付密码</label>
            <div class="layui-input-block">
                <input type="password" name="rePayPass" required lay-verify="rePayPass" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="save_paypass" type="button" lay-submit="" lay-filter="save_paypass" class="layui-btn" value="修改"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<div id="alter_phone" style="height: 150px;padding: 30px;display: none">
    <form class="layui-form" id="phone_form">
        <div class="layui-form-item" >
            <label class="layui-form-label" style="width: 100px;">新手机号码</label>
            <div class="layui-input-block">
                <input id="newphone" name="phoneNumber" type="text" value="${userBase.phoneNumber}" required lay-verify="phone" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="save_phone" type="button" lay-submit="" lay-filter="save_phone" class="layui-btn" value="保存"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>


<div id="alter_email" style="height: 150px;padding: 30px;display: none">
    <form class="layui-form" id="email_form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">新邮箱</label>
            <div class="layui-input-block">
                <input id="newemail" name="email" type="text" value="${userBase.email}" required lay-verify="email" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="save_email" type="button" lay-submit="" lay-filter="save_email" class="layui-btn" value="保存"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use(['element',  'layer','form'], function() {
        var element = layui.element,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        $('.close_frame').click(function () {
            layer.closeAll();
        });

        form.verify({
            password: function (value) {
                if (value.length <= 0) {
                    return '原密码不能为空';
                }
            },
            newpassword: [/(.+){6,12}$/, '密码必须6到12位'],
            repassword:function (value) {
                var password = $('#newpassword').val();
                if (value != password) {
                    return '两次密码不一致';
                }
            }

        });

        form.on('submit(save_pass)', function (datas) {
            if(datas.field.password == datas.field.newPassword){
                layer.msg("与原密码相同", {icon: 2});
            }else{
                var data={
                    "password":datas.field.password,
                    "newPassword":datas.field.newPassword
                };

                $.ajax({
                    url:'modifypassword',
                    type:'PUT',
                    data:JSON.stringify(data),
                    dataType:'json',
                    contentType: 'application/json',
                    success:function (data) {
                        if(data.err!=null){
                            layer.msg(data.err, {icon: 2});
                        }else{
                            layer.closeAll();
                            layer.msg(data.msg, {icon: 1});
                            $("#pass_form")[0].reset();     //重置表单
                        }
                    }
                });
            }

            return false;
        });

        form.on('submit(save_paypass)', function (datas) {
            if(datas.field.payPass == datas.field.newPayPass){
                layer.msg("与原密码相同", {icon: 2});
            }else{
                var data={
                    "payPass":datas.field.payPass,
                    "newPayPass":datas.field.newPayPass
                };

                $.ajax({
                    url:'modifypaypass',
                    type:'PUT',
                    data:JSON.stringify(data),
                    dataType:'json',
                    contentType: 'application/json',
                    success:function (data) {
                        if(data.err!=null){
                            layer.msg(data.err, {icon: 2});
                        }else{
                            layer.closeAll();
                            layer.msg(data.msg, {icon: 1});
                            $("#pass_form")[0].reset();     //重置表单
                        }
                    }
                });
            }

            return false;
        });

        form.on('submit(save_phone)', function (datas) {
            var data=datas.field;
            $.ajax({
                url:'modifyBaseInfo',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        layer.msg(data.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        form.on('submit(save_email)', function (datas) {
            var data=datas.field;
            $.ajax({
                url:'modifyBaseInfo',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        layer.msg(data.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        var active = {
            newpass: function(){
                layer.open({
                    type: 1
                    ,title: ['修改密码']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro'
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#alter_pass')
                });
            }
            ,newpaypass: function(){
                layer.open({
                    type: 1
                    ,title: ['修改支付密码']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1
                    ,content:  $('#alter_paypass')
                });
            }
            ,newphone:function () {
                layer.open({
                    type: 1
                    ,title: ['修改手机号']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#alter_phone')
                });
            }
            ,newemail:function () {
                layer.open({
                    type: 1
                    ,title: ['修改邮箱']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#alter_email')
                });
            }

        };
        $('#alterPass_btn .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#alterPayPass_btn .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#alterPhone_btn .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#alterEmail_btn .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        element.on('nav(left_navagation)', function(elem) {
            layer.msg(elem.text());
        });

    });
</script>
</body>
</html>
