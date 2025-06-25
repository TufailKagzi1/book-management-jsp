/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.*;
import java.sql.*;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 123
 */
public class addbook extends HttpServlet {

        Connection con=null;
        PreparedStatement ps=null;
        
        static final String url="jdbc:mysql://localhost:3306/min_project?useSSL=false";
        static final String user="root";
        static final String pass="";
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           String name = request.getParameter("name");
           String author = request.getParameter("author");
           String publication = request.getParameter("publication");
           String version = request.getParameter("version");
           String prize = request.getParameter("prize");
           String description = request.getParameter("desc");
           
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection(url,user,pass);
           ps=con.prepareStatement("insert into books(name,author,publication,version,prize,description) values(?,?,?,?,?,?)");
            
           ps.setString(1, name);
           ps.setString(2, author);
           ps.setString(3, publication);
           ps.setString(4, version);
           ps.setString(5, prize);
           ps.setString(6, description);
            
            out.print(name+"<br>");
            out.print(author+"<br>");
            out.print(publication +"<br>");
            out.print(version +"<br>");
            out.print(prize +"<br>");
            out.print(description +"<br>");
            
           int row = ps.executeUpdate();
            
            out.print(description);
            
            RequestDispatcher rd=request.getRequestDispatcher("addbook.jsp");  
                        
            if(row > 0){
                request.setAttribute("status", "success");
            }
            else{
                request.setAttribute("status", "failed");
            }
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(addbook.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                processRequest(request, response);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(addbook.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
