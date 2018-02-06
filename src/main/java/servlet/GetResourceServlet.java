package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

@WebServlet(urlPatterns = "/getResourceServlet")
public class GetResourceServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String filename=req.getParameter("fileName");
        OutputStream out=resp.getOutputStream();
        FileInputStream in=new FileInputStream("D:\\ADMIN\\images\\"+filename);
        byte[] buffer=new byte[4096];
        int lenght;
        while ((lenght=in.read(buffer))>0){
            out.write(buffer,0,lenght);

        }
        in.close();
        out.flush();
    }
}
