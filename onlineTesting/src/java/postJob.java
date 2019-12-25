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
@WebServlet(urlPatterns = {"/postJob"})
public class postJob extends HttpServlet {

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
                    
                    String title = request.getParameter("title").trim();
                    String level = request.getParameter("level").trim();
                    String exp = request.getParameter("experience").trim();
                    String vacancy = request.getParameter("vacancies");
                    String salary = request.getParameter("salary").trim();
                    String req = request.getParameter("requirments").trim();
                    String res = request.getParameter("responsibilities").trim();

                    HttpSession session = request.getSession();
                    
                    if(session.getAttribute("email")!=null){
                        
                        int id = (Integer)session.getAttribute("id");
                        String query = "INSERT into jobs(hr_id,title,responsiblites,requirments,level,yearsOfExperience,vacances,salary)"
                                + " values('"+id+"','"+title+"','"+res+"','"+req+"','"+level+"','"+exp+"','"+vacancy+"','"+salary+"')";
                        Stmt.executeUpdate(query);
                        response.sendRedirect("hr_home.jsp");
                    }else{
                       
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
