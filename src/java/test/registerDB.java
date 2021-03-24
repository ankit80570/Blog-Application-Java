
package test;
import static java.awt.Color.green;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class registerDB extends HttpServlet {
       
    
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
       String jdbcUrl = "jdbc:derby://localhost:1527/Open";
       String uname = "root";
       String pass = "root";
       Connection c = null;
                String uid = request.getParameter("Uid");
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		String contact = request.getParameter("contact");
		response.setContentType("text/html;charset=UTF-8");

		if(name.isEmpty() || username.isEmpty() || password.isEmpty() ||  mail.isEmpty() || contact.isEmpty())
		{
			RequestDispatcher req = request.getRequestDispatcher("register1.jsp");
			req.include(request, response);
                        
		}
		else
		{       
            try
            {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            c = DriverManager.getConnection(jdbcUrl,uname,pass);
            String sql = "INSERT INTO UserData (uid,name,username,password,mail,contact)  VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = c.prepareStatement(sql);
            statement.setString(    1, uid);
            statement.setString(2, name);
            statement.setString(3, username);
            statement.setString(4, password);
            statement.setString(5, mail);
            statement.setString(6, contact);
            int val = statement.executeUpdate();
            if(val>0)
                out.println("<h3>User Registered Successfully</h3>");
            else
                out.println("<h3>Registration Failed</h3>");
            request.getRequestDispatcher("register.jsp").include(request, response);
        }catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            System.err.println(e.getClass().getName()+": "+e.getMessage());
            System.exit(0);
        }               
			
		}
	}
 
}