<%@ page import="com.zuikaku.javabean.User" %>
<%@ page import="com.zuikaku.javabean.UserSave" %>
<%@ page import="com.zuikaku.exception.NoLoginExeception" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>个人信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/images/favicon.png">
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/Resources/PersonalDataPage/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="${pageContext.request.contextPath}/Resources/PersonalDataPage/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
<%
//String isChanged=request.getParameter("isChanged");
User user=(User) session.getAttribute("user");
UserSave userSave=(UserSave) session.getAttribute("userSave");
if(user==null||userSave==null)
{
    throw new NoLoginExeception("没有登录");
}


%>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar">
            <nav class="navbar top-navbar navbar-toggleable-sm navbar-light">
                <!-- ============================================================== -->
                <!-- Logo -->
                <!-- ============================================================== -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html">
                        <!-- Logo icon --><b>
                            <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                            
                            <!-- Light Logo icon -->
                            <img src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                        </b>
                        <!--End Logo icon -->
                        <!-- Logo text --><span>
                         
                         <!-- Light Logo text -->    
                         <img src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                </div>
                <!-- ============================================================== -->
                <!-- End Logo -->
                <!-- ============================================================== -->
                <div class="navbar-collapse">
                    <!-- ============================================================== -->
                    <!-- toggle and nav items -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav mr-auto mt-md-0">
                        <!-- This is  -->
                        <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                        <!-- ============================================================== -->
                        <!-- Search -->
                        <!-- ============================================================== -->
<%--                        <li class="nav-item hidden-sm-down search-box"> <a class="nav-link hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-search"></i></a>--%>
<%--                            <form class="app-search">--%>
<%--                                <input type="text" class="form-control" placeholder="Search & enter"> <a class="srh-btn"><i class="ti-close"></i></a> </form>--%>
<%--                        </li>--%>
                    </ul>
                    <!-- ============================================================== -->
                    <!-- User profile and search -->
                    <!-- ============================================================== -->
                    <ul class="navbar-nav my-lg-0">
                        <!-- ============================================================== -->
                        <!-- Profile -->
                        <!-- ============================================================== -->
                        <li class="nav-item dropdown">
                            <a id="topRightText" class="nav-link dropdown-toggle text-muted waves-effect waves-dark"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar">
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav">
                    <ul id="sidebarnav">
                        <li> <a class="waves-effect waves-dark" href="/user/userSave" aria-expanded="false"><i class="mdi mdi-gauge"></i><span class="hide-menu">游戏数据</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="/user" aria-expanded="false"><i class="mdi mdi-account-check"></i><span class="hide-menu">个人信息</span></a>
                        </li>
                        <li> <a class="waves-effect waves-dark" href="/admin/serverList" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">服务器列表</span></a>
                        </li>

                    </ul>
                    <div class="text-center m-t-30">
<%--                        <a  class="btn waves-effect waves-light btn-warning hidden-md-down"> 你当前的身份</a>--%>
                    </div>
                </nav>
                <!-- End Sidebar navigation -->
            </div>
            <!-- End Sidebar scroll-->
            <!-- Bottom points-->
            <div class="sidebar-footer">


                <!-- item--><a href="/welcome" class="link" data-toggle="tooltip" title="注销"><i class="mdi mdi-power"></i></a> </div>
            <!-- End Bottom points-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">个人信息</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">后台</a></li>
                            <li class="breadcrumb-item active">个人信息</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
<%--                        <a href="#" class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down"> Upgrade to Pro</a>--%>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">

                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <div class="card-block">
<%--                                修改个人信息表单提交--%>
                                <form action="/user" name="personalInfoForm" class="form-horizontal form-material" method="post" >
                                    <div class="form-group">
                                        <label for="userid" class="col-md-12">id</label>
                                        <div class="col-md-12">
                                            <input name="userid" id="userid" type="text" class="form-control form-control-line" readonly="readonly" value="${sessionScope.user.id}">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="col-md-12">电子邮件/登录账号</label>
                                        <div class="col-md-12">
                                            <input id="email" type="email" class="form-control form-control-line" readonly="readonly" value="${sessionScope.user.email}" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname" class="col-md-12">游戏内昵称</label>
                                        <div class="col-md-12">
                                            <input name="nickname" id="nickname" type="text" class="form-control form-control-line" value="${sessionScope.userSave.nickname}" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-md-12">密码</label>
                                        <div class="col-md-12">
                                            <input name="password" id="password" type="password" value="${sessionScope.user.password}" class="form-control form-control-line" >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="idCard" class="col-md-12">身份证账号</label>
                                        <div  class="col-md-12">
                                            <input id="idCard" type="text"  class="form-control form-control-line" readonly="readonly" value="${sessionScope.user.idcard}">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <button  type="button" class="btn btn-success" onclick="updatePersonalInfo()">提交更改</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>

            </div>

        </div>

    </div>

    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/plugins/bootstrap/js/tether.min.js"></script>
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <!--Custom JavaScript -->
    <script src="${pageContext.request.contextPath}/Resources/PersonalDataPage/js/custom.min.js"></script>
    <script type="text/javascript">
        //修改后结果显示
        if("${param.isChanged}"==="true")
        {
            window.alert("修改成功");
        }else if("${requestScope.get("isChanged")}"==="false")
        {
            window.alert("修改失败");
        }


        // 右上角的登录身份
        var topRightNode=document.getElementById("topRightText");
        //todo 暂时不考虑root超级用户的登录

        var isAdmin=${sessionScope.user.admin};
        if(isAdmin)
        {
            console.log("管理员登录");
            topRightNode.innerText="管理员";
        }else{
            console.log("普通玩家登录");
            topRightNode.innerText="普通玩家";
            //$(".hide-menu:eq(2)").attr("style","display:none;");//普通玩家是看不到后台的
            $(".mdi mdi-table").remove();
            //$("#sidebarnav:nth-child(2)").clear();//无效

        }

        //提交个人信息修改
        function updatePersonalInfo() {
             personalInfoForm.submit();

        }

    </script>
</body>

</html>
