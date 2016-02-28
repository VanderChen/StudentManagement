package StudentManagement.servlet;

import StudentManagement.JavaBean.Login;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Vander on 2016/2/29.
 */
@WebServlet(name = "forwardPersonalInformation")
public class forwardPersonalInformation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Login loginInfo = (Login)request.getSession().getAttribute("loginBean");
        if(loginInfo != null){
            if(loginInfo.getLogName().length()==0){
                try {
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request,response);
                    return;
                }
                catch (IOException e){System.out.print(e);}
            }
        }
        else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request,response);
            return;
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/personalInformation.jsp");
        dispatcher.forward(request,response);
        return;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
