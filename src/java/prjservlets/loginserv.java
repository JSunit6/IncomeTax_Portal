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


@WebServlet(name="loginserv", urlPatterns={"/loginserv"})
public class loginserv extends HttpServlet
{
    Connection con;
    Statement stmt;
    String s1,s2;
  

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

        HttpSession hs=request.getSession(true);
        PrintWriter out = response.getWriter();
        String user=request.getParameter("txtuser");
        String pass=request.getParameter("txtpass");
        hs.setAttribute("usr",user);
        try
        {

        ResultSet rs=stmt.executeQuery("select * from login7663");
        while(rs.next())
        {
          s1=rs.getString(1);
          s2=rs.getString(2);

          if(s1.trim().equals(user.trim()) && s2.trim().equals(pass.trim()))
          {
              response.sendRedirect("home1.jsp");

              break;
          }

        }
         if(s1.trim()!=user.trim() && s2.trim()!=pass.trim())
         {
             response.sendRedirect("lgnerror.html");
         }
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
