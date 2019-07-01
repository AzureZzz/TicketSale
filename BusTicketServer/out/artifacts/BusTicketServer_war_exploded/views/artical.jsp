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
    <link rel="stylesheet" href="../views/layui/css/layui.css">

</head>

<body style="min-width: 820px">
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

    <div class="note">
        <div class="post">
            <div class="article">
                <h1 class="title">${artical.title}</h1>

                <!-- 作者区域 -->
                <div class="author">
                    <a class="avatar" href="/u/2b3ad4f2a058">
                        <img src="//upload.jianshu.io/users/upload_avatars/2259045/5fcf399a6f1b.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/96/h/96" alt="96" />
                    </a>          <div class="info">
                    <span class="name">${artical.authorName}</span>
                    <div props-data-classes="user-follow-button-header" data-author-follow-button></div>
                    <div class="meta">
                        <span class="publish-time" data-toggle="tooltip" data-placement="bottom" title="最后编辑于 2018.05.25 21:57">${artical.pubTime}</span>
                    </div>
                </div>
                </div>

                <div data-note-content class="show-content">
                    <div class="show-content-free">
                        ${artical.content}
                    </div>
                </div>
            </div>
        </div>
        <div class="vue-side-tool" props-data-props-show-qr-code="0"></div>
    </div>

</div>

<script type="text/javascript" src="../views/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../views/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../views/js/jquery.lazyload.min.js"></script>

<script>
    $('img.lazy').lazyload();
</script>
</body>
</html>