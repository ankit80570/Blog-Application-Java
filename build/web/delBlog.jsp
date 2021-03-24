
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Deleted</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <% String username = request.getParameter("username"); %>
        <% String password = request.getParameter("password"); %>
        <% String title = request.getParameter("title"); %>
        <% String dbPassword = " ";%>

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


        <%
            try {
                Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/Open", "root", "root");
                String sql = "select password from userdata where username = ?";
                PreparedStatement statement = c.prepareStatement(sql);
                statement.setString(1, username);
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    dbPassword = rs.getString(1);
                }
            } catch (Exception e) {
                System.out.print(e);
            }
            System.out.println(dbPassword);
            if (password.equals(dbPassword)) {

                try {
                    Connection c = DriverManager.getConnection("jdbc:derby://localhost:1527/Open", "root", "root");
                    String sql = "Delete from BLOG where username=? and title=?";
                    PreparedStatement statement = c.prepareStatement(sql);
                    statement.setString(1, username);
                    statement.setString(2, title);
                    int val = statement.executeUpdate();
                    if (val > 0) { %>
        <h1 class="users">
            Blog has been deleted
        </h1>
        <%
                    } else {
                        RequestDispatcher req = request.getRequestDispatcher("error.jsp");
                        req.forward(request, response);
                    }
                } catch (Exception e) {
                    System.out.print(e);
                }
            }

        %>
    </body>
</html>
