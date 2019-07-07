<%@ page import="com.zuikaku.javabean.UserSave" %>
<%@ page import="com.zuikaku.javabean.User" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: zuikaku
  Date: 19-4-17
  Time: 下午3:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path=request.getContextPath();
    request.setAttribute("path",path);
%>
<html>
<head>
    <title>游戏数据</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${path}/Resources/PersonalDataPage/assets/images/favicon.png">
    <title></title>
    <!-- Bootstrap Core CSS -->
    <link href="${path}/Resources/PersonalDataPage/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${path}/Resources/PersonalDataPage/css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="${path}/Resources/PersonalDataPage/css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
<%
    String isChanged=request.getParameter("isChanged");
    User user=(User) session.getAttribute("user");
    UserSave userSave=(UserSave) session.getAttribute("userSave");
    boolean isAdmin=user.isAdmin();
    byte baseLevel=userSave.getBaselevel();
    int coins=userSave.getCoin();
    int diamonds=userSave.getDiamond();


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
                    <img src="${path}/Resources/PersonalDataPage/assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                </b>
                    <!--End Logo icon -->
                    <!-- Logo text --><span>

                         <!-- Light Logo text -->
                         <img src="${path}/Resources/PersonalDataPage/assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
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
                    <li> <a class="waves-effect waves-dark" href="table-basic.html" aria-expanded="false"><i class="mdi mdi-table"></i><span class="hide-menu">玩家列表</span></a>
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
                    <h3 class="text-themecolor m-b-0 m-t-0">游戏数据</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">后台</a></li>
                        <li class="breadcrumb-item active">游戏数据</li>
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
                            <%--修改游戏数据表单提交--%>
                            <form action="/user/userSave" name="personalInfoForm" class="form-horizontal form-material" method="post">
                                <div class="form-group">
                                    <label for="baseLevel" class="col-md-12">等级</label>
                                    <div class="col-md-12">
                                        <input name="baseLevel" id="baseLevel" type="text" class="form-control form-control-line" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="coins" class="col-md-12">银币</label>
                                    <div class="col-md-12">
                                        <input name="coins" id="coins" type="text" class="form-control form-control-line"  >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="diamonds" class="col-md-12">钻石</label>
                                    <div class="col-md-12">
                                        <input name="diamonds" id="diamonds" type="text" class="form-control form-control-line" >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button  type="button" class="btn btn-success" onclick="updateGameData()">提交更改</button>
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

<script src="${path}/Resources/PersonalDataPage/assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="${path}/Resources/PersonalDataPage/assets/plugins/bootstrap/js/tether.min.js"></script>
<script src="${path}/Resources/PersonalDataPage/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="${path}/Resources/PersonalDataPage/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="${path}/Resources/PersonalDataPage/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${path}/Resources/PersonalDataPage/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="${path}/Resources/PersonalDataPage/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="${path}/Resources/PersonalDataPage/js/custom.min.js"></script>
<script type="text/javascript">
    //修改结果显示
    console.log("<%=isChanged%>");
    if("<%=isChanged%>"==="false")
    {
        window.alert("修改失败");

    }else if("<%=isChanged%>"==="true") {
        window.alert("修改成功");
    }


    // 登录后回显示数据[数据表单]
    var baseLevelNode=document.getElementById("baseLevel");
    var coinsNode=document.getElementById("coins");
    var diamondsNode=document.getElementById("diamonds");
    baseLevelNode.value="<%=baseLevel%>";
    coinsNode.value="<%=coins%>";
    diamondsNode.value="<%=diamonds%>";
    <%--idNode.value="<%=userid%>";--%>
    <%--emailNode.value="<%=email%>";--%>
    <%--nickNameNode.value="<%=nickName%>";--%>
    <%--passwordNode.value="<%=password%>";--%>
    <%--idCardNode.value="<%=idCard%>";--%>
    // 右上角的登录身份
    var topRightNode=document.getElementById("topRightText");

    console.log(<%=isAdmin%>);
    if(<%=isAdmin%>)
    {
        console.log("管理员登录");
        topRightNode.innerText="管理员";
    }else{
        console.log("普通玩家登录");
        topRightNode.innerText="普通玩家";
    }

    //提交个人信息修改
    function updateGameData() {
        if(<%=isAdmin%>) {
            personalInfoForm.submit();
        }else {
            window.alert("非管理员不可更改");

        }

    }

</script>
</body>

</html>