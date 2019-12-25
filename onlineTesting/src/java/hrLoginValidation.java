/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ahmed
 */
@WebServlet(urlPatterns = {"/hrLoginValidation"})
public class hrLoginValidation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String url = "jdbc:mysql://localhost:3306/onlinetest";
                String user = "root";
                String password = "";
                Connection Con =null;
                Statement Stmt = null;
                ResultSet RS = null;
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    Con = DriverManager.getConnection(url, user, password);
                    Stmt = (Statement) Con.createStatement();

                    String email = request.getParameter("email").trim();
                    String pass = request.getParameter("pass").trim();

                    String query = "Select * from hr where email='"+email+"' and pass='"+pass+"'";
                    RS =Stmt.executeQuery(query);
                   if(RS.next()){
                       HttpSession session = request.getSession();
                        
                        session.setAttribute("id", RS.getInt("id"));
                        session.setAttribute("name", RS.getString("name"));
                        session.setAttribute("email", email);
                        session.setAttribute("pass", pass);
                        session.setAttribute("company", RS.getString("company_name"));
                        session.setAttribute("industry", RS.getString("industery"));
                        session.setAttribute("address", RS.getString("address"));
                        session.setAttribute("type", "hr");
                        
                        response.sendRedirect("hr_home.jsp");

                    }else{
                       HttpSession session = request.getSession();
                        session.setAttribute("msg","HR " + email+" not exist..");
                        //out.print(session.getAttribute("msg"));                        
                        response.sendRedirect("hrLogin.jsp");
                    }

                }catch(Exception cnfe)
                {
                    System.err.println("Exception: " + cnfe);
                }
            
            
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
