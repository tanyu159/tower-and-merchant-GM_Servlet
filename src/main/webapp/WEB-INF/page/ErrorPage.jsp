<%--
  Created by IntelliJ IDEA.
  User: Zuikaku
  Date: 2019/6/4
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>发生错误</title>
</head>
<body>
    错误信息为:<%=exception.getMessage()%>
    <a href="/welcome">去主页</a>
    <a href="/login">去登录</a>
    <a href="#">去注册</a>

</body>
</html>
