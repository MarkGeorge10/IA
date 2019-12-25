<%-- 
    Document   : postJob
    Created on : Dec 21, 2019, 10:09:49 AM
    Author     : Ahmed
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Edit Job</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
        <title>Update Job</title>
    </head>
    <body>
        <%
            
                  if(session.getAttribute("type").equals("hr")){
                        
                            String url = "jdbc:mysql://localhost:3306/onlinetest";
                            String user = "root";
                            String password = "";
                            Connection Con =null;
                            Statement Stmt = null;
                            ResultSet RS = null;

                            Class.forName("com.mysql.jdbc.Driver");
                            Con = DriverManager.getConnection(url, user, password);
                            Stmt = (Statement) Con.createStatement();

                            int hrId = (Integer)session.getAttribute("id");
                            String jobId = request.getParameter("job_id");

                            String query = "Select * from jobs where hr_id='"+hrId+"' and id='"+jobId+"'";
                            RS =Stmt.executeQuery(query);

                        if(RS.next()){%>

                                <section class="signup">
                                    <div class="container">
                                        <div class="signup-content">
                                            <div class="signup-form">
                                                <h2 class="form-title">Update Job</h2>
                                                <form method="POST" action="updateJob" class="register-form" id="register-form"
                                                      onsubmit="return checkPost();">

                                                    <div id="ajaxGetUserServletResponse"  style="color: red"></div>

                                                    <input type="hidden" name="job_id" value='<%=jobId%>'/>
                                                    
                                                    <div class="form-group">
                                                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                                                        <input type="text" name="title" value='<%=RS.getString("title")%>' id="title" placeholder="Job title"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                                        <input type="text" name="level"  value='<%=RS.getString("level")%>' id="level" placeholder="Job level"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                                        <input type="text" name="experience"  value='<%=RS.getString("yearsOfExperience")%>' id="experience" placeholder="Job experience"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                                        <input type="number" name="vacancies"   value='<%=RS.getString("vacances")%>' id="vacancies" placeholder="Job vacancies"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                                        <input type="text" name="salary" id="salary" value='<%=RS.getString("salary")%>'  placeholder="Job salary"/>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"></label>
                                                        <textarea rows="12" cols="50"  name="responsibilities" id="responsibilities" placeholder="Job responsibilities"><%=RS.getString("responsiblites")%></textarea>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="pass"></label>
                                                        <textarea rows="12" cols="50" name="requirments" id="requirments" placeholder="Job requirments"><%=RS.getString("requirments")%></textarea>
                                                    </div>

                                                    <div class="form-group form-button">
                                                        <input type="submit" name="signup" id="Signup" class="form-submit" value="Update"/>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </section>                    

                        <%}
                      
                  }else{
                      response.sendRedirect("hrLogin.jsp");
                  }
        %>
        
        <script>
        
        function checkPost(){
            
            if($('#title').val() === ""){
                $('#ajaxGetUserServletResponse').text("Enter valid title");
                return false;
            }
            if($('#level').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid level");
               return false;
            }
            if($('#vacancies').val() === 0){
               $('#ajaxGetUserServletResponse').text("Enter valid vacancies");
               return false;
            }
            if($('#experience').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid experience");
               return false;
            }
            if($('#salary').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid salary");
               return false;
            }
            if($('#responsibilities').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid responsibilities");
               return false;
            }
            if($('#requirments').val() === ""){
               $('#ajaxGetUserServletResponse').text("Enter valid requirments");
               return false;
            }
            return true;
        }
    </script>

    <script src="vendor/jquery/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    </body>
</html>
