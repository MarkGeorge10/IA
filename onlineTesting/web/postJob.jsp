<%-- 
    Document   : postJob
    Created on : Dec 21, 2019, 10:09:49 AM
    Author     : Ahmed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post Job</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
        <title>Job</title>
    </head>
    <body>
     
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Post Job</h2>
                        <form method="POST" action="postJob" class="register-form" id="register-form"
                              onsubmit="return checkPost();">
                          
                            <div id="ajaxGetUserServletResponse"  style="color: red"></div>
                            
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="title" id="title" placeholder="Job title"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="level" id="level" placeholder="Job level"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="experience" id="experience" placeholder="Job experience"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="number" name="vacancies" id="vacancies" placeholder="Job vacancies"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="salary" id="salary" placeholder="Job salary"/>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"></label>
                                <textarea rows="12" cols="50" name="responsibilities" id="responsibilities" placeholder="Job responsibilities"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"></label>
                                <textarea rows="12" cols="50" name="requirments" id="requirments" placeholder="Job requirments"></textarea>
                            </div>
   
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="Signup" class="form-submit" value="Post"/>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>

        
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
