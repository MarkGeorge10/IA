package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import java.util.ArrayList;
import java.sql.*;

public final class showCandidates_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title> Job Candidates</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <h1> ");
      out.print(session.getAttribute("name"));
      out.write(" </h1>\n");
      out.write("        <a href=\"hr_home.jsp\">home</a>\n");
      out.write("        <a href=\"postJob.jsp\">Post Job</a>\n");
      out.write("        <a href=\"logout\">Log out</a>\n");
      out.write("        ");

            
                  if(session.getAttribute("type").equals("hr")){
                     
                        String url = "jdbc:mysql://localhost:3306/onlinetest";
                        String user = "root";
                        String password = "";
                        Connection Con =null;
                        Statement Stmt = null;
                        ResultSet RS = null;
                        
                        Statement Stmt2 = null;
                        ResultSet RS2 = null;

                        Con = DriverManager.getConnection(url, user, password);
                        Stmt = (Statement) Con.createStatement();
                        Stmt2 = (Statement) Con.createStatement();
                                
                        int hrId = (Integer)session.getAttribute("id");
                        String JobId = request.getParameter("job_id");
                        
                        String query = "Select applied_for_jobs.job_id, user.name, user.email, user.id"
                                + " from applied_for_jobs INNER JOIN"
                                + " user ON applied_for_jobs.user_id=user.id "
                                + "where applied_for_jobs.job_id='"+JobId+"'";
                        RS =Stmt.executeQuery(query);
                        
                        //for exam data to be shown to hr to choose the right exam type
                        String query2 = "Select * from exam";
                        RS2 =Stmt2.executeQuery(query);
                        List<String> examData = new ArrayList();
                        while(RS2.next()){
                        
                            examData.add(RS2.getString("id"));
                            examData.add(RS2.getString("type"));
                        }
                  
                    while(RS.next()){
      out.write("\n");
      out.write("                        <div>\n");
      out.write("\n");
      out.write("                            <h3>");
      out.print(RS.getString("name"));
      out.write("</h3>\n");
      out.write("                            <h3>");
      out.print(RS.getString("email"));
      out.write("</h3>\n");
      out.write("                            ");
int user_id = RS.getInt("id");
      out.write("\n");
      out.write("                            ");
int job_id = RS.getInt("job_id");
      out.write("\n");
      out.write("                            \n");
      out.write("                            <form method=\"get\" action=\"approve\">\n");
      out.write("                                <input type=\"hidden\" name=\"user_id\" value=\"");
      out.print(user_id);
      out.write("\">\n");
      out.write("                                <input type=\"hidden\" name=\"job_id\" value=\"");
      out.print(job_id);
      out.write("\">\n");
      out.write("                                <select name=\"examType\">\n");
      out.write("                                    ");

                                        for(int i=0;i<examData.size();i=i+2){
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(examData.get(i));
      out.write('"');
      out.write('>');
      out.print(examData.get(i+1));
      out.write("</option>\n");
      out.write("                                        ");
}
                                    
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                                <input type=\"submit\"  value=\"Approve\">\n");
      out.write("                            </form>\n");
      out.write("                                \n");
      out.write("                            <a href=\"approve?user_id=");
      out.print(user_id);
      out.write("&job_id=");
      out.print(job_id);
      out.write("\">Approve</a>                      \n");
      out.write("                            \n");
      out.write("                        </div><hr>                         \n");
      out.write("                    ");
}
                      
                  }else{
                      response.sendRedirect("hrLogin.jsp");
                  }
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
