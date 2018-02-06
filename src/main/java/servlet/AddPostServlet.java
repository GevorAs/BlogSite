package servlet;

import manager.PostManager;
import model.Post;
import model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/addPostServlet")
public class AddPostServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(req);
        if (isMultipart) {
            String imageUploadPath = "D:\\ADMIN\\images\\";
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(500 * 1024);
            factory.setRepository(new File("D:\\ADMIN\\temp"));
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setSizeMax(10000 * 1024);
            try {
                List<FileItem> fileItems = fileUpload.parseRequest(req);
                String categoryIdStr = "";
                String title = "";
                String text = "";
                String picUrl = "";
                for (FileItem fileItem : fileItems) {
                    if (fileItem.isFormField()) {
                        if (fileItem.getFieldName().equals("title")) {
                            title = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("text")) {
                            text = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("categoryId")) {
                            categoryIdStr = fileItem.getString();
                        }
                    } else {
                        String picname = System.currentTimeMillis() + "_" + fileItem.getName();
                        File file = new File(imageUploadPath + picname);
                        fileItem.write(file);
                        picUrl = picname;
                    }
                }
                    User user = (User) req.getSession().getAttribute("user");
                    Post post = new Post();
                    post.setTitle(title);
                    post.setText(text);
                    post.setCategoryId(Integer.parseInt(categoryIdStr));
                    post.setUserId(user.getId());
                    post.setPicUrl(picUrl);
                    PostManager postManager = new PostManager();
                    postManager.add(post);
                    resp.sendRedirect("/userPageServlet");

            } catch (FileUploadException e) {
                req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
            } catch (SQLException e) {
                req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);

            } catch (Exception e) {
                req.getRequestDispatcher("WEB-INF/err.jsp").forward(req,resp);
            }
        }
    }
}
