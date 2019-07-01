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
    <title>首页</title>
    <link rel="stylesheet" href="../views/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../views/css/index.css">
    <link rel="stylesheet" href="../views/css/common.css">
    <link rel="stylesheet" href="../views/css/cityselect.css">
    <link rel="stylesheet" href="../views/css/bootstrap-datepicker3.css">
    <link rel="stylesheet" href="../views/layui/css/layui.css">

</head>


<body>
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
                        <li class="active"><a href="/index">首页 <span class="sr-only">(current)</span></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">车票预订<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/busTicket">汽车票预订</a></li>
                                <li><a href="${trainURL}/trainTicket">火车票预订</a></li>

                            </ul>
                        </li>
                    </ul>

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
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div class="lines"></div>

    <div class="content">
        <div class="wheel">
            <img class="anim_fade_image"  src="../views/images/train2.jfif" style="width:100%"/>
            <img src="../views/images/car.jfif"/>
        </div>
        <div class="fadein_Sear">
            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                    <li class="layui-this" style="width: 50%">汽车票</li>
                    <li style="width: 50%">火车票</li>
                </ul>
                <div class="layui-tab-content" style="padding: 0">
                    <div class="layui-tab-item layui-show">
                        <div class="fadein_Sear_item">

                            <form class="form-inline layui-form" action="/busTicket/info">
                                <input type="hidden" name="bbId" value="">
                                <div class="form-group">
                                    <label for="citySelect1">出发城市&nbsp;&nbsp;&nbsp;</label>
                                    <input name="startCity" type="text" lay-verify="required" class=" form-control" id="citySelect1" placeholder="请输入出发地">
                                    <br><br>
                                    <label for="citySelect2">到达城市&nbsp;&nbsp;&nbsp;</label>
                                    <input name="arriveCity" type="text" lay-verify="required" class=" form-control" id="citySelect2" placeholder="请输入目的地">
                                    <br><br>
                                    <label>出发日期&nbsp;&nbsp;&nbsp;</label>
                                    <input  name="goOff" id="date1" lay-verify="required" class="form-control" placeholder="出发时间">
                                </div>
                                <br>
                                <br>
                                <br>
                                <button type="submit" class="btn btn-primary btn-block" lay-submit="" lay-filter="demo2">查询</button>
                            </form>

                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="fadein_Sear_item">

                            <form class="form-inline layui-form" action="${trainURL}/trainTicket/info">
                                <input name="tbId" value="" type="hidden">
                                <div class="form-group">
                                    <label for="citySelect3">出发城市&nbsp;&nbsp;&nbsp;</label>
                                    <input name="startPlace" type="text" lay-verify="required" class=" form-control" id="citySelect3" placeholder="请输入出发地">
                                    <br><br>
                                    <label for="citySelect4">到达城市&nbsp;&nbsp;&nbsp;</label>
                                    <input name="desPlace" type="text" lay-verify="required" class=" form-control" id="citySelect4" placeholder="请输入目的地">
                                    <br><br>
                                    <label>出发日期&nbsp;&nbsp;&nbsp;</label>
                                    <input  name="goOff" id="date2" lay-verify="required" class="form-control" placeholder="出发时间">
                                </div>
                                <br>
                                <br>
                                <br>
                                <button type="submit" class="btn btn-primary btn-block" lay-submit="">查询</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="hotRute" style="padding: 0px 50px;margin-bottom: 100px">
        <dl style="display: block;margin-bottom: 30px;margin-top: 30px">
            <dt style="display: block;margin: 0 auto;width: 150px;text-align: center"><h2>热门路线</h2></dt>
        </dl>
        <table class="table table-striped">
            <tr style="font-size: 17px">
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>上海</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>武汉</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">258.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>上海</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>北京</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">309.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>上海</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>杭州</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">46.5</span>起</td>

            </tr>
            <tr style="font-size: 17px">
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>北京</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>上海</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">309.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>北京</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>杭州</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">128.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>北京</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>宁波</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">246.0</span>起</td>

            </tr>
            <tr style="font-size: 17px">
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>合肥</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>郑州</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">178.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>宁波</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>厦门</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">346.0</span>起</td>
                <td>
                    <a href="${trainURL}/trainTicket">
                        <span>温州</span>
                        <em class="glyphicon glyphicon-arrow-right"></em>
                        <span>义乌</span>
                    </a>
                </td>
                <td><span class="glyphicong glyphicon-yen" style="color: orange;font-size: 20px">257.0</span>起</td>
            </tr>
        </table>
    </div>

</div>

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript " src="../views/js/cityselect.js"></script>
<script type="text/javascript " src="../views/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="../views/layui/layui.js"></script>
<script>
    layui.use(['laydate','element','form'], function() {
        var laydate = layui.laydate,
            element = layui.element,
            form = layui.form;
        laydate.render({
            elem: '#date1'
        });
        laydate.render({
            elem: '#date2'
        });
    });
</script>
<script type="text/javascript">
    var test=new Vcity.CitySelector({input:'citySelect1'});
    var test=new Vcity.CitySelector({input:'citySelect2'});
    var test=new Vcity.CitySelector({input:'citySelect3'});
    var test=new Vcity.CitySelector({input:'citySelect4'});
</script>


</body>
</html>