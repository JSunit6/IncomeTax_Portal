package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name="addemp", urlPatterns={"/addemp"})
public class addemp extends HttpServlet
{   String name,empname;
    double total, balsal=0d;
     double ded=0d;
     double taxinc=0d;
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
         pstmt=con.prepareStatement("insert into emp_dtls values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         stmt=con.createStatement();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        HttpSession hs=request.getSession(false);
        name=hs.getAttribute("usr").toString();
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String nme=request.getParameter("txtempname");

        String desg=request.getParameter("txtempdesg");
        String id=request.getParameter("txtempid");
        String pan=request.getParameter("txtemppan");
        double grsal=Double.parseDouble(request.getParameter("txtgrssal"));
        
        double proftax =Double.parseDouble(request.getParameter("txtprtax"));
        double traallow=Double.parseDouble(request.getParameter("txttrall"));
   
        double gpf=Double.parseDouble(request.getParameter("txtgenpf"));
        double gis=Double.parseDouble(request.getParameter("txtgrpinsch"));
        
        balsal=(grsal-(proftax+traallow));
        
        

          try
        {
          rs=stmt.executeQuery("select * from investment_dtls");
        while(rs.next())
        {
            empname=rs.getString(2);
            
            if(empname.trim().equals(nme.trim()))
            {
                total=total+rs.getDouble(4);
                
            }
            else
            {
         total=0;
        }
        }
              pstmt.setString(1,name);
          pstmt.setString(2,nme);
          pstmt.setString(3,desg);
          pstmt.setString(4,id.toUpperCase());
          pstmt.setString(5,pan.toUpperCase());
          pstmt.setDouble(6,grsal);
          pstmt.setDouble(7,proftax);
          pstmt.setDouble(8,traallow);
          pstmt.setDouble(9,balsal);
          pstmt.setDouble(10,gpf);
          pstmt.setDouble(11,gis);
          pstmt.setDouble(12,total);
          ded=(gpf+gis+total);
          if(ded<=100000)
          {
           pstmt.setDouble(13,ded);
          }
          else
          {
            ded=100000;
            pstmt.setDouble(13,ded);
          }
          taxinc=((balsal-ded));
          pstmt.setDouble(14,taxinc);
          pstmt.executeUpdate();
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
          out.println("DETAILS ADDED!");
          
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
          catch(SQLException se)
          {
              se.printStackTrace();
          }
          catch(Exception e)
        {
             System.out.println(e.getMessage());
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
