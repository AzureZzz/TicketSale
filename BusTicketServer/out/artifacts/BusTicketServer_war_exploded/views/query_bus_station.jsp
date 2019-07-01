
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="trainURL" var="trainURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>汽车站查询</title>
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
                    <a class="navbar-brand" href="/index">购票系统</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li ><a href="/index">首页 <span class="sr-only">(current)</span></a></li>
                        <li ><a href="/busTicket" >汽车票预订</a></li>
                        <li><a href="/busNum">汽车时刻表</a></li>
                        <li class="active"><a href="/busStation" >汽车车站查询</a></li>

                    </ul>

                    <ul class="nav navbar-nav navbar-right" style="padding-right: 260px">
                        <ul class="nav navbar-nav navbar-right" style="padding-right: 260px">
                            <c:if test="${cookie['token'] == null}">
                                <li><a href="/login">登录</a></li>
                                <li><a href="/signup">注册</a></li>
                            </c:if>
                            <c:if test="${cookie['token'] != null}">
                                <li><a href="/userInfo">个人中心</a></li>
                                <li><a href="/logout">退出</a></li>
                            </c:if>
                        </ul>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="line"></div>
    <!--内容-->
    <div class="search-box">
        <div class="search">
            <div class="col-md-offset-1 col-md-10" style="padding: 13px 15px;background-color: #fff;margin-top: 25px">
                <form action="/busStation/info" class="layui-form">
                    <div class="layui-form-item" style="margin-bottom: 0">
                        <label class="layui-form-label" style="width: 100px">所在地区</label>
                        <div class="layui-input-inline">
                            <input name="city" type="text" value="${city}" class=" form-control" id="citySelect" lay-verify="required" placeholder="请输入城市名">
                        </div>
                        <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%">查询</button>
                    </div>
                </form>
                <form action="/busStation/name" class="layui-form">
                    <div class="layui-form-item" style="margin-bottom: 0">
                        <label class="layui-form-label" style="width: 100px">名称查询</label>
                        <div class="layui-input-inline">
                            <input name="name" type="text" value="${name}" class=" form-control"  lay-verify="required" placeholder="车站名称">
                        </div>
                        <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%">查询</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="traffic_information col-md-offset-1 col-md-8 claerfix" style="padding: 0">
            <div class="traffic_inf_title">
                <dl>
                    <dd class="left traffic_inf_left">所在地区</dd>
                    <dt class="left traffic_inf_jia">
                        <!--<em class="glyphicon glyphicon-arrow-right"></em>-->
                        ：
                    </dt>
                    <dd class="left">${city}<c:if test="${city==null}">${stations[0].city}</c:if></dd>
                    <dt id="go_listNum" class="left traffic_inf_xial">(共${fn:length(stations)}条车站信息)</dt>
                </dl>

            </div>
            <table class="table table-striped">

                <thead class="traffic_jie_title  ">
                <th width="25%"> 名称</th>
                <th width="20%"> 所在城市</th>
                <th width="25%"> 联系热线</th>
                <th width="30%"> 地址</th>
                </thead>
                <tbody>
                <c:forEach items="${stations}" var="station">
                    <tr>
                        <td>${station.name}</td>
                        <td>${station.city}</td>
                        <td>${station.contactPhone}</td>
                        <td>${station.adress}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-2 guide">
            <h3 class="lead">购票指南</h3>
            <dl>
                <dt>儿童乘车购票有什么规定？</dt>
                <dd>儿童身高1.20童身高10米需购买儿童票，提供座位，超过1.50米应购买全价票。
                    儿童票不可单独购买,须有成人陪同，是否可售以系统显示为准。
                </dd>
            </dl>
            <dl>
                <dt>购票成功后如何取票？</dt>
                <dd>旅客需凭取票信息和身份证件在乘车站自助取票机或服务专窗取票，
                    具体以畅途网短信或订票页面提示为准。
                </dd>
            </dl>
            <dl>
                <dt>一般可以提前几天购票？</dt>
                <dd>一般可提前3-5天购票，具体以系统查询到班次为准，节假日的预售期可及时关注畅途网最新公告。</dd>
            </dl>
        </div>
    </div>
</div>
<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript " src="../views/js/cityselect.js"></script>
<script type="text/javascript " src="../views/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript " src="../views/layui/layui.js"></script>
<script>
    layui.use(['form', 'laydate'], function () {
        var form = layui.form
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
    });
</script>
<script type="text/javascript">
    var test = new Vcity.CitySelector({input: 'citySelect'});
</script>
</body>
</html>
