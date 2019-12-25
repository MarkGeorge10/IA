package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write('\n');
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>All Jobs!</h1>\n");
      out.write("        <a href=\"logout\">Log out</a>\n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("            \n");
      out.write("                ");

        
                    
                  if(session.getAttribute("type").equals("user")){
                     
                        String url = "jdbc:mysql://localhost:3306/onlinetest";
                        String user = "root";
                        String password = "";
                        Connection Con =null;
                        Statement Stmt = null;
                        ResultSet RS = null;

                          Con = DriverManager.getConnection(url, user, password);
                          Stmt = (Statement) Con.createStatement();
                          String query = "Select * from jobs order by id DSC";
                          RS =Stmt.executeQuery(query);
                   
                    while(RS.next()){
      out.write("\n");
      out.write("                       \n");
      out.write("                    <div>\n");
      out.write("                        <h3>");
      out.print(RS.getString("title"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("salary"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("vacances"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("yearsOfExperience"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("responsiblites"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("requirments"));
      out.write("</h3>\n");
      out.write("                        <h3>");
      out.print(RS.getString("level"));
      out.write("</h3>\n");
      out.write("                        \n");
      out.write("                        ");
int user_id = (Integer)session.getAttribute("id");
      out.write("\n");
      out.write("                        ");
int hr_id = RS.getInt("hr_id");
      out.write("\n");
      out.write("                        ");
int job_id = RS.getInt("id");
      out.write("\n");
      out.write("                        ");
 String title = RS.getString("title");
      out.write("\n");
      out.write("                        \n");
      out.write("                        <a href=\"apply?user_id=user_id=");
      out.print(user_id);
      out.write("&job_id=");
      out.print(job_id);
      out.write("&hr_id=");
      out.print(hr_id);
      out.write("&title=");
      out.print(title);
      out.write("\">Apply</a>\n");
      out.write("                    </div><hr>   \n");
      out.write("                      \n");
      out.write("                    ");
}
                      
                  }else{
                      
                      response.sendRedirect("login.jsp");
                  }  
                    
                  
                    
               
      out.write("\n");
      out.write("                \n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
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
