package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name="policies", urlPatterns={"/policies"})
public class policies extends HttpServlet {
   HttpSession hs;
    Enumeration en;
   Object obj;
   String empname,name,name1,name2;
   double d;
   PrintWriter out;
    Connection con;
    PreparedStatement pstmt;
    Statement stmt;
    ResultSet rs;
     
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         pstmt=con.prepareStatement("insert into investment_dtls values(?,?,?,?)");
        stmt=con.createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        hs=request.getSession(false);
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String btnname=request.getParameter("btnpolicies");
        if(btnname.equals("CHOOSE"))
        {
        en=request.getParameterNames();
       try
        {
           obj=en.nextElement();
           name1=obj.toString();
           empname=request.getParameter(name1);

           while(en.hasMoreElements())
           {
               obj=en.nextElement();
               name1=obj.toString();
               d=Double.parseDouble((request.getParameter(name1)));
               
               stmt.executeUpdate("insert into investment_dtls values('"+hs.getAttribute("usr")+"',"+"'"+empname+"',"+"'"+name1+"',"+d+")");
               
           }
        }
       catch(SQLException e)
        {
            e.printStackTrace();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
          
   
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
          out.println("INVESTMENT DETAILS ADDED!");

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
        
    }
        else if(btnname.equals("ADD MORE POLICIES"))
        {
            response.sendRedirect("addpolicies.jsp");
        }
        else if(btnname.equals("DELETE POLICIES"))
        {
             response.sendRedirect("delpolicies.jsp");
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
    public String getServletInfo()

    {
        return "Short description";
    }
}
