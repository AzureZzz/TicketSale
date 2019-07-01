
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
    <title>注册界面</title>

    <link rel="stylesheet" type="text/css" href="../views/css/login_register.css"/>
    <link rel="stylesheet" type="text/css" href="../views/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="../views/layui/css/layui.css"/>
</head>

<body>
    <div class="container-fluid">
        <div id="long_header">
            <div class="nav_longer">
                <div class="nav_wrap">
                    <div class="logo">
                        <h1>
                            <a href="/index">
                                购票系统
                            </a>
                        </h1>
                    </div>
                    <div class="head_title">
                        <h2>
                            注册页面
                        </h2>
                    </div>
                    <span class="exchange">
                            已注册
                            <a href="/login" style="color: #007DDB;">马上登录</a>
                        </span>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="reg_main">
            <div class="reg_main_2 col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3" style="margin-top: 30px">
                <div class="layui-card">
                    <div class="layui-card-header">注册</div>
                    <div class="layui-card-body">
                        <form class="layui-form">
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px;">用户名</label>
                                <div class="layui-input-block">
                                    <input id="username" type="text" name="username" required lay-verify="username" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px;">密码</label>
                                <div class="layui-input-block">
                                    <input id="password" type="password" name="password" lay-verify="password" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px;">确认密码</label>
                                <div class="layui-input-block">
                                    <input id="repassword" type="password" name="repassword" required lay-verify="repassword" autocomplete="off" class="layui-input">
                                </div>
                            </div>
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
                                <label class="layui-form-label" style="width: 100px;">邮箱</label>
                                <div class="layui-input-block">
                                    <input id="email" type="email" name="email" required lay-verify="email" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px;">手机号</label>
                                <div class="layui-input-block">
                                    <input id="phone_num" type="text" name="phoneNumber" required lay-verify="phone" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label" style="width: 100px;">旅客类型</label>
                                <div class="layui-input-block">
                                    <select id="user_type" name="userType" lay-filter="userType">
                                        <option value="成人">成人</option>
                                        <option value="学生">学生</option>
                                    </select>
                                </div>
                            </div>
                            <div id="studentBlock" style="display: none;">
                                <div  class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学校省份</label>
                                    <div class="layui-input-block">
                                        <input id="province" type="text" name="province" required lay-verify="province" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学校名称</label>
                                    <div class="layui-input-block">
                                        <input id="school" type="text" name="school" required lay-verify="school" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">院系</label>
                                    <div class="layui-input-block">
                                        <input id="department" type="text" name="department" required lay-verify="department" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">班级</label>
                                    <div class="layui-input-block">
                                        <input id="stu_class" type="text" name="stuClass" required lay-verify="stuClass" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学号</label>
                                    <div class="layui-input-block">
                                        <input id="stu_no" type="text" name="stuNo" required lay-verify="stuNo" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学制</label>
                                    <div class="layui-input-block">
                                        <input id="stu_len" type="text" name="stuLen" required lay-verify="stuLen" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">入学年份</label>
                                    <div class="layui-input-block">
                                        <input id="join_year" type="text" name="joinYear" required lay-verify="date" value="1970-01-01" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="layui-form-item layui-col-md-offset3">
                                <div class="layui-input-block">
                                    <button id="re_set" class="layui-btn">重置</button>
                                    <button class="layui-btn" lay-submit="" lay-filter="signup">注册</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript" src="../views/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../views/layui/layui.js"></script>
    <script>
        $(function () {
            $('#re_set').click(function () {
                $('#username').val('');
                $('#password').val('');
                $('#repassword').val('');
                $('#real_name').val('');
                $('#id_card').val('');
                $('#email').val('');
                $('#phone_num').val('');
                $('#province').val();
                $('#school').val();
                $('#department').val();
                $('#stu_class').val();
                $('#stu_no').val();
                $('#stu_len').val();
                $('#join_year').val();
            });
        });
        layui.use(['form','laydate'], function () {
            var form = layui.form,
                laydate = layui.laydate,
                $ =layui.jquery;

            laydate.render({
                elem: '#join_year'
            });

            form.verify({
                username: function (value) {
                    if (value.length <= 0) {
                        return '用户名不能为空';
                    }
                },
                password: [/(.+){6,12}$/, '密码必须6到12位'],
                repassword:function (value) {
                    var password = $('#password').val();
                    if (value != password) {
                        return '两次密码不一致';
                    }
                },
                realName:function (value) {
                    if (value.length <= 0) {
                        return '姓名不能为空';
                    }
                }
            });

            form.on('select(userType)', function (data) {
                if (data.value == '成人') {
                    document.getElementById('studentBlock').style.display = 'none';
                }
                else if (data.value == '学生') {
                    document.getElementById('studentBlock').style.display = 'block';
                }
            });
            form.on('submit(signup)', function (datas) {
                var user_type=datas.field.userType;
                if(user_type == '成人'){
                    var data1 = {
                        "username": datas.field.username,
                        "password": datas.field.password,
                        "realName": datas.field.realName,
                        "idCardType": datas.field.idCardType,
                        "idCard": datas.field.idCard,
                        "email": datas.field.email,
                        "phoneNumber": datas.field.phoneNumber,
                        "userType": datas.field.userType
                    };
                    $.ajax({
                        url: 'http://idcard.market.alicloudapi.com/lianzhuo/idcard?cardno='+datas.field.idCard+'&name='+datas.field.realName,
                        type: "GET",
                        headers:{
                            'Authorization':'APPCODE 360d7d3cb1244b66b3c2075c77cf03db'
                        },
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function (data) {
                            if(data.resp.code != 0){
                                layer.msg(data.resp.desc, {icon: 2});
                            }else{
                                $.ajax({
                                    url: "signup/adult",
                                    type: "post",
                                    data: JSON.stringify(data1),
                                    dataType: 'json',
                                    contentType: 'application/json',
                                    success: function (data) {
                                        if(data.err != null){
                                            layer.msg(data.err, {icon: 2});
                                        }else{
                                            layer.msg('注册成功！', {icon: 1});
                                            setTimeout(function (){window.location.href='login'},1000);
                                        }
                                    }
                                });
                            }
                        }
                    });

                }else{
                    form.verify({
                        province: function (value) {
                            if (value.length <= 0) {
                                return '省份不能为空';
                            }
                        },
                        school: function (value) {
                            if (value.length <= 0) {
                                return '学校名称不能为空';
                            }
                        },
                        department: function (value) {
                            if (value.length <= 0) {
                                return '院系不能为空';
                            }
                        },
                        stuClass: function (value) {
                            if (value.length <= 0) {
                                return '班级不能为空';
                            }
                        },
                        stuNo: function (value) {
                            if (value.length <= 0) {
                                return '学号不能为空';
                            }
                        },
                        stuLen: function (value) {
                            if (value.length <= 0) {
                                return '学制不能为空';
                            }
                        }
                    });
                    var data1 = {
                        "username": datas.field.username,
                        "password": datas.field.password,
                        "realName": datas.field.realName,
                        "idCardType": datas.field.idCardType,
                        "idCard": datas.field.idCard,
                        "email": datas.field.email,
                        "phoneNumber": datas.field.phoneNumber,
                        "userType": datas.field.userType,
                        "province":datas.field.province,
                        "school":datas.field.school,
                        "department":datas.field.department,
                        "stuClass":datas.field.stuClass,
                        "stuNo":datas.field.stuNo,
                        "stuLen":datas.field.stuLen,
                        "joinYear":datas.field.joinYear
                    };
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
                                    url: "signup/student",
                                    type: "post",
                                    data: JSON.stringify(data1),
                                    dataType: 'json',
                                    contentType: 'application/json',
                                    success: function () {
                                        if(data.err != null){
                                            layer.msg(data.err, {icon: 2});
                                        }else{
                                            layer.msg('注册成功！', {icon: 1});
                                            setTimeout(function (){window.location.href='login'},1000);
                                        }
                                    }
                                });
                            }
                        }
                    });
                }
                return false;
            });
        });

    </script>
</body>

</html>

