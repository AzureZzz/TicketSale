
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="busURL" var="busURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>代售点查询</title>
    <link rel="stylesheet" href="../views/layui/css/layui.css">
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/ticket_sale.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/cityselect.css">
    <link rel="stylesheet" href="../views/css/bootstrap-datepicker3.css">

</head>
<body style="background-color: #f3f3f3">
<div>
    <div class="row">
        <nav class="navbar navbar-default" style="margin-bottom: 0">
            <div class=" col-md-offset-2 col=md-8">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">购票系统</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ><a href="${busURL}/index" >首页 <span class="sr-only">(current)</span></a></li>
                        <li><a href="/trainTicket" >火车票预订</a></li>
                        <li><a href="/trainNum" >火车车次查询</a></li>
                        <li  class="active"> <a href="/agency" >火车代售点查询</a></li>
                        <li><a href="/trainLate" >火车正晚点查询</a></li>
                        <li ><a href="/trainStation">火车车站查询</a></li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right" style="padding-right: 260px">
                        <c:if test="${cookie['token'] == null}">
                            <li><a href="${busURL}/login">登录</a></li>
                            <li><a href="${busURL}/signup">注册</a></li>
                        </c:if>
                        <c:if test="${cookie['token'] != null}">
                            <li><a href="${busURL}/userInfo">个人中心</a></li>
                            <li><a href="${busURL}/logout">退出</a></li>
                        </c:if>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div class="line"></div>
    <!--内容-->
    <div class="search-box">
        <div class="search">
            <div class="col-md-offset-1 col-md-10" style="padding: 13px 15px;background-color: #fff;margin-top: 25px">
                <form action="/agency/city" class="layui-form" method="get">
                    <div class="layui-form-item" style="margin-bottom: 0">
                        <label class="layui-form-label" style="width: 100px">所在城市</label>
                        <div class="layui-input-inline">
                            <input type="text" name="city" value="${city}" class=" form-control" required lay-verify="city" id="citySelect1" placeholder="请输入城市名">
                        </div>
                        <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%">查询</button>
                    </div>
                </form>
                <form action="/agency/name" class="layui-form" method="get">
                    <div class="layui-form-item" style="margin-bottom: 0">
                        <label class="layui-form-label" style="width: 100px">名称</label>
                        <div class="layui-input-inline">
                            <input type="text" name="name" value="${name}" class=" form-control" required lay-verify="name" placeholder="请输入代售点名称">
                        </div>
                        <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%">查询</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="traffic_result col-md-offset-1 col-md-10 claerfix" style="padding: 20px 0 5px 10px">
            ${agencies[0].city} 共有 ${fn:length(agencies)} 个代售点
        </div>
        <div class="traffic_information col-md-offset-1 col-md-8 claerfix" style="padding: 0">
            <table class="table table-striped">
                <thead class="traffic_jie_title  ">
                    <th width="20%">代售点名称</th>
                    <th width="30%">地址</th>
                    <th width="20%">营业时间</th>
                    <th width="10%">窗口数量</th>
                    <th width="20%">联系热线</th>
                </thead>
                <tbody>
                <c:forEach items="${agencies}" var="agency">
                    <tr>
                        <td>${agency.name}</td>
                        <td>${agency.adress}</td>
                        <td>${agency.saleTime}</td>
                        <td>${agency.windowNum}</td>
                        <td>${agency.contactNum}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-2 guide" >
            <h3 class="lead">购票指南</h3>
            <dl>
                <dt>儿童乘车购票有什么规定？</dt>
                <dd>儿童身高1.20童身高10米需购买儿童票，提供座位，超过1.50米应购买全价票。
                    儿童票不可单独购买,须有成人陪同，是否可售以系统显示为准。</dd>
            </dl>
            <dl>
                <dt>购票成功后如何取票？</dt>
                <dd>旅客需凭取票信息和身份证件在乘车站自助取票机或服务专窗取票，
                    具体以畅途网短信或订票页面提示为准。</dd>
            </dl>
            <dl>
                <dt>一般可以提前几天购票？</dt>
                <dd>一般可提前3-5天购票，具体以系统查询到班次为准，节假日的预售期可及时关注畅途网最新公告。</dd>
            </dl>
        </div>
    </div>
</div>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript " src="../views/js/cityselect.js"></script>
<script type="text/javascript " src="../views/js/bootstrap-datepicker.min.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        form.verify({
            city: function (value) {
                if (value.length <= 0) {
                    return '所选地区，请重新选择';
                }
            }
            , name: function (value) {
                if (value.length <= 0) {
                    return '名称输入错误';
                }
            }
        });


        //监听提交
        form.on('submit(demo1)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        })
    });
</script>
<script type="text/javascript">
    var test=new Vcity.CitySelector({input:'citySelect1'});
</script>
</body>
</html>
