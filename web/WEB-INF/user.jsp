<%@ page import="model.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Arianna
  Date: 29.01.2018
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MY PAGE</title>
    <link href="../css/homeStyle.css" type="text/css" rel="stylesheet">

</head>
<body>
<%User user = (User) request.getSession().getAttribute("user"); %>
<% List<Post> posts = (List<Post>) request.getAttribute("posts");%>
<% List<Post> myPosts = (List<Post>) request.getAttribute("myPosts");%>
<% List<Category> categories = (List<Category>) request.getAttribute("categories");%>

<%--111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>

<div id="wrapper">
    <div style="float: right; margin: 40px">

        <a href="/logoutServlet">
            <button>Logout</button>
        </a>
    </div>
    <div id="header-wrapper">
        <div id="header">
            <div id="logo">
                <h1><a href="#">Timeless </a></h1>
                <p>template design by <a href="http://www.freecsstemplates.org/">CSS Templates</a></p>
            </div>
        </div>
    </div>
    <!-- end #header -->
    <div id="menu">
        <ul>
            <li class="current_page_item"><a href="#">Home</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Photos</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Links</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <!-- end #menu -->
    <div id="page">
        <div id="page-bgtop">
            <div id="page-bgbtm">
                <div id="content">

                    <%--11111111111111111111111111111111111111111111111--%>

                    <%
                        for (Category category : categories) {
                    %>
                    <%=category.getName()%>
                    <%
                        for (Post post : posts) {
                            if (post.getUserId() == user.getId()) {
                                if (post.getCategoryId() == category.getId()) {%>


                    <div class="post">
                        <h2 class="title"><%=post.getTitle()%></h2>
                        <p class="meta">Posted by <a href="#">Someone</a> on August 10, 2011
                            &nbsp;&bull;&nbsp; <a href="#" class="comments">Comments (64)</a> &nbsp;&bull;&nbsp; <a
                                    href="#" class="permalink">Full article</a></p>
                        <div class="entry">
                            <p><% if (post.getPicUrl() != null && !post.getPicUrl().equals("")) {
                            %>
                                <img src="/getResourceServlet?fileName=<%=post.getPicUrl()%>" width="186" height="186" alt=""
                                     class="alignleft border">
                                <%}%> <%=post.getText()%></p>

                        </div>
                    </div>
                    <%
                                    }
                                }
                            }
                        }%>


                    <%--11111111111111111111111111111111111111111111111--%>


                    <div style="clear: both;">&nbsp;</div>
                </div>
                <!-- end #content -->
                <div id="sidebar">


                    <%if (request.getAttribute("errMessage") != null) {%>
                    <%=request.getAttribute("errMessage")%>
                    <%}%>

                    <div>
                        <h2>Create new category</h2>
                        <form action="/addCategoryServlet" method="post">
                            Name; <input type="text" name="name">
                            <input type="submit" value="Add">
                        </form>
                    </div>


                    <div>
                        <h2>Create new post</h2>


                        <form action="/addPostServlet" method="post" enctype="multipart/form-data">
                            Select Category
                            <select name="categoryId">
                                <%
                                    for (Category category : categories) {
                                %>
                                <option value="<%=category.getId()%>"><%=category.getName()%>
                                </option>
                                <%}%>
                            </select><br>
                            Title: <input type="text" name="title"><br>
                            Text: <textarea name="text"></textarea><br>
                            Picture:<input type="file" name="picture"><br>
                            <input type="submit" value="Add">


                        </form>
                    </div>


                    <%--22222222222222222222222222222222222222222--%>
                    <%--<ul>--%>
                    <%--<li>--%>
                    <%--<h2>Aliquam tempus</h2>--%>
                    <%--<p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper consectetuer hendrerit.</p>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<h2>Categories</h2>--%>
                    <%--<ul>--%>
                    <%--<li><a href="#">Aliquam libero</a></li>--%>
                    <%--<li><a href="#">Consectetuer adipiscing elit</a></li>--%>
                    <%--<li><a href="#">Metus aliquam pellentesque</a></li>--%>
                    <%--<li><a href="#">Suspendisse iaculis mauris</a></li>--%>
                    <%--<li><a href="#">Urnanet non molestie semper</a></li>--%>
                    <%--<li><a href="#">Proin gravida orci porttitor</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<h2>Blogroll</h2>--%>
                    <%--<ul>--%>
                    <%--<li><a href="#">Aliquam libero</a></li>--%>
                    <%--<li><a href="#">Consectetuer adipiscing elit</a></li>--%>
                    <%--<li><a href="#">Metus aliquam pellentesque</a></li>--%>
                    <%--<li><a href="#">Suspendisse iaculis mauris</a></li>--%>
                    <%--<li><a href="#">Urnanet non molestie semper</a></li>--%>
                    <%--<li><a href="#">Proin gravida orci porttitor</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<h2>Archives</h2>--%>
                    <%--<ul>--%>
                    <%--<li><a href="#">Aliquam libero</a></li>--%>
                    <%--<li><a href="#">Consectetuer adipiscing elit</a></li>--%>
                    <%--<li><a href="#">Metus aliquam pellentesque</a></li>--%>
                    <%--<li><a href="#">Suspendisse iaculis mauris</a></li>--%>
                    <%--<li><a href="#">Urnanet non molestie semper</a></li>--%>
                    <%--<li><a href="#">Proin gravida orci porttitor</a></li>--%>
                    <%--</ul>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                    <%--22222222222222222222222222222222222222222--%>

                </div>
                <!-- end #sidebar -->
                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
    </div>
    <!-- end #page -->
</div>
<div id="footer">
    <p>Copyright (c) 2018 All rights reserved. Design by <a href="">
        GEVOR ASASTRYAN</a>.</p>
</div>
<!-- end #footer -->
<div align=center> <a href=""></a></div>

</body>


<%--111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>

</body>
</html>
