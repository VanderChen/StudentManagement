<%--
  Created by IntelliJ IDEA.
  User: Vander
  Date: 2016/2/21
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="StudentManagement.JavaBean.ShowRecordByPage" %>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta name="description" content="">
                <meta name="author" content="">
                <link rel="icon" href="../../favicon.ico">
                <title>Student Management</title>
                <link href="../css/bootstrap.min.css" rel="stylesheet">
                <link href="../css/dashboard.css" rel="stylesheet">
            </head>

            <body>
                <jsp:useBean id="database" type="StudentManagement.JavaBean.ShowRecordByPage" scope="session" />
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Project name</a>
                        </div>
                        <div id="navbar" class="navbar-collapse collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="javascript:;" onclick="submitForm('managerProfile');">Manager My Profile</a></li>
                                <li><a href="javascript:;" onclick="submitForm('logout');">Logout</a></li>
                            </ul>
                            <form class="navbar-form navbar-right" action="helpReadSelectedRecord" method="post" name="form">
                                <input type="text" class="form-control" name="require" placeholder="Search..." />
                                <input type="hidden" value="student" name="databaseName" />
                                <input type="hidden" value=<jsp:getProperty name="database" property="tableName" /> name="tableName"/>
                                <select name="fieldName">
                                    <option>in...</option>
                                    <jsp:getProperty name="database" property="presentTableNameResult" />
                                </select>
                                <input type="submit" value="Submit" class="btn btn-default" />
                            </form>
                        </div>
                    </div>
                </nav>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-3 col-md-2 sidebar">
                            <ul class="nav nav-sidebar">
                                <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
                                <li><a href="#">Reports</a></li>
                                <li><a href="#">Analytics</a></li>
                                <li><a href="#">Export</a></li>
                            </ul>
                        </div>
                        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                            <h1 class="page-header"><jsp:getProperty name="database" property="tableName"/></h1>
                            <jsp:getProperty name="database" property="formTitle" />
                            <jsp:getProperty name="database" property="presentPageResult" />
                            <table>
                                <tr>
                                    <td>
                                        <form action="helpReadRecord" method="post" name="form">
                                            <input type="hidden" value="previousPage" name="whichPage">
                                            <input class="btn btn-primary" type="submit" value="PreviousPage" name="submit">
                                        </form>
                                    </td>
                                    <td>
                                        <form action="helpReadRecord" method="post" name="form">
                                            <input type="hidden" value="nextPage" name="whichPage">
                                            <input class="btn btn-primary" type="submit" value="NextPage" name="submit">
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                </div>
                <form action="toPersonalInfo" method="post" id="managerProfile"></form>
                <form action="helpLogout" method="post" id="logout"></form>
                <script type="text/javascript">
                    function submitForm(key) {
                        document.getElementById(key).submit();
                    }
                </script>
                <script src="../js/jquery-1.11.3.min.js"></script>
                <script src="../js/bootstrap.min.js"></script>
            </body>

            </html>