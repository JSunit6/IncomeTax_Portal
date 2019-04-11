package prjservlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="deregister", urlPatterns={"/deregister"})
public class deregister extends HttpServlet {
    String name,pass;
    PrintWriter out;
    Connection con;
    Statement stmt;
    ResultSet rs;
     
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
        out = response.getWriter();
         name=request.getParameter("txtdeuser");
         pass=request.getParameter("txtdepass");
        try
        {
        rs=stmt.executeQuery("delete from login7663 where username='"+name+"'"+" AND "+"pass='"+pass+"'");
         response.sendRedirect("inclogin.html");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            
                    }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
