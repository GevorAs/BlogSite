<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gevor's Blog </title>
    <link href="../css/homeStyle.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery.js"></script>
</head>
<body>

<%List<Post> posts = (List<Post>) request.getAttribute("posts");%>
<%List<Category> categories = (List<Category>) request.getAttribute("categories");%>
<div style="float: right; margin: 40px">
    <h1><a href="/loginPageServlet">Login</a>
    </h1>
</div>


<%--111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>

<div id="wrapper">
    <div id="header-wrapper">
        <div id="header">
            <div id="logo">
                <h1>blogg for all categories</h1>
                <p><a href="https://www.youtube.com/channel/UCl7Mw2aKtDEOe-uilA5pHcA?view_as=subscriber/">My Youtube
                    Channel</a></p>
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
                <div>

                    <ul>
                        <%
                            for (Category category : categories) {
                        %>
                        <li onclick="onCatClick(<%=category.getId()%>)"><a href="#"
                        ><%=category.getName()%>
                        </a></li>
                        <%}%>

                    </ul>
                    <%--<form action="/homeServlet" method="post">--%>
                    <%--<select name="categoryId" id="categoryId">--%>
                    <%--<option value="">All</option>--%>
                    <%--<%--%>
                    <%--for (Category category : categories) {--%>
                    <%--%>--%>
                    <%--<option value="<%=category.getId()%>"><%=category.getName()%>--%>
                    <%--</option>--%>
                    <%--<%}%>--%>
                    <%--</select>--%>
                    <%--<input type="submit" value="Select" id="submit">--%>
                    <%--</form>--%>
                </div>
                <div id="content">
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
                </div>
                <!-- end #content -->
                <div id="sidebar">
                    <ul>
                        <li>
                            <h2></h2>
                            <p></p>
                        </li>
                        <li>
                            <h2>Categories</h2>
                            <ul>
                                <li><a href="#">Aliquam libero</a></li>
                                <li><a href="#">Consectetuer adipiscing elit</a></li>
                                <li><a href="#">Metus aliquam pellentesque</a></li>
                                <li><a href="#">Suspendisse iaculis mauris</a></li>
                                <li><a href="#">Urnanet non molestie semper</a></li>
                                <li><a href="#">Proin gravida orci porttitor</a></li>
                            </ul>
                        </li>
                        <li>
                            <h2>Blogroll</h2>
                            <ul>
                                <li><a href="#">Aliquam libero</a></li>
                                <li><a href="#">Consectetuer adipiscing elit</a></li>
                                <li><a href="#">Metus aliquam pellentesque</a></li>
                                <li><a href="#">Suspendisse iaculis mauris</a></li>
                                <li><a href="#">Urnanet non molestie semper</a></li>
                                <li><a href="#">Proin gravida orci porttitor</a></li>
                            </ul>
                        </li>
                        <li>
                            <h2>Archives</h2>
                            <ul>
                                <li><a href="#">Aliquam libero</a></li>
                                <li><a href="#">Consectetuer adipiscing elit</a></li>
                                <li><a href="#">Metus aliquam pellentesque</a></li>
                                <li><a href="#">Suspendisse iaculis mauris</a></li>
                                <li><a href="#">Urnanet non molestie semper</a></li>
                                <li><a href="#">Proin gravida orci porttitor</a></li>
                            </ul>
                        </li>
                    </ul>
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
<div align=center><a href=""></a></div>

<%--
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>
<script>
    var x;
    aa();
    function aa() {
        if (!x) {
            x = setInterval(function () {
                $.ajax({
                    url: 'http://localhost:8080/ajaxServet', success: function (result) {
                        $("#content").html(result);
                    }
                })
            }, 1000);
        }}
    function onCatClick(vl) {
        if (!x) {
        } else {
            clearInterval(x);
            x = setInterval(function () {
                $.ajax({
                    url: 'http://localhost:8080/ajaxServet?categoryId=' + vl, success: function (result) {
                        $("#content").html(result);
                    }
                })
            }, 1000);
        }}
</script>

</body>
</html>
