
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
                <li class="layui-nav-item">
                    <a href="javascript:;">安全管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/userSafe">我的安全</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
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
                <font size="5">我的联系人</font>
            </div>
            <div>
                <div style="padding: 20px;">
                    <div class="layui-btn-group demoTable">
                        <button class="layui-btn" data-type="add_passenger">+新增联系人</button>
                    </div>
                    <table id="myContacts"  lay-filter="myContacts"></table>
                </div>
            </div>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>

<div id="passenger_alert" style="height: 350px;padding: 30px;display: none">
    <form class="layui-form" id="passenger_form">
        <input id="p_id" name="pId" value="" type="hidden"/>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">姓名</label>
            <div class="layui-input-block">
                <input id="real_name" type="text" name="realName" required lay-verify="realNmae" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">证件类型</label>
            <div class="layui-input-block">
                <select id="id_card_type" name="idCardType" lay-filter="idCardType">
                    <option value="二代身份证">二代身份证</option>
                    <option value="港澳通行证">港澳通行证</option>
                    <option value="台湾通行证">台湾通行证</option>
                    <option value="护照">护照</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">证件号码</label>
            <div class="layui-input-block">
                <input id="id_card" type="text" name="idCard" required lay-verify="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">联系人类型</label>
            <div class="layui-input-block">
                <select id="p_type" name="pType" lay-filter="userType">
                    <option value="成人">成人</option>
                    <option value="学生">学生</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="save_passenger" type="button" lay-submit="" lay-filter="save_passenger" class="layui-btn" value="保存"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>


<div id="newpassenger_alert" style="height: 350px;padding: 30px;display: none">
    <form class="layui-form" id="newpassenger_form">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">姓名</label>
            <div class="layui-input-block">
                <input id="new_real_name" type="text" name="realName" required lay-verify="realNmae" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">证件类型</label>
            <div class="layui-input-block">
                <select id="new_id_card_type" name="idCardType" lay-filter="idCardType">
                    <option value="二代身份证">二代身份证</option>
                    <option value="港澳通行证">港澳通行证</option>
                    <option value="台湾通行证">台湾通行证</option>
                    <option value="护照">护照</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">证件号码</label>
            <div class="layui-input-block">
                <input id="new_id_card" type="text" name="idCard" required lay-verify="identity" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 100px;">联系人类型</label>
            <div class="layui-input-block">
                <select id="new_p_type" name="pType" lay-filter="userType">
                    <option value="成人">成人</option>
                    <option value="学生">学生</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
            <div class="layui-input-block">
                <input id="new_passenger" type="button" lay-submit="" lay-filter="new_passenger" class="layui-btn" value="保存"/>
                <input type="button" class="layui-btn layui-btn-danger close_frame" value="取消"/>
            </div>
        </div>
    </form>
</div>

<script type="text/html" id="ops">
    <button id="change_btn" class="layui-btn" lay-event="edit">修改</button>
    <button id="delete_btn" class="layui-btn layui-btn-danger" lay-event="del">删除</button>
</script>
<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use(['element','table','layer','form'], function() {
        var element = layui.element; 
        var table = layui.table;
        var $ =layui.jquery,
            layer = layui.layer,
            form = layui.form;
        //监听导航点击
        element.on('nav(left_navagation)', function(elem) {
            layer.msg(elem.text());
        });

        $('.close_frame').click(function () {
            layer.closeAll();
        });

        form.verify({
            realName:function (value) {
                if (value.length <= 0) {
                    return '姓名不能为空';
                }
            }
        });

        form.on('submit(new_passenger)', function (datas) {
            var data1=datas.field;
            $.ajax({
                url: 'http://idcard.market.alicloudapi.com/lianzhuo/idcard?cardno=' + datas.field.idCard + '&name=' + datas.field.realName,
                type: "GET",
                headers: {
                    'Authorization': 'APPCODE 360d7d3cb1244b66b3c2075c77cf03db'
                },
                dataType: 'json',
                contentType: 'application/json',
                success: function (data) {
                    if (data.resp.code != 0) {
                        layer.msg(data.resp.desc, {icon: 2});
                    } else {
                        $.ajax({
                            url:'passenger',
                            type:'POST',
                            data:JSON.stringify(data1),
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
                    }
                }
            });

            return false;
        });
        form.on('submit(save_passenger)', function (datas) {
            var data=datas.field;
            $.ajax({
                url:'/passenger',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.closeAll();
                        table.reload('passenger_table',{});
                        layer.msg(data.msg, {icon: 1});
                    }
                }
            });
            return false;
        });

        table.render({
            elem: '#myContacts'
            ,url:'/passengers'
            ,cellMinWidth: 40
            ,size:'lg'
            ,cols: [[
                {field:'realName', title: '姓名',align:'center'}
                ,{field:'idCardType', title: '证件类型',align:'center'}
                ,{field:'idCard', title: '证件号码',align:'center'}
                ,{field:'pType', title: '联系人类型',align:'center'}
                ,{field:'btn1', title: '操作',align:'center', templet: '#ops'}
            ]],
            id:'passenger_table'
        });

        var active = {
            add_passenger: function () {
                layer.open({
                    type: 1
                    ,title: ['新增联系人']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro'
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#newpassenger_alert')
                });
            }
        };

        table.on('tool(myContacts)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确认删除此联系人？', function(index){
                    $.ajax({
                        url:'/passenger/'+data.pId,
                        type:'DELETE',
                        data:JSON.stringify(data),
                        dataType:'json',
                        contentType: 'application/json',
                        success:function (data) {
                            if(data.err!=null){
                                layer.msg(data.err, {icon: 2});
                            }else{
                                layer.msg(data.msg, {icon: 1});
                                obj.del();
                                layer.close(index);
                            }
                        }
                    });
                });
            } else if(obj.event === 'edit'){
                $('#p_id').val(data.pId);
                $('#real_name').val(data.realName);
                $('#id_card_type').val(data.idCardType);
                $('#id_card').val(data.idCard);
                $('#p_type').val(data.pType);
                layer.open({
                    type: 1
                    ,title: ['编辑联系人信息']
                    ,closeBtn: false
                    ,area: '500px;'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro'
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content:  $('#passenger_alert')
                });
            }
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>

</html>
