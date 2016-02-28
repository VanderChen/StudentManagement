package StudentManagement.servlet;

import StudentManagement.JavaBean.Login;
import StudentManagement.JavaBean.ShowRecordByPage;
import com.sun.rowset.*;
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * Created by Vander on 2016/2/15.
 */

public class HandleDatabase extends HttpServlet {
    int fieldCount;
    CachedRowSetImpl rowSet = null;
    public void init(ServletConfig config)throws ServletException{
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection con;
        StringBuffer presentPageResult = new StringBuffer();
        ShowRecordByPage databaseBean = null;
        HttpSession session = request.getSession(true);
        try{
            databaseBean = (ShowRecordByPage)session.getAttribute("database");
            if(databaseBean == null){
                databaseBean = new ShowRecordByPage();
                session.setAttribute("database",databaseBean);
            }
        }
        catch (Exception exp){
            databaseBean = new ShowRecordByPage();
            session.setAttribute("database",databaseBean);
        }
        String databaseName = request.getParameter("databaseName");
        String tableName = request.getParameter("tableName");
        String ps = request.getParameter("pageSize");
        if(ps != null){
            try {
                int mm = Integer.parseInt(ps);
                databaseBean.setPagesize(mm);
            }
            catch (NumberFormatException exp){
                databaseBean.setPagesize(1);
            }
        }
        int showPage = databaseBean.getShowpage();
        int pageSize = databaseBean.getPagesize();
        boolean boo = (databaseName != null)&&(tableName != null)&&(databaseName.length()>0)&&(tableName.length()>0);
        if(boo){
            databaseBean.setDatabaseName(databaseName);
            databaseBean.setTableName(tableName);
            String uri = "jdbc:mysql://127.0.0.1/"+databaseName+"?user=root&password=root";
            try {
                fieldCount = 0;
                con = DriverManager.getConnection(uri);
                DatabaseMetaData metaData = con.getMetaData();
                ResultSet rs1 = metaData.getColumns(null,null,tableName,null);
                int k = 0;
                String field[] = new String[100];
                while (rs1.next()){
                    fieldCount++;
                    field[k] = rs1.getString(4);
                    k++;
                }
                StringBuffer str = new StringBuffer();
                StringBuffer str2 = new StringBuffer();
                str.append("<div class='table-responsive'>");
                str.append("<table class='table table-striped'>");
                str.append("<tr>");
                for(int i = 0;i<fieldCount;i++){
                    str.append("<th>"+field[i]+"</th>");
                    str2.append("<option value='"+field[i]+"'>"+field[i]+"<option/>");
                }
                str.append("</tr>");
                databaseBean.setFormTitle(str);
                databaseBean.setPresentTableNameResult(str2);
                Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
                ResultSet rs = sql.executeQuery("SELECT * FROM "+tableName);
                rowSet = new CachedRowSetImpl();
                rowSet.populate(rs);
                con.close();
                databaseBean.setRowSet(rowSet);
                rowSet.last();
                int m = rowSet.getRow();
                int n = pageSize;
                int pageAllCount = ((m%n)==0)?(m/n):(m/n+1);
                databaseBean.setPageAllCount(pageAllCount);
            }
            catch (SQLException exp){}
        }
        String whichPage = request.getParameter("whichPage");
        if(whichPage == null||whichPage.length() == 0){
            showPage = 1;
            databaseBean.setShowpage(showPage);
            CachedRowSetImpl rowSet = databaseBean.getRowSet();
            if(rowSet != null){
                presentPageResult = show(showPage,pageSize,rowSet);
                databaseBean.setPresentPageResult(presentPageResult);
            }
        }
        else if (whichPage.equals("nextPage")){
            showPage++;
            if(showPage>databaseBean.getPageAllCount())
                showPage = 1;
            databaseBean.setShowpage(showPage);
            CachedRowSetImpl rowSet = databaseBean.getRowSet();
            if(rowSet != null){
                presentPageResult = show(showPage,pageSize,rowSet);
                databaseBean.setPresentPageResult(presentPageResult);
            }
        }
        else if (whichPage.equals("previousPage")){
            showPage--;
            if(showPage <= 0)
                showPage = databaseBean.getPageAllCount();
            databaseBean.setShowpage(showPage);
            CachedRowSetImpl rowSet = databaseBean.getRowSet();
            if(rowSet != null){
                presentPageResult = show(showPage,pageSize,rowSet);
                databaseBean.setPresentPageResult(presentPageResult);
            }
        }
        /*databaseBean.setPresentPageResult(presentPageResult);*/
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/dashBoard.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public StringBuffer show(int page,int pageSize,CachedRowSetImpl rowSet){
        StringBuffer str = new StringBuffer();
        try {
            rowSet.absolute((page-1)*pageSize+1);
            for (int i = 1;i<=pageSize;i++){
                str.append("<tr>");
                for(int k = 1;k<=fieldCount;k++)
                    str.append("<td>"+rowSet.getString(k)+"</td>");
                str.append("</tr>");
                rowSet.next();
            }
            str.append("<table/>");
            str.append("<div/>");
        }
        catch (SQLException exp){}
        return str;
    }
}
