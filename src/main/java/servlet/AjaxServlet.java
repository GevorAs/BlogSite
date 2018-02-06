package servlet;

import manager.CategoryManager;
import manager.PostManager;
import model.Category;
import model.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/ajaxServet")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String categoryIdStr=req.getParameter("categoryId");
        CategoryManager categoryManager = new CategoryManager();
        PostManager postManager = new PostManager();
        try {
            if (categoryIdStr==null||categoryIdStr.equalsIgnoreCase("")) {
                List<Category> categories = categoryManager.getAllCategories();
                List<Post> posts = postManager.getAllPosts();
                req.setAttribute("posts", posts);
                req.setAttribute("categories", categories);
                req.getRequestDispatcher("WEB-INF/ajax.jsp").forward(req,resp);
            } else {
                try {
                    long categoryId = Long.parseLong(categoryIdStr);
                    List<Category> categories = categoryManager.getAllCategories();
                    List<Post> posts = new ArrayList<>();
                    List<Post> postList = postManager.getAllPosts();
                    for (Post post : postList) {
                        if (post.getCategoryId() == categoryId) posts.add(post);
                    }
                    req.setAttribute("posts", posts);
                    req.setAttribute("categories", categories);
                    req.getRequestDispatcher("WEB-INF/ajax.jsp").forward(req,resp);
                } catch (NumberFormatException e) {
                    req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
                }
            }
        } catch (SQLException e) {
            req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
        }
    }
}
