package servlet;

import manager.PostManager;
import model.Post;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/postPageServlet")
public class PostPageServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String postId=req.getParameter("postId");
        PostManager postManager = new PostManager();
        try {
            Post post=postManager.getPostById(Integer.parseInt(postId));
            req.setAttribute("post",post);
            req.getRequestDispatcher("WEB-INF/post.jsp").forward(req,resp);
        } catch (SQLException e) {
            req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);

        }

    }
}
