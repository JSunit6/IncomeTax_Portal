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

@WebServlet(name="forgotpass", urlPatterns={"/forgotpass"})
public class forgotpass extends HttpServlet
{
     Connection con;
    Statement stmt;
    String ques,ans;
    String uname,passwd;
    
   
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
        String name1=request.getParameter("txtusername1");
        HttpSession hs1=request.getSession(true);

        try
        {
            ResultSet rs=stmt.executeQuery("select * from login7663");
           while(rs.next())
           {
            uname = rs.getString(1);
            passwd=rs.getString(2);
            ques=rs.getString(3);
            ans=rs.getString(4);
            hs1.setAttribute("answer",ans);
                if(uname.trim().equals(name1.trim()))
                {
                   out.println("<html><head><link href=valcss.css rel=stylesheet type=text/css media=screen/></head>");
                   out.println("<body class=backimg>");
                   out.println("<div id=header>");
	           out.println("<table border=0>");
                   out.println("<tr><td><img alt=income tax department src=images/IncomeTaxLogo1.jpg width=1004 height=138 align=left /></td></tr>");
                   out.println("</table>");
	           out.println("</div>");
                   out.println("<br><br><br><br><br>");
                   out.println("<form method =post action=retrievepass");
                   out.println("<table border=0 align=center>");
                   out.println("<tr><td><font size=5>YOUR SECURITY QUESTION IS</td>"+"<td>"+ques+"</font></td></tr>");
                   out.println("<br>");
                   out.println("<tr><td><font size=5>YOUR ANSWER:</td><td><input type=text name=txtans></font></td></tr>");
                   out.println("<br>");
                   out.println("<tr><input type=submit name=btnsub> &nbsp; <input type=reset></tr> ");
                   out.println("</table>");
                   out.println("</form>");
                   break;
                }
            }

        }
        catch(Exception e )
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
