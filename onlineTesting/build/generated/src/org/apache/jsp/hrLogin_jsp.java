package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class hrLogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">\n");
      out.write("    <title>HR Login</title>\n");
      out.write("\n");
      out.write("    <!-- Font Icon -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"fonts/material-icon/css/material-design-iconic-font.min.css\">\n");
      out.write("\n");
      out.write("    <!-- Main css -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <div class=\"main\">\n");
      out.write("\n");
      out.write("        <!-- Sign up form -->\n");
      out.write("        <section class=\"signup\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"signup-content\">\n");
      out.write("                    <div class=\"signup-form\">\n");
      out.write("                        <h2 class=\"form-title\">Login AS HR</h2>\n");
      out.write("                        <form method=\"POST\" action=\"hrLoginValidation\" class=\"register-form\" id=\"register-form\"\n");
      out.write("                              onsubmit=\"return checkHr();\">\n");
      out.write("                          \n");
      out.write("                            <div id=\"ajaxGetUserServletResponse\"  style=\"color: red\">");

                                        if(session.getAttribute("msg")!=null){
                                            out.println(session.getAttribute("msg"));
                                        }
                                
                                
      out.write("</div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"email\"><i class=\"zmdi zmdi-email\"></i></label>\n");
      out.write("                                <input type=\"email\" name=\"email\" id=\"Email\" placeholder=\"Your Email\"/>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"pass\"><i class=\"zmdi zmdi-lock\"></i></label>\n");
      out.write("                                <input type=\"password\" name=\"pass\" id=\"Password\" placeholder=\"Password\"/>\n");
      out.write("                            </div>\n");
      out.write("                            \n");
      out.write("                            <div class=\"form-group form-button\">\n");
      out.write("                                <input type=\"submit\" name=\"signup\" id=\"Signup\" class=\"form-submit\" value=\"Login\"/>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div class=\"signup-image\">\n");
      out.write("                        <figure><img src=\"images/signup-image.jpg\" alt=\"sing up image\"></figure>\n");
      out.write("                        <a href=\"hrRegister.jsp\" class=\"signup-image-link\">Not member? Create Account</a>\n");
      out.write("                        <a href=\"login.jsp\" class=\"signup-image-link\">User Login</a>\n");
      out.write("                        <a href=\"register.jsp\" class=\"signup-image-link\">User Signup</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- JS -->\n");
      out.write("    <script>\n");
      out.write("        \n");
      out.write("        function checkHr(){\n");
      out.write("            if($('#Email').val() === \"\"){\n");
      out.write("                $('#ajaxGetUserServletResponse').text(\"Enter valid email\");\n");
      out.write("                return false;\n");
      out.write("            }\n");
      out.write("            if($('#Password').val() === \"\"){\n");
      out.write("               $('#ajaxGetUserServletResponse').text(\"Enter valid Password\");\n");
      out.write("               return false;\n");
      out.write("            }\n");
      out.write("            return true;\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    <script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("     <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <script src=\"js/main.js\"></script>\n");
      out.write("   </body><!-- This templates was made by Colorlib (https://colorlib.com) -->\n");
      out.write("</html>");
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
