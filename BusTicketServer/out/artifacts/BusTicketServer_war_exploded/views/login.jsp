
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="trainURL" var="trainURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />
<html>

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="../views/css/login_register.css" />
    <link rel="stylesheet" type="text/css" href="../views/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../views/layui/css/layui.css" />
</head>

<body>
<div class="container-fluid">
    <div id="long_header">
        <div class="nav_longer">
            <div class="nav_wrap w1200">
                <div class="logo">
                    <h1>
                        <a href="/index">
                            购票系统
                        </a>
                    </h1>
                </div>
                <div class="head_title">
                    <h2>
                        登录页面
                    </h2>
                </div>

            </div>
        </div>
    </div>
</div>

<div class="row" style="margin-top: 60px;">
    <div class="col-md-offset-2 col-md-4">
        <div class="reg_left">
            <form class="layui-form">
                <div class="layui-form-item">
                    <label class="layui-form-label" for="username">用户名</label>
                    <div class="layui-input-block">
                        <input id="username" type="text" name="username" required lay-verify="user" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" for="password">密码</label>
                    <div class="layui-input-block">
                        <input id="password" type="password" name="password" required lay-verify="pass" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" for="code">验证码</label>
                        <div class="layui-input-block" style="width: 135px">
                            <input id="code"  type="text" name="code" required lay-verify="code" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-pane" style="float: right;">
                            <img id="code_img" src="/code" alt="" />
                        </div>
                    </div>
                </div>
                <div class="layui-form-item layui-col-md-offset3">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="login">登录</button>
                        <button id="to_signup" class="layui-btn" onclick="return false;">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-md-4" >
        <img src="../views/images/train1.jpg" width="90%" height="45%"/>
    </div>
</div>
    <script type="text/javascript" src="../views/layui/layui.js"></script>
    <script type="text/javascript" src="../views/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $('#code_img').click(function () {
                var timestamp = new Date().getTime();
                $('#code_img').attr('src', '/code'+ '?' +timestamp );
                $('#code').val('');
            });
            $('#to_signup').click(function () {
                window.location.href = '/signup';
            });
        });
    </script>
    <script>
        layui.use('form', function() {
            var form = layui.form;

            form.verify({
                user: function(value) {
                    if(value.length <= 0) {
                        return '用户名不能为空';
                    }
                },
                pass: [/(.+){6,12}$/, '密码必须6到12位'],
                code: function(value) {
                    if(value.length <= 0) {
                        return '验证码不能为空';
                    }
                }
            });

            form.on('submit(login)', function (datas) {
                var data=datas.field;
                $.ajax({
                    url: "login",
                    type:"post",
                    data:JSON.stringify(data),
                    dataType:'json',
                    contentType: 'application/json',
                    success:function (data) {
                        if(data.err!=null){
                            layer.msg(data.err, {icon: 2});
                            var timestamp = new Date().getTime();
                            $('#code_img').attr('src', '/code'+ '?' +timestamp );
                            $('#code').val('');
                        }else{
                            layer.msg('登陆成功！', {icon: 1});
                            setTimeout(function (){window.location.href='index'},1000);
                        }
                    }
                });
                return false;
            });
        });
    </script>
    </body>

</html>
