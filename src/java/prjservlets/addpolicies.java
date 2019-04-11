
package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="addpolicies", urlPatterns={"/addpolicies"})
public class addpolicies extends HttpServlet {
    PrintWriter out;
    Connection con;
    PreparedStatement pstmt;
    Statement stmt;
    ResultSet rs;
     public void init(ServletConfig sc)
    {
        
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         pstmt=con.prepareStatement("insert into policy values(?,?)");
         stmt=con.createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        HttpSession hs=request.getSession(false);
        String name=request.getParameter("txtpolicyname");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           pstmt.setString(1,hs.getAttribute("usr").toString());
           pstmt.setString(2,name);
           pstmt.executeUpdate();
        } 
        catch(Exception e)
        {
            e.printStackTrace();
        } 
        /*finally {*/
             out.println("<html><head><title>Income tax Login</title>");
          out.println("<link href=default.css rel=stylesheet type=text/css media=screen />");
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
          out.println("POLICY DETAILS ADDED!");

          out.println("Click <a href=employee.jsp>HERE </a>to go to EMPLOYEE PAGE");
           out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<div class=downlinks>");
                    out.println("<table border=0 align=center>");
                    out.println("<tr>");
                    out.println("<td><a href=home1.jsp>HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href=employee.jsp>EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=incometax.jsp>INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=reports.jsp>REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=policies.jsp>INVESTMENTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=contactus.jsp>CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("</div>");
                    out.println("<div id=footer>");
                    out.println("<p class=copyright>&copy;&nbsp;&nbsp;2009 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <strong>Sunit P. Kajarekar</strong></a>.</p>");
                    out.println("<p class=link><a href=#>Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href=#>Terms of Use</a></p>");
                    out.println("</div>");
        /*}*/
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
