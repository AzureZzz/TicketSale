
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="trainURL" var="trainURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>订单填写页</title>
    <link rel="stylesheet" href="../views/layui/css/layui.css">
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/ticket_purchase.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/cityselect.css">
    <link rel="stylesheet" href="../views/css/bootstrap-datepicker3.css">

</head>
<body style="background-color: #f3f3f3">
<div>
    <div id="long_header">
        <div class="nav_longer">
            <div class="nav_wrap w1200">
                <div class="logo">
                    <h1>
                        <a href="#">
                            <img src="../views/images/logo.jpg" width="100px" height="80px">
                        </a>
                    </h1>
                </div>
                <div class="head_title">
                    <h2>
                        订单填写页
                    </h2>
                </div>

            </div>
        </div>
    </div>

    <div class="line"></div>

    <div class="purchase">

        <div class="row" style="margin-top: 50px">
            <div class="traffic_information col-md-offset-1 col-md-10">
                <h2>车票信息</h2>
                <table class="table table-striped">
                    <thead class="traffic_jie_title  ">
                    <th width="10%">车次</th>
                    <th width="15%">出发时间</th>
                    <th width="20%">出发站</th>
                    <th width="20%">到达站</th>
                    <th width="15%">车型</th>
                    <th width="10%">票价</th>
                    <th width="10%">座位号</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${busNum.numNo}</td>
                        <td><fmt:formatDate value="${busNum.goOff}" pattern="MM月dd日 HH:mm" /></td>
                        <td>${busNum.startStation}</td>
                        <td>${busNum.desStation}</td>
                        <td>${busNum.busType}</td>
                        <td><span class="glyphicong glyphicon-yen"></span>${busNum.piece}</td>
                        <td>
                            <select id="bsId">
                                <c:forEach items="${busNum.busSeats}" var="seat">
                                    <option value="${seat.bsId}">${seat.seatNo}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="traffic_passenger col-md-offset-1 col-md-10">
                <h2>乘客信息</h2>
                <input type="hidden" id="pId" name="pId" value="${passenger.pId}">
                <table class="table table-striped">
                    <thead class="traffic_jie_title  ">
                        <th width="15%">姓名</th>
                        <th width="10%">乘客类型</th>
                        <th width="15%">证件类型</th>
                        <th width="15%">证件号</th>
                        <th width="15%">票种</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td id="realNmae"></td>
                        <td id="pType"></td>
                        <td id="idCardType"></td>
                        <td id="idCard"></td>
                        <td>
                            <select id="type" name="interest" lay-filter="aihao"
                                    style="height: 31px; border-radius: 5px;border-color:#dadada">
                                <option value="成人" selected="">成人票</option>
                                <option value="学生">学生票</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div>
                    <div>
                        <select id="selece_pId" style="float: left">
                            <option value="">选择乘客</option>
                            <c:forEach items="${passengers}" var="passenger">
                                <option value="${passenger.pId}">${passenger.realName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="site-demo-button" id="add_Passenger_btn" style="margin-bottom: 0;">
                        <button data-method="add_passenger" class="layui-btn layui-bg-blue">十 添加乘客</button>
                    </div>
                </div>
                <div class="col-md-offset-5 col-md-2" style="margin-top: 50px; margin-bottom: 50px">
                    <c:if test="${bbId == null}">
                        <button id="add_busBill" class="btn btn-default btn-block">提交订单</button>
                    </c:if>
                    <c:if test="${bbId != null}">
                        <input value="${bbId}" id="change_bbId" type="hidden" />
                        <button id="change_busBill" class="btn btn-default btn-block">改签</button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
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

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript " src="../views/js/cityselect.js"></script>
<script type="text/javascript " src="../views/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript " src="../views/layui/layui.js"></script>
<script>

    layui.use(['layer','form'] , function(){
        var $ = layui.jquery, layer = layui.layer;
        var form = layui.form;

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
                            url:'/passenger',
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
        $('#add_Passenger_btn .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        $('#add_busBill').click(function () {
           var data = {
                "pId":$('#pId').val(),
                "bsId":$('#bsId').val(),
                "billType":$('#type').val()
            };
            $.ajax({
                url: '${billURL}/busbill',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                dataType:'json',
                success: function(data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        layer.msg(data.msg, {icon: 1});
                        setTimeout(function (){window.location.href='/userBusBill'},1000);
                    }
                }
            });
        });

        $('#change_busBill').click(function () {
            var data = {
                "pId":$('#pId').val(),
                "bsId":$('#bsId').val(),
                "billType":$('#type').val()
            };
            $.ajax({
                url: '${billURL}/busbill',
                type: 'POST',
                data: JSON.stringify(data),
                contentType: 'application/json',
                xhrFields: {
                    withCredentials: true
                },
                crossDomain: true,
                dataType:'json',
                success: function(data) {
                    if(data.err!=null){
                        layer.msg(data.err, {icon: 2});
                    }else{
                        $.ajax({
                            url:'${billURL}/busbill/' + $('#change_bbId').val(),
                            type:'DELETE',
                            dataType:'json',
                            contentType: 'application/json',
                            xhrFields: {
                                withCredentials: true
                            },
                            crossDomain: true,
                            success:function (data) {
                                if(data.err!=null){
                                    layer.msg("改签失败！", {icon: 2});
                                }else{
                                    layer.msg("改签成功！", {icon: 1});
                                    setTimeout(function (){window.location.href='/userBusBill'},1000);
                                }
                            }
                        });
                    }
                }
            });
        });

        $('#selece_pId').change(function () {
            if(this.value!=null){
                $.ajax({
                    url: '/passenger/'+this.value,
                    type: 'GET',
                    contentType: 'application/json',
                    dataType:'json',
                    success: function(data) {
                        if(data.err!=null){
                            layer.msg(data.err, {icon: 2});
                        }else{
                            $('#idCardType').html(data.passenger.idCardType);
                            $('#idCard').html(data.passenger.idCard);
                            $('#pType').html(data.passenger.pType);
                            $('#realNmae').html(data.passenger.realName);
                            $('#pId').val(data.passenger.pId);
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
