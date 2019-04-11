package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="changepass", urlPatterns={"/changepass"})
public class changepass extends HttpServlet
{
    Connection con;
    Statement stmt;
    
    String pass;
    public void init(ServletConfig sc)
    {
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       try{
              Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
              con=DriverManager.getConnection("jdbc:odbc:departmentjava");
              stmt=con.createStatement();


     }
     catch(Exception e)
            {
         e.printStackTrace();
     }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String oldpass=request.getParameter("txtoldpass");
        String newpass=request.getParameter("txtnewpass");

        try
        {
        ResultSet rs=stmt.executeQuery("select * from login7663");
        
        while(rs.next())
        {
          pass = rs.getString(2);
        if(pass.trim().equals(oldpass.trim()))
        {
            stmt.executeUpdate("update login7663 set pass='"+newpass.trim()+"'"+"where pass='"+pass.trim()+"'");
            response.sendRedirect("inclogin.html");
           break;
        }
        else
        {
             out.println("<html><head><title>Income tax Login</title>");
          out.println("<style type=text/css>");
          out.println("a:link {color:red;}");
          out.println("a:visited {color:#660000;}");
          out.println("a:hover {color:#000033;}");
          out.println("a:active {color:white;}");

          out.println("</style>");
          out.println("</head>");
          out.println("<body>");
          out.println("<div id=header>");
          out.println("<table border=0>");
          out.println("<tr><td><img alt=income tax department src=images/IncomeTaxLogo1.jpg width=1004 height=138 align=left /></td></tr>");
          out.println("</table>");
          out.println("</div>");
          out.println("<br><br><br><br><br>");
          out.println("<center>");
          out.println("<font color=blue size=5>");
          out.println("OLD PASSWORD IS INCORRECT!");
          out.println("Click <a href=chngpass.html>HERE </a>to go to CHANGE PASSWORD PAGE");
          out.println("</font>");
          out.println("</center>");
          out.println("</body></html>");
          break;
        }
            }
        
        
           
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
