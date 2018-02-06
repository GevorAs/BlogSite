<%@ page import="model.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Post> posts = (List<Post>) request.getAttribute("posts");%>

<%
    for (Post post : posts) {%>

<div class="post">
    <h2 class="title"><a href="/postPageServlet?postId=<%=post.getId()%>">
        <%=post.getTitle()%>
    </a></h2>
    <p class="meta">Posted by <a href="#">Someone</a> <%=post.getTimestamp()%>
        &nbsp;&bull;&nbsp; <a href="#" class="comments">Comments (64)</a> &nbsp;&bull;&nbsp; <a
                href="#" class="permalink">Full article</a></p>
    <div class="entry">
        <p><%
            if (post.getPicUrl() != null && !post.getPicUrl().equals("")) {
        %>
            <img src="/getResourceServlet?fileName=<%=post.getPicUrl()%>" width="186" height="186"
                 alt="" class="alignleft border"/>
            <%}%><%=post.getText()%>
        </p>

    </div>
</div>
<%}%>