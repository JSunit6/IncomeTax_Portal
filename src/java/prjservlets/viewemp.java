package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="viewemp", urlPatterns={"/viewemp"})
public class viewemp extends HttpServlet
{   String s;
    Statement stmt;
    Connection con;
    ResultSet rs;
    ResultSetMetaData rsmd;
    int i;
    int count=0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         try
        {
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         Statement stmt=con.createStatement();
    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        HttpSession hs=request.getSession(false);
        s=hs.getAttribute("usr").toString();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String view=request.getParameter("viewlst");
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            con=DriverManager.getConnection("jdbc:odbc:departmentjava");
            stmt=con.createStatement();
            rs=stmt.executeQuery("select * from emp_dtls where name='"+view+"'"+" AND "+"username='"+s+"'");
            rsmd=rs.getMetaData();
         
         count=rsmd.getColumnCount();
         out.println("<html>");
      out.println("<head>");
      out.println("<link href=default.css rel=stylesheet type=text/css media=screen />");
      out.println("</head>");
      out.println("<body bgcolor=white>");
      out.println("<div id=header>");
      out.println("<table border=0>");
      out.println("<tr><td><img alt=income tax department src=images/IncomeTaxLogo1.jpg width=1100 height=138 align=left/></td></tr>");
      out.println("</table>");
      out.println("</div>");
      out.println("<br><br><br><br><br>");
      out.println("<body><table border=2 align=center bgcolor=white>");
    try{
      while(rs.next())

      {
          for (i = 1; i <= count; i++)
      {
          out.println("<tr>");
          out.println("<th>"+rsmd.getColumnName(i)+"</th>");
          out.println("<td>"+"<font color=black>"+rs.getObject(i)+"</font>"+"</td>");
          out.println("</tr>");
      }}
            }
    catch(Exception e)
    {
        e.printStackTrace();
    }







                    out.println("</table>");
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

         out.println("</body></html>");

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
      
    }

        
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException,IOException{
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
