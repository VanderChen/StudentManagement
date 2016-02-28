package StudentManagement.servlet;

import java.io.*;
import StudentManagement.JavaBean.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;



/**
 * Created by VanderChen on 2016/2/13.
 */
public class HandleRegister extends HttpServlet {
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }

    public String handleString(String s)
    {
        try{
            byte bb[] = s.getBytes("iso-8859-1");
            s = new String(bb);
        }
        catch (Exception ee){}
        return s;
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String uri = "jdbc:mysql://127.0.0.1/student?"+"user=root&password=root";
        Connection con;
        PreparedStatement sql;
        Register userBean = new Register();
        request.setAttribute("userBean",userBean);
        String logName = request.getParameter("logName").trim();
        String password = request.getParameter("password").trim();
        String againPassword = request.getParameter("againPassword").trim();
        String email = request.getParameter("email").trim();
        java.util.Date presentDate = new java.util.Date();
        java.sql.Date birthday = new java.sql.Date(presentDate.getTime());
        if(logName == null)
            logName = "";
        if(password == null)
            password = "";
        if(!password.equals(againPassword)){
            userBean.setBackInfo("The new and confirmed passwords do not match. Register failed!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/backInfo.jsp");
            dispatcher.forward(request,response);
            return;
        }
        /*boolean isLD = true;
        for(int i = 0;i < logName.length();i++){
            char c = logName.charAt(i);
            if(!(c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0'))
                isLD = false;
        }*/
        boolean boo = logName.length()>0&&password.length()>0;
        String backInfo = "";
        try{
            con = DriverManager.getConnection(uri);
            String insertConditon = "INSERT INTO user VALUES(?,?,?,?)";
            sql = con.prepareStatement(insertConditon);
            if(boo)
            {
                sql.setString(1,handleString(logName));
                sql.setString(2,handleString(password));
                sql.setString(3,handleString(email));
                sql.setString(4,"0");
                int m = sql.executeUpdate();
                if(m!=0){
                    backInfo = "Register Successfully! You can sign in now! Please back to homepage to sian in!";
                    userBean.setBackInfo(backInfo);
                    userBean.setLogName(logName);
                    userBean.setEmail(handleString(email));
                }
                insertConditon = "INSERT INTO information VALUES(?,?,?,?,?,?)";
                sql = con.prepareStatement(insertConditon);
                sql.setString(1,handleString(logName));
                sql.setString(2,"");
                sql.setString(3,"");
                sql.setString(4,"");
                sql.setDate(5,birthday);
                sql.setString(6,"");
                m = sql.executeUpdate();
            }
            else {
                backInfo = "Information is incompleted or used illegal character";
                userBean.setBackInfo(backInfo);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/backInfo.jsp");
                dispatcher.forward(request,response);
                return;
            }
            con.close();
        }
        catch (SQLException exp){
            backInfo = "This user name has been used! Please change your name or Can't connect to the database!";
            userBean.setBackInfo(backInfo);
            try {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/backInfo.jsp");
                dispatcher.forward(request,response);
                return;
            }
            catch (Exception e){}
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/backInfo.jsp");
        dispatcher.forward(request,response);
        return;
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doPost(request,response);
    }
}
