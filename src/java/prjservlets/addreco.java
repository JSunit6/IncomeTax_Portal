package prjservlets;

import com.sun.java.swing.plaf.windows.WindowsOptionPaneUI;
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



@WebServlet(name="addreco", urlPatterns={"/addreco"})
public class addreco extends HttpServlet
{
    String name;
    PrintWriter out;
     Connection con;
    
    PreparedStatement pstmt;
    
    public void init(ServletConfig sc)
    {
        
    }
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
         con=DriverManager.getConnection("jdbc:odbc:departmentjava");
         pstmt=con.prepareStatement("insert into login7663 values(?,?,?,?)");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        out= response.getWriter();
        String user=request.getParameter("txtusername");
        String pass=request.getParameter("txtpassword");
        String cpass=request.getParameter("txtconpass");
        String ques=request.getParameter("txtsecques");
        String ans=request.getParameter("txtanswer");
        if(pass.trim().equals(cpass.trim()))
        {
            try
            {
            pstmt.setString(1,user);
            pstmt.setString(2,pass);
            pstmt.setString(3,ques);
            pstmt.setString(4,ans);
            pstmt.executeUpdate();
            response.sendRedirect("inclogin.html");
            }
        catch(Exception e)
        {
            e.printStackTrace();
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
    throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
