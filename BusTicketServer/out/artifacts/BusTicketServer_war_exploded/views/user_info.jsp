
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
                <li class="layui-nav-item layui-nav-itemed">
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
                <font size="5">用户信息</font>
            </div>
            <div style="margin-top: 50px;">
                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this">基本信息</li>
                        <c:if test="${userBase.userType=='学生'}">
                            <li>学生认证信息</li>
                        </c:if>
                        <li>其他信息</li>
                    </ul>
                    <div class="layui-tab-content">
                        <div class="layui-tab-item layui-show">
                            <form class="layui-form col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2" style="margin-top: 20px">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">用户名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="userName" value="${userBase.username}" lay-verify="userName" disabled="disabled" class="layui-input" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">邮箱</label>
                                    <div class="layui-input-block">
                                        <input type="email" name="idNum" lay-verify="email" value="${userBase.email}" disabled="disabled" class="layui-input" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">手机号码</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="phoneNum" lay-verify="email" value="${userBase.phoneNumber}" disabled="disabled" class="layui-input" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">真实姓名</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="idMode" lay-verify="email" class="layui-input" value="${userBase.realName}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">证件类型</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="idMode" lay-verify="email" class="layui-input" value="${userBase.idCardType}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">证件号</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="idNum" lay-verify="email" class="layui-input" value="${userBase.idCard}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">用户类型</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="idNum" lay-verify="email" class="layui-input" value="${userBase.userType}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">余额</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="balance" lay-verify="balance" class="layui-input" value="${userBase.balance}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                            </form>
                        </div>

                        <c:if test="${userBase.userType=='学生'}">
                            <div class="layui-tab-item">
                            <form class="layui-form col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2" style="margin-top: 20px">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学校所在省</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="province" name="province" disabled="disabled" value="${stuAuth.province}" lay-verify="required" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学校名称</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="school" name="school" disabled="disabled" lay-verify="required" value="${stuAuth.school}" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">院系</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="department" name="department" disabled="disabled" lay-verify="required" value="${stuAuth.department}" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">班级</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="stuClass" name="stuClass" disabled="disabled" lay-verify="required" value="${stuAuth.stuClass}" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学号</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="stuNo" name="stuNo" disabled="disabled" lay-verify="required" value="${stuAuth.stuNo}" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">学制</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="stuLen" name="stuLen" disabled="disabled" lay-verify="required" value="${stuAuth.stuLen}" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">入学年月</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="joinYear" name="joinYear" disabled="disabled" lay-verify="required" value="<fmt:formatDate value="${stuAuth.joinYear}" pattern="yyyy-MM-dd" />" class="layui-input stu-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">优惠区间</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="disRanger" name="disRanger" disabled="disabled" lay-verify="required" value="${stuAuth.disRanger}" class="layui-input" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">优惠号</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="disNum" name="disNum" disabled="disabled" lay-verify="required" value="${stuAuth.disNum}" class="layui-input" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
                                    <div class="layui-input-block">
                                        <input id="change_stu" type="button" class="layui-btn layui-btn-lg" value="编辑"/>
                                        <input type="button" lay-submit="" lay-filter="save_stu" class="layui-btn layui-btn-lg" value="保存"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </c:if>

                        <div class="layui-tab-item">
                            <form class="layui-form col-lg-8 col-md-8 col-lg-offset-2 col-md-offset-2" style="margin-top: 20px">
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">生日</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="birthday" name="birthday" disabled="disabled" value="<fmt:formatDate value="${userInfo.birthday}" pattern="yyyy-MM-dd" />" lay-verify="userName" class="layui-input info-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">地址</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="adress" name="adress" disabled="disabled" lay-verify="required" value="${userInfo.adress}" class="layui-input info-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">固话号码</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="telephone" name="telephone" disabled="disabled" lay-verify="phone" value="${userInfo.telephone}" class="layui-input info-elem" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label" style="width: 100px;">邮编</label>
                                    <div class="layui-input-block">
                                        <input type="text" id="postcode" name="postcode" disabled="disabled" lay-verify="required" class="layui-input info-elem" value="${userInfo.postcode}" disabled="disabled" style="width: 70%;">
                                    </div>
                                </div>
                                <div class="layui-form-item col-lg-offset-4 col-md-offset-4">
                                    <div class="layui-input-block">
                                        <input id="change_info" type="button" class="layui-btn layui-btn-lg" value="编辑"/>
                                        <input id="save_info" type="button" lay-submit="" lay-filter="save_info" class="layui-btn layui-btn-lg" value="保存"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>

<script>
    layui.use(['element','laydate','layer','form'], function() {
        var element = layui.element,
            laydate = layui.laydate,
            layer = layui.layer,
            form = layui.form,
            $ =layui.jquery;

        element.on('nav(left_navagation)', function(elem) {
            layer.msg(elem.text());
        });

        laydate.render({
            elem: '#birthday'
        });
        laydate.render({
            elem: '#joinYear'
        });

        $('#change_info').click(function () {
            if(this.value == '编辑'){
                $('.info-elem').removeAttr("disabled");
                $('#change_info').addClass('layui-btn-danger');
                $('#change_info').val('取消')
            }else{
                $('.info-elem').attr("disabled","disabled");
                $('#change_info').removeClass('layui-btn-danger');
                $('#change_info').val('编辑');
            }
        });

        $('#change_stu').click(function () {
            if(this.value == '编辑'){
                $('.stu-elem').removeAttr("disabled");
                $('#change_stu').addClass('layui-btn-danger');
                $('#change_stu').val('取消')
            }else{
                $('.stu-elem').attr("disabled","disabled");
                $('#change_stu').removeClass('layui-btn-danger');
                $('#change_stu').val('编辑');
            }
        });

        form.on('submit(save_info)', function (datas) {
            var data=datas.field;
            $.ajax({
                url:'userinfo',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.msg(data.msg, {icon: 1});
                        $('.info-elem').attr("disabled","disabled");
                        $('#change_info').removeClass('layui-btn-danger');
                        $('#change_info').val('编辑');
                    }
                }
            });
            return false;
        });

        form.on('submit(save_stu)', function (datas) {
            var data=datas.field;
            $.ajax({
                url:'stuauth',
                type:'PUT',
                data:JSON.stringify(data),
                dataType:'json',
                contentType: 'application/json',
                success:function (data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.msg(data.msg, {icon: 1});
                        $('.stu-elem').attr("disabled","disabled");
                        $('#change_stu').removeClass('layui-btn-danger');
                        $('#change_stu').val('编辑');
                    }
                }
            });
            return false;
        });
    });
</script>
</body>

</html>
