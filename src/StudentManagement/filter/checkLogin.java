package StudentManagement.filter;

import StudentManagement.JavaBean.Login;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Vander on 2016/2/28.
 */
@WebFilter(filterName = "checkLogin")
public class checkLogin implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        chain.doFilter(req, resp);
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
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
    }


    public void init(FilterConfig config) throws ServletException {

    }

}
