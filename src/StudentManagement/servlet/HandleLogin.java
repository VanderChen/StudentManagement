package StudentManagement.servlet;

import StudentManagement.JavaBean.*;
import com.sun.rowset.CachedRowSetImpl;

import java.sql.*;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Created by Vander on 2016/2/14.
 */
public class HandleLogin extends HttpServlet {
    public void init(ServletConfig config) throws ServletException{
        super.init(config);
        try{
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
    public java.util.Date strToDate(String s){
        java.util.Date date = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            date= sdf.parse(s);
        }
        catch (ParseException e){}
        return date;
    }
    public void setInfoBean(String logName,HttpServletRequest request){
        Connection con;
        String uri = "jdbc:mysql://127.0.0.1/student?user=root&password=root";
        CachedRowSetImpl rowSet = null;
        try {
            /*int fieldCount = 0;*/
            con = DriverManager.getConnection(uri);
            /*DatabaseMetaData metaData = con.getMetaData();*/
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            String select = "select * from information where logName = '"+ logName +"'";
            ResultSet rs = sql.executeQuery(select);
            rowSet = new CachedRowSetImpl();
            rowSet.populate(rs);
            con.close();
            int m = rowSet.getRow();
            rowSet.next();
            for(int k = 1;k<=m;k++)
                System.out.println(rowSet.getString(k));
            HttpSession session = request.getSession(true);
            BasicInfo basicInfo;
            basicInfo = (BasicInfo) session.getAttribute("basicInfo");
            if(basicInfo == null){
                basicInfo = new BasicInfo();
                session.setAttribute("basicInfo",basicInfo);
                basicInfo = (BasicInfo) session.getAttribute("basicInfo");
            }
            basicInfo.setLogName(logName);
            basicInfo.setName(rowSet.getString(2));
            basicInfo.setGender(rowSet.getString(3));
            basicInfo.setPhoneNumber(rowSet.getString(4));
            basicInfo.setBirthDate(rowSet.getDate(5));
            basicInfo.setAddress(rowSet.getString(6));
        }
        catch (Exception exp){
            System.out.print(exp);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
        Statement sql;
        String logName = request.getParameter("logName").trim();
        String password = request.getParameter("password").trim();
        logName = handleString(logName);
        password = handleString(password);
        String uri = "jdbc:mysql://127.0.0.1/student?"+"user=root&password=root";
        boolean boo = (logName.length()>0)&&(password.length()>0);
        try{
            con = DriverManager.getConnection(uri);
            String condition = "select * from user where logName = '"+ logName +"'and password ='"+ password +"'";
            sql = con.createStatement();
            if(boo){
                ResultSet rs = sql.executeQuery(condition);
                boolean m = rs.next();
                int isAdmin = rs.getInt(4);
                if(m == true){
                    success(request,response,logName,password,isAdmin);
                    if(isAdmin == 1){
                        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/chooseDatabaseforAdmin.jsp");
                        dispatcher.forward(request,response);
                        return;
                    }
                    else{
                        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/chooseDatabase.jsp");
                        dispatcher.forward(request,response);
                        return;
                    }
                }
                else {
                    String backInfo = "Incorrect password or account does not exist!";
                    fail(request,response,logName,backInfo);
                }
            }
            else {
                String backInfo = "Please input your name and password!";
                fail(request,response,logName,backInfo);
            }
            con.close();
        }
        catch (SQLException exp){
            String backInfo = "" + exp;
            fail(request,response,logName,backInfo);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
    public void success(HttpServletRequest request,HttpServletResponse response,String logName,String password,int isAdmin){
        Login loginBean;
        HttpSession session = request.getSession(true);
        try{
            loginBean = (Login)session.getAttribute("loginBean");
            if(loginBean == null){
                loginBean = new Login();
                session.setAttribute("loginBean",loginBean);
                loginBean = (Login)session.getAttribute("loginBean");
            }
            String name = loginBean.getLogName();
            if(name.equals(logName))
            {
                loginBean.setBackInfo(logName+" has been logged in!");
                loginBean.setLogName(logName);
                loginBean.setIsAdmin(isAdmin);
            }
            else {
                loginBean.setBackInfo(logName+" logged in successfully!");
                loginBean.setLogName(logName);
                loginBean.setIsAdmin(isAdmin);
            }
        }
        catch (Exception ee){
            loginBean = new Login();
            session.setAttribute("loginBean",loginBean);
            loginBean.setBackInfo(logName + " logged in successfully!");
            loginBean.setLogName(logName);
            loginBean.setIsAdmin(isAdmin);
        }
        setInfoBean(logName,request);
    }
    public void fail(HttpServletRequest request,HttpServletResponse response, String logName,String backInfo){
        try{
            Login loginBean = new Login();
            HttpSession session = request.getSession(true);
            session.setAttribute("loginBean",loginBean);
            logName = "";
            loginBean.setLogName(logName);
            loginBean.setBackInfo(backInfo);
            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/backInfo.jsp");
            dispatcher.forward(request,response);
            return;
        }
        catch (Exception exp){}
    }
}
