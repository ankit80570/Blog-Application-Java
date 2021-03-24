<%@page import="java.sql.*"%>
<%@ page errorPage="error.jsp" %>
<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <% String name= request.getParameter("username"); %>
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
    <section class="section-body">
        <div class="section-blogs">
            <div class="grid left">
                <h1 class="blogs">  
                    Our latest blogs
                </h1>
                <hr>
                <%
           try{
           Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/Open","root","root");
           Statement statement = c.createStatement();
           ResultSet rs = statement.executeQuery("select * from blog order by time desc");
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
            </div>
        </div>
        <div class="section-users">
            <div class="grid right">
                <h1 class="users">
                    My Blogs
                </h1>
                <hr>
                <%
           try{
           Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/Open","root","root");
           String sql = "select * from blog where username = ? order by time desc ";
           PreparedStatement statement = c.prepareStatement(sql);
           statement.setString(1, name);
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
            </div>
        </div>
    </section>
    

</body>

</html>