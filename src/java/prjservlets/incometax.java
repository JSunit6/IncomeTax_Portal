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

@WebServlet(name="incometax", urlPatterns={"/incometax"})
public class incometax extends HttpServlet
{
    HttpSession hs;
    int count;
    String name,btnname;
    String pan;
    double tax;
    double taxinc;
    PreparedStatement pstmt;
    Statement stmt;
    Connection con;
    ResultSet rs;
    ResultSetMetaData rsmd;
    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        name="";
        pan="";
        tax=0.0d;
        taxinc=0.0d;
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         stmt=con.createStatement();
        }
         catch(Exception e)
        {
             e.printStackTrace();
         }
        hs=request.getSession(false);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        name =request.getParameter("dellst");
        btnname=request.getParameter("btnname");
        if(btnname.equals("CALCULATE INCOME TAX"))
        {
            try
        {
           out.println("here");
           rs=stmt.executeQuery("select * from emp_dtls where name='"+name+"'");
           
           while(rs.next())
           {
               pan=rs.getString(5);
               taxinc = rs.getDouble(14);
            break;
           }
           out.println(taxinc);
          if(taxinc<500000)
          {
              taxinc=taxinc-200000;


            if(taxinc > 300000)
           {
                System.out.println("hi");
               taxinc=taxinc-300000;
               tax=tax+30000.00;

           }
            tax=tax+(taxinc*0.1);
         
          }
          else if (taxinc <= 1000000)
          {

               taxinc=taxinc-200000;
               

            if(taxinc >= 300000)
           {
                System.out.println("hi");
               taxinc=taxinc-300000;
               tax=tax+30000.00;
               
           }
            if (taxinc >= 500000)
           {
               taxinc=taxinc-500000;
               tax=tax+100000;
               
           }
           if(taxinc<500000)
           {
               
            tax=tax+(taxinc*0.2);
              
           }
          
            }
           else if(taxinc>=1000000)
           {
              taxinc=taxinc-200000;

              if(taxinc>300000)
              {
                  taxinc=taxinc-300000;
                  tax=tax+30000;
              }
              if(taxinc>=500000)
              {
                  taxinc=taxinc-500000;
                  tax=tax+100000;
              }
                            tax=tax+(taxinc*0.3);
             
           }
         
        }


        catch(Exception e)
        {
           e.printStackTrace();
        }
     
   /*finally
    { */
       try{
      
      pstmt=con.prepareStatement("insert into tax_dtls values(?,?,?,?)");
      pstmt.setString(1,hs.getAttribute("usr").toString());
      pstmt.setString(2,name);
      pstmt.setString(3,pan);
      pstmt.setDouble(4, tax);
      pstmt.executeUpdate();
      rs=stmt.executeQuery("select * from tax_dtls where Employee_name='"+name+"'"+" AND "+"username='"+hs.getAttribute("usr")+"'");
      
      rsmd=rs.getMetaData();
        }
       catch(Exception e)
       {
           e.printStackTrace();
        }
       finally
       {
       out.println("<html><head>");
       out.println("<link href=default.css rel=stylesheet type=text/css media=screen />");
         out.println("<title>Income tax Login</title>");
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
          out.println("<br>");
          out.println("<center>");
          out.println("<table border=2>");
          out.println("<tr>");
          try{
          count=rsmd.getColumnCount();
          

          for(int i=1;i<=count;i++)
          {
              out.println("<th><b>"+rsmd.getColumnName(i)+"</b></th>");
          }
          out.println("</tr>");
          while(rs.next())
          {
              out.println("<tr>");
              for(int j=1;j<=count;j++)
            {
                  out.println("<td>"+rs.getObject(j)+"</td>");
              }
              out.println("</tr>");
              
          }}
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
       
       /*}*/
}
        else if(btnname.equals("DELETE INCOME TAX DETAILS"))
        {
            
            try{
            stmt.executeUpdate("delete from tax_dtls where Employee_name='"+name+"'");
         

        }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            finally

                {
                out.println("<html><head>");
         out.println("<link href=default.css rel=stylesheet type=text/css media=screen />");
         out.println("<title>Income tax Login</title>");
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
          out.println("<br>");
          out.println("<center>");
          out.println("<font size=4>INCOME TAX Details of "+name+"deleted</font>");
          out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
                    out.println("<br>");
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
                    out.println("<td><a href=home1.jsp>HOME</a></td>&nbsp;<td>&nbsp;</td><td>&nbsp;</td><td><a href=employee.jsp>EMPLOYEES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=incometax.jsp>INCOME TAX</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=reports.jsp>REPORTS</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=policies.jsp>POLICIES</a></td><td>&nbsp;</td><td>&nbsp;</td><td><a href=contactus.jsp>CONTACT US</a></td><td>&nbsp;</td><td>&nbsp;</td>");
                    out.println("</tr>");
                    out.println("</table>");
                    out.println("</div>");
                    out.println("<div id=footer>");
                    out.println("<p class=copyright>&copy;&nbsp;&nbsp;2009 All Rights Reserved &nbsp;&bull;&nbsp; Designed by <strong>Sunit P. Kajarekar</strong></a>.</p>");
                    out.println("<p class=link><a href=#>Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href=#>Terms of Use</a></p>");
                    out.println("</div>");

            }
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
