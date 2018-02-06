package servlet;

import manager.CategoryManager;
import model.Category;
import util.Validator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/addCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("name");
        String errMessage="";
        CategoryManager categoryManager = new CategoryManager();
        Category category = new Category();
        category.setName(name);
        if (Validator.isEmpty(name)){
            errMessage+="please input category name";
        }
        if (errMessage.equals("")){
        try {
            categoryManager.add(category);
            resp.sendRedirect("/userPageServlet");
        } catch (SQLException e) {
          req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
        }}else {
            req.setAttribute("errMessage",errMessage);
            req.getRequestDispatcher("/userPageServlet").forward(req,resp);
        }
    }
}
