package StudentManagement.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.*;
import StudentManagement.JavaBean.*;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Created by Vander on 2016/2/27.
 */
public class HandleInformation extends HttpServlet {
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }
    public java.util.Date strToDate(String s){
        java.util.Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date= sdf.parse(s);
        }
        catch (ParseException e){}
        return date;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login loginInfo = (Login)request.getSession().getAttribute("loginBean");
        String uri = "jdbc:mysql://127.0.0.1/student?"+"user=root&password=root";
        Connection con;
        PreparedStatement sql;
        String logName = loginInfo.getLogName();
        String name = request.getParameter("name").trim();
        String gender = request.getParameter("gender").trim();
        String phoneNumber = request.getParameter("phoneNumber").trim();
        String tempDate = request.getParameter("birthday");
        java.util.Date date= strToDate(tempDate);
        java.sql.Date birthday = new java.sql.Date(date.getTime());
        String address = request.getParameter("address").trim();
        try {
            con = DriverManager.getConnection(uri);
            String insertCondition = new StringBuilder().append("UPDATE information SET logName = '").append(logName)
                                                        .append("', name = '").append(name)
                                                        .append("', gender = '").append(gender)
                                                        .append("', phoneNumber = '").append(phoneNumber)
                                                        .append("', birthday = '").append(birthday)
                                                        .append("', address = '").append(address)
                                                        .append("' WHERE logName='").append(logName).append("'").toString();
            sql = con.prepareStatement(insertCondition);
            /*sql.setString(1,logName);
            sql.setString(2,name);
            sql.setString(3,gender);
            sql.setString(4,phoneNumber);
            sql.setDate(5,birthday);
            sql.setString(6,address);*/
            sql.execute();
            con.close();
        }
        catch (SQLException e){
            loginInfo.setBackInfo(e.toString());
            RequestDispatcher dispatcher = request.getRequestDispatcher("personalInformation.jsp");
            dispatcher.forward(request,response);
        }
        HttpSession session = request.getSession(true);
        BasicInfo basicInfo;
        basicInfo = (BasicInfo) session.getAttribute("basicInfo");
        if(basicInfo == null){
            basicInfo = new BasicInfo();
            session.setAttribute("basicInfo",basicInfo);
            basicInfo = (BasicInfo) session.getAttribute("basicInfo");
        }
        basicInfo.setLogName(logName);
        basicInfo.setName(name);
        basicInfo.setGender(gender);
        basicInfo.setPhoneNumber(phoneNumber);
        basicInfo.setBirthDate(birthday);
        basicInfo.setAddress(address);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/chooseDatabase.jsp");
        dispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
