package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class login extends HttpServlet {

    public login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jdbcUrl = "jdbc:derby://localhost:1527/Open";
        String uname = "root";
        String pass = "root";
        Connection c = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username.isEmpty() || password.isEmpty()) {
            RequestDispatcher req = request.getRequestDispatcher("login.jsp");
            req.include(request, response);

        } else {
            try {
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                c = DriverManager.getConnection(jdbcUrl, uname, pass);
                String sql = "Select * from UserData where username=? and password=?";
                PreparedStatement statement = c.prepareStatement(sql);
                statement.setString(1, username);
                statement.setString(2, password);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    RequestDispatcher req = request.getRequestDispatcher("main.jsp");
                    req.forward(request, response);
                }
                else{
                    RequestDispatcher req = request.getRequestDispatcher("error.jsp");
                    req.forward(request, response);
                
                }
            } catch (Exception ex) {
                Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
