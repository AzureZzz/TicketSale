<%--
  Created by IntelliJ IDEA.
  User: 王涛
  Date: 2018/5/7
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setBundle basename="config" var="config" />
<fmt:message key="busURL" var="busURL" bundle="${config}" />
<fmt:message key="trainURL" var="trainURL" bundle="${config}" />
<fmt:message key="billURL" var="billURL" bundle="${config}" />
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  ${busURL}
  ${trainURL}
  </body>
  <script>
    window.onload = function (ev) { alert('${billURL}') }
  </script>
</html>
