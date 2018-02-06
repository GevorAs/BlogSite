package servlet;

import manager.CategoryManager;
import manager.PostManager;
import model.Category;
import model.Post;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/userPageServlet")
public class UserPageServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             User user= (User) req.getSession().getAttribute("user");
        PostManager postManager = new PostManager();
        CategoryManager categoryManager = new CategoryManager();
        List<Post> allPosts;
        List<Post> myPosts;
        List<Category> categories;
        try {
           allPosts= postManager.getAllPosts();
           myPosts= postManager.getPostsByUserId(user.getId());
           categories= categoryManager.getAllCategories();
           req.setAttribute("posts",allPosts);
           req.setAttribute("myPosts",myPosts);
           req.setAttribute("categories",categories);
           req.getRequestDispatcher("WEB-INF/user.jsp").forward(req,resp);
        } catch (SQLException e) {
            req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);

        }
    }
}
