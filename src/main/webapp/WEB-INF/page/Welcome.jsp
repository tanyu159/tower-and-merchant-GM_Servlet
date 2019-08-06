<%--
  Created by IntelliJ IDEA.
  User: zuikaku
  Date: 2019/6/4
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>
    欢迎进入箭塔与商人GM系统
</title>
<style type="text/css">
    body{
        background-image: url("${pageContext.request.contextPath}/Resources/index/indexBG.jpeg");
        background-size: 100% 100%;
    }
    .center-text{
        text-align: center;
        font-weight: 200;
        font-size: 99px;
        color: white;
    }
    .centerContent
    {
        position: absolute;
        top: 200px;
        left: 700px;
        width: 500px;
        height: 300px;
    // border: red 3px solid;
    }
    .registerBtn{
        text-align: center;
        background-color:rgb(46,188,79);
        color: white;
        font-size: 22px;
        border-radius: 5px;
        text-decoration: none;
        position: absolute;
        left: 300px;
        width: 100px;
        height: 60px;
        line-height: 60px;
        border: none;
        outline: none;    //消除默认点击蓝色边框效果

    }
    .loginBtn{
        text-align: center;
        background-color:rgb(46,188,79);
        color: white;
        font-size: 22px;
        border-radius: 5px;
        position: absolute;
        left: 100px;
        width: 100px;
        height: 60px;
        text-decoration: none;
        line-height: 60px;
        border: none;
        outline: none;    //消除默认点击蓝色边框效果

    }
    .loginBtn:hover{
        background-color: white;
        color:rgb(46,188,79) ;
    }
    .registerBtn:hover{
        background-color: white;
        color:rgb(46,188,79) ;
    }
</style>
<body>
<%
    String isSuccessful=request.getParameter("isSuccessful");
%>
<div class="centerContent">
    <p class="center-text">箭塔与商人GM系统</p>
    <a href="${pageContext.request.contextPath}/register" class="registerBtn" >注册</a>
    <a href="${pageContext.request.contextPath}/login" class="loginBtn">登录</a>
</div>
</body>
<script type="text/javascript">
    var registerIsSuccessful="<%=isSuccessful%>";
    if(registerIsSuccessful==="true")
    {
        window.alert("注册成功");
    }else if(registerIsSuccessful==="false")
    {
        window.alert("注册失败");
    }


    var centerText=document.getElementsByClassName("center-text");
    scaleAnimationBig(centerText[0]);
    function scaleAnimationBig(obj) {
        var scaleStart=1;
        var set=setInterval(function () {
            scaleStart+=0.001;
            //console.log("变大中"+scaleStart);
            obj.style.transform='scale('+scaleStart+')';
            if(scaleStart>=1.5)
            {
                clearInterval(set);
                // 变大结束，开始变小
                //console.log("开始变小");
                scaleAnimationSmall(obj);
            }

        },10)
    }

    function scaleAnimationSmall(obj) {
        var scaleStart=1.5;
        var set=setInterval(function () {
            scaleStart-=0.001;
            //console.log("变小中"+scaleStart);
            obj.style.transform='scale('+scaleStart+')';
            if(scaleStart<=1)
            {
                clearInterval(set);
                // 变小结束，开始变大
                scaleAnimationBig(obj);
                //console.log("开始变大");
            }

        },10)

    }


</script>
</html>
