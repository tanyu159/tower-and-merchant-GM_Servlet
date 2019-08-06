<%--
  Created by IntelliJ IDEA.
  User: zuikaku
  Date: 19-3-29
  Time: 下午8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Resources/RegisterPage/styles.css">
<body>
<div class="htmleaf-container">
    <div class="wrapper">
        <div class="container">
            <h1>欢迎注册GM系统</h1>

            <form action="${pageContext.request.contextPath}/register" name="registerForm" class="Form" method="post">
                <input name="email" id="emailInput" type="text" placeholder="邮箱">
                <button type="button"  id="get-securityCode" >获取邮箱验证码</button>
                <p>&nbsp;</p>
                <input id="securityCodeInput" type="text" placeholder="邮箱验证码">
                <input name="password" id="passwordInput" type="password" placeholder="密码">
                <input id="repeatPasswordInput" type="password" placeholder="重复密码">
                <input name="idCard" id="idCardInput" type="text" placeholder="身份证号">
                <input name="adminCode" id="adminCodeInput" type="text" placeholder="管理员码(若有)">
                <button type="button" id="login-button" onclick="submitRegister()">注册</button>

            </form>
        </div>

        <ul class="bg-bubbles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

</body>
<script type="text/javascript">
    //注册监听按钮事件以及获得必要的节点
    var getSecurityCodeBtn=document.getElementById("get-securityCode");
    var emailInput=document.getElementById("emailInput");
    var securityCodeInput=document.getElementById("securityCodeInput");
    var passwordInput=document.getElementById("passwordInput");
    var repeatPasswordInput=document.getElementById("repeatPasswordInput");
    var idCardInput=document.getElementById("idCardInput");
    getSecurityCodeBtn.addEventListener("click",verifyEmail.bind(this,emailInput));
    //  再次载入该页面时回显数据【主要用于生成验证码后回来-不用再填邮箱，并且获得生成的验证码是啥】
    var email="${param.eamail}";//获取jsp中的值
    var securityCode="${cookie.emailSecurityCode.value}";//获取cookie中的值
    var isExist="${param.isExist}";
    //显示获取验证码结果
    if(isExist==="true")
    {
        window.alert("邮箱已经存在");
    }else if(isExist==="false")
    {
        window.alert("验证码已经下发到邮箱");
    }
    //  设置该节点的值
    if(email!=null&&email!==""&&email!=="null") {
        emailInput.value = email;
    }
    /**
     * 验证邮箱格式
     * @param emailInput
     */
    function verifyEmail(emailInput) {

        var emailRegex=/[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-zA-Z]+/;
        if(emailRegex.test(emailInput.value))
        {
            //  发送邮箱到获得验证码界面.将这个过程写在另一个jsp中
            window.location.href="${pageContext.request.contextPath}/spawnCode?email="+emailInput.value;
            //window.close();//关闭掉注册页面。实际部署时不能这样，网页将会关闭
        }else{
            window.alert("邮箱格式不正确");
        }
    }

    /**
     * 验证两次的密码是否相同，且密码强度是否相同
     * @param password
     * @param repeatPassword
     */
    function  verifyPassword(password,repeatPassword) {
        var passwordRegex=/[a-zA-Z0-9]{6,}/;//即密码必须大于6位，可以位任意的字母和数字
        if(passwordRegex.test(password))
        {
            if(password===repeatPassword){
                return true;
            }else {
                window.alert("两次密码不同");
                return false;
            }
        }else{
            window.alert("密码强度太弱，至少6位");
            return false;
        }
    }

    /**
     * 进行提交注册
     */
    function submitRegister() {
        //判断邮箱验证码是否为空
        if(securityCodeInput.value==null||securityCodeInput.value==="")
        {

            window.alert("邮箱验证码不能为空");

        }else {
            //检验两次密码是否相同
            var isSame=verifyPassword(passwordInput.value,repeatPasswordInput.value);
            if(isSame)
            {
                //判断邮箱验证码是否正确
                if(securityCodeInput.value===securityCode){
                    var regex=/[0-9]{17}[0-9X]/;
                    if(regex.test(idCardInput.value)) {
                        //window.alert("请求已提交");
                        registerForm.submit();
                    }else {
                        window.alert("身份证格式不正确");
                    }
                }else {
                    window.alert("邮箱验证码不正确");
                }

            }

        }
    }

</script>
</html>
