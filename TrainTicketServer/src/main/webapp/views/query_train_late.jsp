
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="busURL" var="busURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>正晚点查询</title>
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/ticket_late.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/bootstrap-datepicker3.css">
    <link rel="stylesheet" href="../views/layui/css/layui.css" />

</head>

<body style="background: #F3F3F3;">
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
                        <li> <a href="/agency" >火车代售点查询</a></li>
                        <li  class="active"><a href="/trainLate" >火车正晚点查询</a></li>
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

    <div class="search-box">
        <div class="col-md-offset-1 col-md-10" style="border: 1px solid #01AAED; border-radius: 5px;">
            <img src="../views/images/late.png" width="20%" height="30%" style="display: block;" />
            <!--查询表单-->
            <div class="col-md-offset-4 col-md-4">
                <form class="layui-form" action="/latetrain">
                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px">查询类型</label>
                        <div class="layui-input-block">
                            <c:if test="${type!=null && type == true }">
                                <input type="radio" name="type" value="到达站" title="到达站">
                                <input type="radio" name="type" value="出发站" title="出发站" checked="">
                            </c:if>
                            <c:if test="${type ==null || type == false }">
                                <input type="radio" name="type" value="到达站" title="到达站" checked="">
                                <input type="radio" name="type" value="出发站" title="出发站">
                            </c:if>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px">车站</label>
                        <div class="layui-input-block" style="width: 56%;">
                            <input type="text" value="${station}" name="station" class="layui-input" lay-verify="trainStation"/>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label" style="width: 100px">车次</label>
                        <div class="layui-input-block" style="width: 56%;">
                            <input type="text" value="${trainNo}" name="trainNo" class="layui-input" lay-verify="trainNum" />
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn layui-btn-normal" lay-submit="" style="width: 50%;">查询</button>
                        </div>
                    </div>

                </form>
            </div>
            <!--查询表单-->
        </div>
    </div>
    <div class="row">
        <div class="traffic_information col-md-offset-1 col-md-8 claerfix" style="padding: 0;width: 66%;margin-left:9% ">
            <div class="traffic_inf_title">
                <dl style="padding-left: 3%">
                    <dd class="left traffic_inf_left">${lateInfo.startCity}</dd>
                    <dt class="left traffic_inf_jia">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </dt>
                    <dd class="left">${lateInfo.desCity}</dd>
                </dl>

            </div>
            <table class="table table-striped">
                <thead class="traffic_jie_title  " >
                <th width="10%">车次</th>
                <th width="30%" style="padding-left: 4%">出发站/到达站</th>
                <th width="20%" style="padding-left: 4%">原定发车/到达时刻</th>
                <th width="20%">更改后的时刻</th>
                <th width="20%">推迟的时间</th>
                </thead>
                <tbody>
                <tr >
                    <td>${lateInfo.trainNo}</td>
                    <td>
                        <p>
                            <em class="base_shi">始</em>
                            <span>&nbsp;&nbsp;${lateInfo.startStation}</span>
                        </p>
                        <p>
                            <em class="base_dao">终</em>
                            <span>&nbsp;&nbsp;${lateInfo.desStation}</span>
                        </p>
                    </td>
                    <td style="padding-left: 4%">
                        <p>
                            <em class="base_shi">始</em>
                            <span>&nbsp;&nbsp;<fmt:formatDate value="${lateInfo.goOff}" pattern="HH:mm" /></span>
                        </p>
                        <p>
                            <em class="base_dao">到</em>
                            <span>&nbsp;&nbsp;<fmt:formatDate value="${lateInfo.arriveTime}" pattern="HH:mm" /></span>
                        </p>
                    </td>
                    <td>
                        <p>
                            <em class="base_shi">始</em>
                            <span>&nbsp;&nbsp;<fmt:formatDate value="${lateInfo.newGoOff}" pattern="HH:mm" /></span>
                        </p>
                        <p>
                            <em class="base_dao">到</em>
                            <span>&nbsp;&nbsp;<fmt:formatDate value="${lateInfo.newArriveTime}" pattern="HH:mm" /></span>
                        </p>
                    </td>
                    <td>
                        <c:if test="${(lateInfo.lateTime/1000/60/60)>=1}">
                            <p><span><fmt:formatNumber value="${(lateInfo.lateTime/1000/60/60)}" pattern="#0" />小时<br></span></p>
                            <p><span><fmt:formatNumber value="${(lateInfo.lateTime/1000/60%60)}" pattern="#0" />分钟</span></p>
                        </c:if>
                        <c:if test="${((a.getTime()-g.getTime())/1000/60/60)<1}">
                            <p><span>0小时</span></p>
                            <p><span><fmt:formatNumber value="${(lateInfo.lateTime/1000/60)}" pattern="#0" />分钟</span></p>
                        </c:if>
                    </td>
                </tr>
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
</div>


<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use('form', function() {
        var form = layui.form;

        //自定义验证规则
        form.verify({
            trainNum: function(value) {
                if(value.length <= 0) {
                    return '请输入车次';
                }
            },
            trainStation: function(value) {
                if(value.length <= 0) {
                    return '请输入车站';
                }
            }
        });

    });
</script>
</body>

</html>
