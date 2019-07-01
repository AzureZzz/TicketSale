
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
    <title>车次查询</title>
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/ticket_number.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/cityselect.css">

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
                        <li class="active"><a href="/trainNum" >火车车次查询</a></li>
                        <li> <a href="/agency" >火车代售点查询</a></li>
                        <li ><a href="/trainLate" >火车正晚点查询</a></li>
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
            <div class=" col-md-offset-1 col-md-10" style="padding: 13px 15px;background-color: #fff;margin-top: 25px;">
                <form class="form-inline layui-form" action="/trainNum/info" method="get">
                    <div class="form-group">
                        <label >出发日期&nbsp;&nbsp;&nbsp;</label>
                        <input  id="date2" name="goOff" value="${goOff}" class="form-control" lay-verify="required|date" placeholder="出发时间">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <label >始发站&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="startStation" value="${startStation}" class=" form-control" required lay-verify="station" placeholder="请输入出发车站">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%;">查询</button>
                </form>
                <br>
                <form class="form-inline layui-form" action="/trainNum/no" method="get">
                    <div class="form-group">
                        <label >出发日期&nbsp;&nbsp;&nbsp;</label>
                        <input  id="date1" name="goOff" value="${goOff2}" class="form-control" lay-verify="required|date" placeholder="出发时间">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <label >车&nbsp;&nbsp;&nbsp;次&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="trainNo" value="${trainNo}" class=" form-control" required lay-verify="trainNum" placeholder="请输入车次">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                    <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%;">查询</button>
                </form>
            </div>
        </div>


    </div>
    <div class="row">
        <div class="traffic_information col-md-offset-1 col-md-8 claerfix" style="padding: 0">
            <div class="traffic_inf_title">
                <dl>
                    <dd class="left traffic_inf_left">${trainNums[0].startStation}出发</dd>
                    <dt id="go_listNum" class="left traffic_inf_xial">(共${fn:length(trainNums)}条车次信息)</dt>
                </dl>

            </div>
            <table class="table table-striped">
                <thead class="traffic_jie_title  ">
                <th width="10%" > 车次</th>
                <th width="15%" > 等级</th>
                <th width="20%">始发站/终点站</th>
                <th width="20%">出发时间/到达时间</th>
                <th width="15%">历时</th>
                <th width="20%">车站</th>
                </thead>
                <tbody>
                <c:forEach items="${trainNums}" var="trainNum">

                    <tr>
                        <td>${trainNum.trainNo}</td>
                        <td>
                            <c:choose>
                                <c:when test="${fn:substring(trainNum.trainNo,0 ,1 ).equals('Z')}">
                                    直达
                                </c:when>
                                <c:when test="${fn:substring(trainNum.trainNo,0 ,1 ).equals('T')}">
                                    特快
                                </c:when>
                                <c:when test="${fn:substring(trainNum.trainNo,0 ,1 ).equals('K')}">
                                    快递
                                </c:when>
                                <c:when test="${fn:substring(trainNum.trainNo,0 ,1 ).equals('G')}">
                                    高铁
                                </c:when>
                                <c:when test="${fn:substring(trainNum.trainNo,0 ,1 ).equals('D')}">
                                    动车
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <p>
                                <em class="base_shi">始</em>
                                <span>&nbsp;&nbsp;${trainNum.startStation}</span>
                            </p>
                            <p>
                                <em class="base_dao">终</em>
                                <span>&nbsp;&nbsp;${trainNum.desStation}</span>
                            </p>
                        </td>
                        <td>
                            <p>
                                <em class="base_shi">出</em>
                                <span>&nbsp;&nbsp;<fmt:formatDate value="${trainNum.goOff}" pattern="HH:mm" /></span>
                            </p>
                            <p>
                                <em class="base_dao">达</em>
                                <span>&nbsp;&nbsp;<fmt:formatDate value="${trainNum.arrive}" pattern="HH:mm" /></span>
                            </p>


                        </td>
                        <td>
                            <fmt:formatDate  var="goOff"  type="date"  value="${trainNum.goOff}"  pattern="yyyy-MM-dd HH:mm"/>
                            <fmt:formatDate  var="arriveTime" type="date"  value="${trainNum.arrive}" pattern="yyyy-MM-dd HH:mm"/>
                            <fmt:parseDate var="g" value="${goOff}" pattern="yyyy-MM-dd HH:mm"/>
                            <fmt:parseDate var="a" value="${arriveTime}" pattern="yyyy-MM-dd HH:mm"/>
                            <c:if test="${((a.getTime()-g.getTime())/1000/60/60)>=1}">
                                <p><span><fmt:formatNumber value="${((a.getTime() - g.getTime())/1000/60/60)}" pattern="#0" />小时<br></span></p>
                                <p><span><fmt:formatNumber value="${((a.getTime() - g.getTime())/1000/60%60)}" pattern="#0" />分钟</span></p>
                            </c:if>
                            <c:if test="${((a.getTime()-g.getTime())/1000/60/60)<1}">

                                <p><span>0小时</span></p>
                                <p><span><fmt:formatNumber value="${((a.getTime() - g.getTime())/1000/60)}" pattern="#0" />分钟</span></p>

                            </c:if>
                        </td>
                        <td>${trainNum.startStation}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-md-2 " style="background-color: #fff;margin: 15px 0 0 1px;width: 16%;">
            <h3 class="lead">购票指南</h3>
            <dl>
                <dt>儿童乘车购票有什么规定？</dt>
                <dd style=" font-size: 12px;letter-spacing: 1px;">儿童身高1.20童身高10米需购买儿童票，提供座位，超过1.50米应购买全价票。
                    儿童票不可单独购买,须有成人陪同，是否可售以系统显示为准。</dd>
            </dl>
            <dl>
                <dt>购票成功后如何取票？</dt>
                <dd style=" font-size: 12px;letter-spacing: 1px;">旅客需凭取票信息和身份证件在乘车站自助取票机或服务专窗取票，
                    具体以畅途网短信或订票页面提示为准。</dd>
            </dl>
            <dl>
                <dt>一般可以提前几天购票？</dt>
                <dd style=" font-size: 12px;letter-spacing: 1px;">一般可提前3-5天购票，具体以系统查询到班次为准，节假日的预售期可及时关注畅途网最新公告。</dd>
            </dl>
        </div>
    </div>
</div>

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use(['laydate','form'], function() {
        var laydate = layui.laydate,
            form = layui.form;
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#date2'
        });
        form.verify({
            trainNum: function(value) {
                if(value.length <= 0) {
                    return '无效车次，请重新选择';
                }
            },
            station: function(value) {
                if(value.length <= 0) {
                    return '无效车站，请重新选择';
                }
            }
        });
    });
</script>
</body>
</html>
