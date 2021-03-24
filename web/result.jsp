<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Results</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <%String title = request.getParameter("title");%>
        <header class="header">
            <h1 class="logo"><a href="#">Blog Application</a></h1>
            <ul class="main-nav">
                <li><a href="main.jsp">Home</a></li>
                <li><a href="add.jsp">Add Blog</a></li>
                <li><a href="search.jsp">Search</a></li>
                <li><a href="update.jsp">Update</a></li>
                <li><a href="delete.jsp">Delete</a></li>
                <li><a href="about.jsp">About</a></li>

                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </header>
    
            
                <h1 class="users">
                    Most recent Blogs according to your search
                </h1>
                <hr>
                <%
           try{
           Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/Open","root","root");
           String sql = "select * from blog where title = ? order by time desc ";
           PreparedStatement statement = c.prepareStatement(sql);
           statement.setString(1, title);
           ResultSet rs = statement.executeQuery();
           while(rs.next()){ %>
           <h2><%= rs.getString(1) %> </h2>
           <p><%= rs.getString(3) %></p>
           <p><%= rs.getString(2) %></p>
           <hr>
           <%
           }}
           catch(Exception e){
               out.println(e);
           }
       %>
    </body>

</html>
