<%--
  Created by IntelliJ IDEA.
  User: Vander
  Date: 2016/2/24
  Time: 2:42
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <jsp:useBean id="basicInfo" class="StudentManagement.JavaBean.BasicInfo" scope="session" />
        <html lang="en" class=" js no-touch csstransitions">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta charset="utf-8">
            <title>Student Management</title>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/font-awesome.css" rel="stylesheet">
            <link href="css/animations.css" rel="stylesheet">
            <link href="css/style.css" rel="stylesheet">
            <link href="css/custom.css" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.2.0/css/font-awesome.min.css" />
            <link rel="stylesheet" type="text/css" href="css/set2.css" />
        </head>

        <body class="no-trans scroll-spy">
            <header class="header fixed clearfix navbar navbar-fixed-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="header-left clearfix">
                                <div class="logo smooth-scroll">
                                    <a href="###"><img id="logo" src="img/logo60.png" alt="SM" style="height:60px;width:60px"></a>
                                </div>
                                <div class="site-name-and-slogan smooth-scroll">
                                    <div class="site-name"><a href="http://www.jq22.com/demo/worthy20160222/#banner">SM</a></div>
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
                                                    <li class="active"><a>Hello!</a></li>
                                                    <li class="">
                                                        <a>
                                                            <jsp:getProperty name="basicInfo" property="logName" />
                                                        </a>
                                                    </li>
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
                    <div class="backstretch" style="left: 0px; top: 0px; overflow: hidden; margin: 0px; padding: 0px; height: 100%; width: 1903px; z-index: -999998; position: absolute;">
                        <img src="img/banner.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width: 1903px; max-height: none; max-width: none; z-index: -999999; left: 0px; top: -189.869px;">
                    </div>
                </div>
                <div class="banner-caption">
                    <div class="container">
                        <section class="htmleaf-content">
                            <h2>Personal Information</h2>
                            <form action="handleInformation" method="post">
                                <span class="input input--nariko">
					<input class="input__field input__field--nariko" type="text" id="input-20"  name="name" value='<jsp:getProperty name="basicInfo" property="name"/>'/>
					<label class="input__label input__label--nariko" for="input-20">
                        <span class="input__label-content input__label-content--nariko">True Name</span>
                                </label>
                                </span>
                                <span class="input input--nariko">
					<input class="input__field input__field--nariko" type="text" id="input-21"  name="gender" />
					<label class="input__label input__label--nariko" for="input-21">
                        <span class="input__label-content input__label-content--nariko">Gender</span>
                                </label>
                                </span>
                                <span class="input input--nariko">
					<input class="input__field input__field--nariko" type="text" id="input-22"  name="phoneNumber" value='<jsp:getProperty name="basicInfo" property="phoneNumber"/>'/>
					<label class="input__label input__label--nariko" for="input-22">
                        <span class="input__label-content input__label-content--nariko">Phone Number</span>
                                </label>
                                </span>
                                <span class="input input--nariko">
					<input class="input__field input__field--nariko" type="text" id="input-22" name="birthday" value='<jsp:getProperty name="basicInfo" property="birthDate"/>'/>
					<label class="input__label input__label--nariko" for="input-22">
                        <span class="input__label-content input__label-content--nariko">Birthday(ex.YYYY-MM-DD)</span>
                                </label>
                                </span>
                                <span class="input input--nariko">
					<input class="input__field input__field--nariko" type="text" id="input-22" name="address" value='<jsp:getProperty name="basicInfo" property="address"/>'/>
					<label class="input__label input__label--nariko" for="input-22">
                        <span class="input__label-content input__label-content--nariko">Address</span>
                                </label>
                                </span>
                                <span>
				    <input type="submit" name="g" value="Submit" class="btn btn-default"/>
				</span>
                            </form>
                        </section>
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
                <script type="text/javascript" src="js/jquery.min(1).js"></script>
                <script type="text/javascript" src="js/bootstrap.min.js"></script>
                <script type="text/javascript" src="js/modernizr.js"></script>
                <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
                <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
                <script type="text/javascript" src="js/jquery.appear.js"></script>
                <script type="text/javascript" src="js/template.js"></script>
                <script type="text/javascript" src="js/custom.js"></script>
        </body>

        </html>