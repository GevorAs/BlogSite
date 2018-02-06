package filter;

import model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(urlPatterns = {"/userPageServlet","/addPostServlet","/addCategoryServlet","/deletePostServlet","/deleteCategoryServlet"})
public class AutentificationFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest= (HttpServletRequest) request;
        User user= (User) httpServletRequest.getSession().getAttribute("user");
        if (user==null){
            HttpServletResponse httpServletResponse= (HttpServletResponse) response;

            httpServletResponse.sendRedirect("/homeServlet");
        }else {

            chain.doFilter(request,response);
        }

    }

    @Override
    public void destroy() {

    }
}
