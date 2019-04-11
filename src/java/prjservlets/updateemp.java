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

@WebServlet(name="updateemp", urlPatterns={"/updateemp"})
public class updateemp extends HttpServlet {
     String name,empname;
    double grsal=0,total=0d,balsal=0d,proftax=0d,traallow=0d;
     double ded=0d,gpf=0d,gis=0d;
     double taxinc=0d;
     Statement stmt,stmt1,stmt2;
     PrintWriter out;
    Connection con;
    PreparedStatement pstmt;

    ResultSet rs,rs1;
     public void init(ServletConfig sc)
    {
        
    }
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
        pstmt=con.prepareStatement("insert into emp_dtls values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         stmt=con.createStatement();
         stmt1=con.createStatement();
         stmt2=con.createStatement();
           }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        HttpSession hs=request.getSession(false);
        HttpSession hs1=request.getSession(false);
        name=hs.getAttribute("usr").toString();
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        String nme=request.getParameter("txtempname");

        String desg=request.getParameter("txtempdesg");
        String id=request.getParameter("txtempid");
        String pan=request.getParameter("txtemppan");
        grsal=Double.parseDouble(request.getParameter("txtgrssal"));

        proftax =Double.parseDouble(request.getParameter("txtprtax"));
        traallow=Double.parseDouble(request.getParameter("txttrall"));

        gpf=Double.parseDouble(request.getParameter("txtgenpf"));
        gis=Double.parseDouble(request.getParameter("txtgrpinsch"));

        balsal=(grsal-(proftax+traallow));



          try
        {
          rs=stmt.executeQuery("select * from investment_dtls");
        while(rs.next())
        {
            empname=rs.getString(2);
           
            if(empname.trim().equals(hs1.getAttribute("empname").toString().trim()))
            {
                
                total=total+rs.getDouble(4);
                
                
            }
            else
            {
         total=0;
         break;
        }
        }
          ded=gpf+gis+total;
          taxinc=balsal-ded;
          
          stmt.executeUpdate("update investment_dtls set username='"+name+"',"+"employee_name='"+nme+"'"+" where employee_name='"+hs1.getAttribute("empname").toString()+"'"+" AND "+"username='"+name+"'");
          stmt1.executeUpdate("update emp_dtls set username='"+name+"',"+"name='"+nme+"',"+"designation='"+desg+"',"+"id='"+id+"',"+"pan_no='"+pan+"',"+"gross_salary="+grsal+","+"profession_tax="+proftax+","+"travelling_allowance="+traallow+","+"balance_salary="+balsal+","+"GPF="+gpf+","+"GIS="+gis+","+"other_investments="+total+","+"deduction="+ded+","+"taxable_income="+taxinc+" where name='"+hs1.getAttribute("empname").toString()+"'"+" AND "+"username='"+name+"'");
          
          
          stmt2.executeUpdate("delete from tax_dtls"+" where username='"+name+"'"+" AND "+"Employee_name='"+hs1.getAttribute("empname")+"'");
              
          

         }
        catch(Exception e)
        {
             System.out.println(e.getMessage());
        }
        finally
          {
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
          out.println("<font color=red size=4>DETAILS UPDATED!</font>");

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
