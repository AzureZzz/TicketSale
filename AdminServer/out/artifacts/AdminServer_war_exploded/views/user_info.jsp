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
                        <li class="active">用户管理</li>
                        <li class="active">密码修改</li>
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
                        <li class="active panel panel-default dropdown">
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
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header">用户列表</div>
                            <div class="layui-card-body">
                                <div class="demoTable">
                                    搜索用户名：
                                    <div class="layui-inline">
                                        <input class="layui-input" name="id" id="late_reload" autocomplete="off">
                                    </div>
                                    <button class="layui-btn" data-type="reload">搜索</button>
                                </div>
                                <table class="layui-hide" id="test" lay-filter="user_filter"></table>
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

<div id="alter_pass" style="height: 220px;padding: 30px;display: none">
    <form class="layui-form" id="pass_form">
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

<!-- JS-Libs  -->
<script src="../views/js/jquery-3.3.1.min.js"></script>
<script src="../views/layui/lay/modules/layer.js"></script>
<script src="../views/layui/layui.js" charset="utf-8"></script>
<script src="../views/js/bootstrap.min.js"></script>
<script src="../views/js/main.js"></script>
<script type="text/html" id="toolbar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改密码</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除用户</a>
</script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table,
            $ = layui.jquery,
            form = layui.form;

        $('.close_frame').click(function () {
            layer.closeAll();
        });

        form.on('submit(save_pass)', function (datas) {

            layer.msg('修改成功！', {icon: 1});

            return false;
        });

        table.render({
            elem: '#test'
            ,url:'/userbase/info'
            ,cellMinWidth: 80
            ,cols: [[
                {field:'username', title:'用户名', unresize: true, sort: true}
                ,{field:'userType', title:'用户类型', width:100, unresize: true, sort: true}
                ,{field:'realName', title:'真实姓名', width:100, unresize: true, sort: true}
                ,{field:'idCardType', title:'证件类型',  unresize: true, sort: true}
                ,{field:'idCard', title:'证件号', unresize: true, sort: true}
                ,{field:'email', title:'邮箱'}
                ,{field:'phoneNumber', title:'手机号'}
                ,{fixed: 'right', width:200, align:'center', toolbar: '#toolbar'}
            ]]
            ,page: true
            ,id:'user_table'
            ,where:{
                keyWord:null
            }
        });
        //监听工具条
        table.on('tool(user_filter)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.msg('ID：'+ data.ltId + ' 的查看操作');

            } else if(obj.event === 'del'){
                layer.confirm('确认删除该用户？', function(index){
                    $.ajax({
                        url: "/userbase/"+data.uId,
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
                layer.open({
                    type: 1
                    ,title: ['修改密码']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#alter_pass')
                });
            }
        });

        var $ = layui.$, active = {
            delAll: function(){ //获取选中数据
                var checkStatus = table.checkStatus('user_table')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            },
            add_late:function () {
                layer.open({
                    type: 1,
                    skin: 'layui-layer-rim', //加上边框
                    area: ['420px', '240px'], //宽高
                    content: 'html内容'
                });
            },
            reload: function(){
                var lateReload = $('#late_reload');
                table.reload('user_table', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        keyWord: lateReload.val()
                    }
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //自定义验证规则
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });
    });
</script>
</body>
</html>

