package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="retrievepass", urlPatterns={"/retrievepass"})
public class retrievepass extends HttpServlet
{
 Connection con;
    Statement stmt;
String ans1;
String passwd;
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         try{
              Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
              con=DriverManager.getConnection("jdbc:odbc:departmentjava");
              stmt=con.createStatement();
        }
catch(Exception e)
        {
    System.out.println(e.getMessage());
}
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession hs1=request.getSession(false);
        Object ans2=hs1.getAttribute("answer");
        try {
            ResultSet rs=stmt.executeQuery("select * from login7663");
            while(rs.next())
            {
                passwd=rs.getString(2);
                ans1=rs.getString(4);

                if(ans2.equals(ans1))
                {
                   out.println("<body bgcolor=white>");
                   out.println("<div id=header>");
	           out.println("<table border=0>");
                   out.println("<tr><td><img alt=income tax department src=images/IncomeTaxLogo1.jpg width=1004 height=138 align=left /></td></tr>");
                   out.println("</table>");
	           out.println("</div>");
                   out.println("<center><table><tr><td><font size=6>Password:"+passwd+"</td></tr>");
                   out.println("Click <a href=inclogin.html>HERE </a>to go to LOGIN PAGE"+"</font>");
                   break;
                }
            }
            
        }
        catch(Exception e)
        {

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
    }// </editor-fold>

}
