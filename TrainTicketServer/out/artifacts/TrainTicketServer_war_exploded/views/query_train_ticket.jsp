
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
    <title>火车票预订</title>
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/ticket_Order.css">
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
                        <li class="active"><a href="/trainTicket" >火车票预订</a></li>
                        <li><a href="/trainNum" >火车车次查询</a></li>
                        <li> <a href="/agency" >火车代售点查询</a></li>
                        <li ><a href="/trainLate" >火车正晚点查询</a></li>
                        <li><a href="/trainStation">火车车站查询</a></li>
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
    <div class="pushBox" style="height: 380px; width: 1200px;margin: 0 auto; padding-bottom: 0px">
        <div style="width: 1600px;height:50px;margin: 20px 0 0 10px;">
                <table>
                <tr>
                    <td style="font-size: 25px;display: block;padding: 10px;">热门推送</td>
                    <td style="font-size: 18px;">那些年想去的地方</td>
                </tr>
            </table>
        </div>

        <c:forEach items="${articals}" var="artical">
            <div class="picture">
                <a href="${busURL}/artical/${artical.aId}">
                    <img src="${artical.headImg}" alt="" width="250px" height="200px" class="img-rounded" />
                </a>
                <div id="title"><h4>${artical.title}</h4></div>
            </div>
        </c:forEach>

    </div>

    <div class="search-box" style="margin-top: 10px;padding-top: 0px">
        <div class="search">
            <div class=" col-md-offset-1 col-md-10" style="padding: 13px 15px;">
                <form class="form-inline layui-form" action="/trainTicket/info" method="get">
                    <input name="tbId" value="${tbId}" type="hidden">
                    <div class="form-group">
                        <label for="citySelect1">出发城市&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="startPlace" value="${startPlace}" required lay-verify="start" class=" form-control"  id="citySelect1" placeholder="请输入出发地">
                        &nbsp;&nbsp;&nbsp;

                        <label for="citySelect2">到达城市&nbsp;&nbsp;&nbsp;</label>
                        <input type="text" name="desPlace" value="${desPlace}" required lay-verify="des" class=" form-control" id="citySelect2" placeholder="请输入目的地">
                        &nbsp;&nbsp;&nbsp;

                        <label >出发日期&nbsp;&nbsp;&nbsp;</label>
                        <input  id="date1" name="goOff" value="${goOff}" required lay-verify="date" class="form-control" placeholder="出发时间">
                        &nbsp;&nbsp;&nbsp;
                    </div>
                    <button type="submit" class="btn btn-primary " lay-submit="" style="width: 9%;">查询</button>
                </form>
            </div>
        </div>
    </div>

    <div class="traffic_information col-md-offset-1 col-md-8 claerfix" style="padding: 0">
        <div class="traffic_inf_title">
            <dl>
                <dd class="left traffic_inf_left">${startPlace}</dd>
                <dt class="left traffic_inf_jia">
                    <em class="glyphicon glyphicon-arrow-right"> </em>
                </dt>
                <dd class="left">${desPlace}</dd>
                <dt id="go_listNum" class="left traffic_inf_xial">(共${fn:length(trainTickets)}条车次信息)</dt>
            </dl>

        </div>
        <table class="table table-striped">
            <thead class="traffic_jie_title  ">
            <th width="10%" >车次</th>
            <th width="20%">出发站/到达站</th>
            <th width="20%">出发时间/到达时间</th>
            <th width="10%">历时</th>
            <th width="10%">座位类型</th>
            <th width="10%">剩余数量</th>
            <th width="10%">票价</th>
            <th width="10%">操作</th>
            </thead>
            <tbody>
            <c:forEach items="${trainTickets}" var="trainTicket">
                <c:forEach items="${trainTicket.trainSeats}" var="trainSeat">
                    <tr>
                        <td>${trainTicket.trainNum.trainNo}</td>
                        <td>
                            <p>
                                <em class="base_shi">始</em>
                                <span>&nbsp;&nbsp;${trainTicket.startStation}</span>
                            </p>
                            <p>
                                <em class="base_dao">终</em>
                                <span>&nbsp;&nbsp;${trainTicket.desStation}</span>
                            </p>
                        </td>
                        <td>
                            <p>
                                <em class="base_shi">出</em>
                                <span>&nbsp;&nbsp;<fmt:formatDate value="${trainTicket.goOff}" pattern="HH:mm" /></span>
                            </p>
                            <p>
                                <em class="base_dao">到</em>
                                <span>&nbsp;&nbsp;<fmt:formatDate value="${trainTicket.arriveTime}" pattern="HH:mm" /></span>
                            </p>
                        </td>
                        <td>
                            <fmt:formatDate  var="goOff"  type="date"  value="${trainTicket.goOff}"  pattern="yyyy-MM-dd HH:mm"/>
                            <fmt:formatDate  var="arriveTime" type="date"  value="${trainTicket.arriveTime}" pattern="yyyy-MM-dd HH:mm"/>
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
                        <td>${trainSeat.seatType}</td>
                        <td>${trainSeat.count}</td>
                        <td><span class="glyphicong glyphicon-yen"></span>${trainSeat.piece}</td>
                        <td><a class="btn btn-primary" role="button" href="/trainBill/${trainTicket.ttId}?seatType=${trainSeat.seatType}&tbId=${tbId}" target="_blank">购票</a></td>
                    </tr>
                </c:forEach>
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
<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript " src="../views/js/cityselect.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use(['laydate','form'], function() {
        var laydate = layui.laydate,
            form = layui.form;
        laydate.render({
            elem: '#date1'
        });

        form.verify({
            start: function(value) {
                if(value.length <= 0) {
                    return '无效始发地，请重新选择';
                }
            },
            des: function(value) {
                if(value.length <= 0) {
                    return '无效目的地，请重新选择';
                }
            }
        });
    });
</script>
<script type="text/javascript">
    var test=new Vcity.CitySelector({input:'citySelect1'});
    var test=new Vcity.CitySelector({input:'citySelect2'});
</script>
</body>
</html>
