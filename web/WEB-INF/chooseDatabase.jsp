<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <jsp:useBean id="loginBean" class="StudentManagement.JavaBean.Login" scope="session" />
    <html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Student Management</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../css/bootstrap.css" rel="stylesheet">
        <link href="../css/font-awesome.css" rel="stylesheet">
        <link href="../css/animations.css" rel="stylesheet">
        <link href="../css/style.css" rel="stylesheet">
        <link href="../css/custom.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../css/popup.css" />
        <link rel="stylesheet" type="text/css" href="../css/style-choose.css" />
    </head>

    <body class="no-trans scroll-spy">
        <header class="header fixed clearfix navbar navbar-fixed-top">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="header-left clearfix">
                            <div class="logo smooth-scroll">
                                <a href="###"><img id="logo" src="../img/logo60.png" alt="SM" style="height:60px;width:60px"></a>
                            </div>
                            <div class="site-name-and-slogan smooth-scroll">
                                <div class="site-name"><a href="#">SM</a></div>
                                <div class="site-slogan">Student Management</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="header-right clearfix">
                            <div class="main-navigation animated">
                                <nav class="navbar navbar-default" role="navigation">
                                    <div class="container-fluid">
                                        <div class="navbar-header">
                                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                            </button>
                                        </div>
                                        <div class="collapse navbar-collapse scrollspy smooth-scroll" id="navbar-collapse-1">
                                            <ul class="nav navbar-nav navbar-right">
                                                <li class="active"><a href="#">Home</a></li>
                                                <li class=""><a>Welcome!</a></li>
                                                <li>
                                                    <a>
                                                        <jsp:getProperty name="loginBean" property="logName" />
                                                    </a>
                                                </li>
                                                <li><a href="javascript:;" onclick="submitForm('logout');">Logout</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div id="banner" class="banner">
            <div class="banner-image" style="position: relative; z-index: 0; background: none;">
                <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 100%; width: 1903px; z-index: -999998; position: absolute;"><img src="../img/banner.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1903px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -189.869px;"></div>
            </div>
            <div class="banner-caption">
                <div class="container">
                    <div id="va-accordion" class="va-container">
                        <div class="va-nav">
                            <span class="va-nav-prev">Previous</span>
                            <span class="va-nav-next">Next</span>
                        </div>
                        <div class="va-wrapper" style="background:#f9e830;">
                            <div class="va-slice va-slice-1">
                                <h3 class="va-title">Manager Your Profile</h3>
                                <div class="va-content">
                                    <%--<button class="btn btn-default" onclick="javascript:window.location.href='personalInformation.jsp';">Go To Manager</button>--%>
                                        <form action="toPersonalInfo" method="post">
                                            <input type="submit" class="btn btn-default" value="Go To Manager">
                                        </form>
                                </div>
                            </div>
                            <div class="va-slice va-slice-2">
                                <h3 class="va-title">Manager User's Information</h3>
                                <div class="va-content">
                                    <form action="helpReadRecord" method="post" name="form">
                                        <input type="hidden" value="student" name="databaseName" />
                                        <input type="hidden" value="information" name="tableName" />
                                        <input type="submit" class="btn btn-default" value="View Detail&raquo;" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="subfooter">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <p class="text-center">Copyright © 2016</p>
                        </div>
                    </div>
                </div>
            </div>
            </footer>
            <script type="text/javascript" src="../js/jquery.min(1).js"></script>
            <script type="text/javascript" src="../js/bootstrap.min.js"></script>
            <script type="text/javascript" src="../js/modernizr.js"></script>
            <script type="text/javascript" src="../js/isotope.pkgd.min.js"></script>
            <script type="text/javascript" src="../js/jquery.backstretch.min.js"></script>
            <script type="text/javascript" src="../js/jquery.appear.js"></script>
            <script type="text/javascript" src="../js/template.js"></script>
            <script type="text/javascript" src="../js/custom.js"></script>
            <script src="../js/popup.js"></script>
            <script src="../js/script.js"></script>
            <script src="http://libs.baidu.com/jquery/1.6.4/jquery.min.js"></script>
            <script type="text/javascript" src="../js/jquery.easing.1.3.js"></script>
            <script type="text/javascript" src="../js/jquery.mousewheel.js"></script>
            <script type="text/javascript" src="../js/jquery.vaccordion.js"></script>
            <script type="text/javascript">
                $(function () {
                    $('#va-accordion').vaccordion({
                        expandedHeight: 350,
                        animSpeed: 400,
                        animOpacity: 0.7,
                        visibleSlices: 2
                    });
                });
            </script>

            <form action="helpLogout" method="post" id="logout"></form>
            <script type="text/javascript">
                function submitForm(key) {
                    document.getElementById(key).submit();
                }
            </script>
    </body>

    </html>