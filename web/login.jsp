<%--
  Created by IntelliJ IDEA.
  User: Vander
  Date: 2016/2/13
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <link rel="stylesheet" type="text/css" href="css/popup.css" />
        </head>

        <body class="no-trans scroll-spy">

            <header class="header fixed clearfix navbar navbar-fixed-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="header-left clearfix">
                                <div class="logo smooth-scroll">
                                    <a href=""><img id="logo" src="img/logo60.png" alt="SM" style="height:60px;width:60px"></a>
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
                                                <ul class="nav navbar-nav navbar-right">
                                                    <li class="active"><a href="">Home</a></li>
                                                    <li class=""><a id="tst" rel="popup_name" class="btn" href="#" role="button">Sign in</a></li>
                                                    <li><a id="tst2" rel="popup_name2" class="btn" href="#" role="button">Without a acount? Sign up</a></li>
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
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2 object-non-visible animated object-visible fadeIn" data-animation-effect="fadeIn">
                                <h1 class="text-center">Student <span>Management</span></h1>
                                <p class="lead text-center">Life isn't about waiting for the storm to pass, it's about learning to dance in the rain.</p>
                            </div>
                            <div class="popup">
                                <div id="popup_name" class="popup_block">
                                    <div class="popup_head">
                                        <h2>Sign in</h2>
                                    </div>
                                    <div class="popup_body">
                                        <form class="form-signin" action="loginServlet" method="post">
                                            <label for="logName" class="sr-only">User Name</label>
                                            <input type="text" name="logName" id="logName1" class="form-control" placeholder="User Name" required autofocus>
                                            <label for="inputPassword" class="sr-only">Password</label>
                                            <input type="password" name="password" id="inputPassword1" class="form-control" placeholder="Password" required>
                                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="g" value="Submit">Sign in</button>
                                        </form>
                                    </div>
                                </div>
                                <div id="popup_name2" class="popup_block">
                                    <div class="popup_head">
                                        <h2>Sign up</h2>
                                    </div>
                                    <div class="popup_body">
                                        <form class="form-signin" action="helpRegister" method="post" name="form">
                                            <h2 class="form-signin-heading" id="signin-title">User Register</h2>
                                            <label for="logName" class="sr-only">User Name</label>
                                            <input type="text" name="logName" id="logName" class="form-control" placeholder="User Name" required autofocus>
                                            <label for="inputPassword" class="sr-only">Password</label>
                                            <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                            <label for="againPassword" class="sr-only">Confirmed Password</label>
                                            <input type="password" name="againPassword" id="againPassword" class="form-control" placeholder="Confirmed Password" required>
                                            <label for="email" class="sr-only">Email</label>
                                            <input type="email" name="email" id="email" class="form-control" placeholder="Email">
                                            <button class="btn btn-lg btn-primary btn-block" type="submit" name="g" value="Submit">Register</button>
                                        </form>
                                    </div>
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
            <script type="text/javascript" src="js/jquery.min(1).js"></script>
            <script type="text/javascript" src="js/bootstrap.min.js"></script>
            <script type="text/javascript" src="js/modernizr.js"></script>
            <script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
            <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
            <script type="text/javascript" src="js/jquery.appear.js"></script>
            <script type="text/javascript" src="js/template.js"></script>
            <script type="text/javascript" src="js/custom.js"></script>
            <script src="js/popup.js"></script>
            <script src="js/script.js"></script>
        </body>

        </html>