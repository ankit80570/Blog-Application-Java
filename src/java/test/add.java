package test;
import java.time.Instant;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class add extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jdbcUrl = "jdbc:derby://localhost:1527/Open";
       String uname = "root";
       String pass = "root";
       Connection c = null;
        String username = request.getParameter("username");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        if(username.isEmpty() || title.isEmpty() || content.isEmpty())
		{
                    out.println("You can't leave any field empty");
                    RequestDispatcher req = request.getRequestDispatcher("add.jsp");
                        
			req.include(request, response);
                        
		}
		else
		{       
            try
            {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            c = DriverManager.getConnection(jdbcUrl,uname,pass);
            String sql = "INSERT INTO BLOG (title,content,time,username)  VALUES (?, ?, CURRENT_TIMESTAMP, ?)";
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, content);
            statement.setString(3, username);
            int val = statement.executeUpdate();
             if(val>0)
                out.println("<h3>Blog Registered Successfully</h3>");
            else
                out.println("<h3>Blog added Failed</h3>");
            request.getRequestDispatcher("main.jsp").include(request, response);
            
        }catch (Exception e) {
            out.println(e.getClass().getName()+": "+e.getMessage());
        }               
			
		}
    }



}
