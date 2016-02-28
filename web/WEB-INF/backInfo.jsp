<%--
  Created by IntelliJ IDEA.
  User: Vander
  Date: 2016/2/22
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <jsp:useBean id="userBean" class="StudentManagement.JavaBean.Register" scope="request" />
        <jsp:useBean id="loginBean" class="StudentManagement.JavaBean.Login" scope="session" />
        <html lang="en" class=" js no-touch csstransitions">

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
        </head>

        <body class="no-trans scroll-spy">

            <header class="header fixed clearfix navbar navbar-fixed-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="header-left clearfix">
                                <div class="logo smooth-scroll">
                                    <a href=""><img id="logo" src="../img/logo60.png" alt="SM" style="height:60px;width:60px"></a>
                                </div>
                                <div class="site-name-and-slogan smooth-scroll">
                                    <div class="site-name"><a href="###">SM</a></div>
                                    <div class="site-slogan">Student Management</div>
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
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 object-non-visible animated object-visible fadeIn" data-animation-effect="fadeIn">
                                <h1 class="text-center">Something <span>Wrong!</span></h1>
                                <p class="lead text-center">
                                    <jsp:getProperty name="loginBean" property="backInfo" />
                                </p>
                                <p class="lead text-center">
                                    <jsp:getProperty name="userBean" property="backInfo" />
                                </p>
                                <p class="lead text-center"><a href="../login.jsp">Back To Homepage!</a></p>
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
            <script type="text/javascript" src="../js/popup.js"></script>
            <script type="text/javascript" src="../js/script.js"></script>
        </body>

        </html>